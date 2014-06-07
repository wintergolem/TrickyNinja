/*
--------------------------------------------------------------------
------------------------ Default Functions -------------------------
--------------------------------------------------------------------
*/

uint GetId(uint id)
{
	return (uint)((id + bufferOffset) % maxParticles + 0.5f);
		// 0.5 added for correct float->uint rounding on AMD graphic cards
}



#ifndef TC_HOOK_COLOR
/*
This is default color calculation function. It's here to avoid code duplication.
When user's color hook specified, it's not evaluated and instead user's code
is included directly from TCIncColorHook.cginc file
*/
fixed4 particle_color(Particle ptcl) {

	#ifdef TC_COLOUR_SPEED
		float4 tp = float4(length(ptcl.velocity) / maxSpeed, 0.0f, 0.0f, 0.0f);
	#else
		float4 tp = float4(ptcl.life, 0.0f, 0.0f, 0.0f);
	#endif

	float gl = glow + 1.0f;
	return fixed4(
		tex2Dlod(_ColTex, tp).rgba * float4(gl, gl, gl, 1.0f)
	);
}
#endif



/*
--------------------------------------------------------------------
-------------------------- Vertex Functions ------------------------
--------------------------------------------------------------------
*/

#ifdef TC_MESH

	particle_fragment particle_vertex(uint id : SV_VertexID, uint inst : SV_InstanceID)
	{
		particle_fragment o;
		
		inst = GetId(inst);
		
		Particle ptcl = particles[inst];
			// store the current particle's data to writeble variable
			// to let the hooks modify it's values
		
		#ifdef TC_USER_VERT_STRUCT
			tc_user_vert_data vertData; // variable for passing user's values between hooks
		#endif

		#ifdef TC_HOOK_INPUT
			// the hook performed at the very beginning
			// it allows to change some input data
			#include "TCIncHookInput.cginc"
		#endif
		
		// calculate color
		#ifndef TC_HOOK_COLOR
			// default algorythm
			o.col = particle_color(ptcl);
		#else
			// user's color calculation algorythm
			#include "TCIncHookColor.cginc"
		#endif
		
		#ifdef TC_ROTATE
			float angle = ptcl.rotation;

			float c = cos(angle);
			float s = sin(angle);

			float3x3 rotation = float3x3(float3(c, 0, s), float3(0, 1, 0), float3(-s, 0, c));

			float3 cp =	mul(bufPoints[id], rotation);
		#else
			float3 cp = bufPoints[id];
		#endif

		o.uv = uvs[id];
		float4x4 matr = mul(UNITY_MATRIX_VP, TC_MATRIX_M);

		o.pos = mul(matr, float4(ptcl.pos + emitterPos + cp * ptcl.size, 1.0f));

		#ifdef TC_HOOK_OUTPUT
			// the hook performed at the very end of vertex calculation
			#include "TCIncHookOutput.cginc"
		#endif
		
		return o;
	}

#else

	particle_fragment particle_vertex (uint id : SV_VertexID, uint inst : SV_InstanceID)
	{
		particle_fragment o;
		
		inst = GetId(inst);
		
		Particle ptcl = particles[inst];
			// store the current particle's data to writeble variable
			// to let the hooks modify it's values
		
		#ifdef TC_USER_VERT_STRUCT
			tc_user_vert_data vertData; // variable for passing user's values between hooks
		#endif

		#ifdef TC_HOOK_INPUT
			// the hook performed at the very beginning
			// it allows to change some input data
			#include "TCIncHookInput.cginc"
		#endif
		
		// calculate color
		#ifndef TC_HOOK_COLOR
			// default algorythm
			o.col = particle_color(ptcl);
		#else
			// user's color calculation algorythm
			#include "TCIncHookColor.cginc"
		#endif
		
		float4x4 matr = mul(UNITY_MATRIX_VP, TC_MATRIX_M);
		
		float4 pos = mul(matr, float4(ptcl.pos, 1.0f));
		
		float mult = 1.0f;
		
		
		#ifdef TC_PIXEL_SIZE
		
			mult = max(1.0f / _ScreenParams.x, 1.0f / _ScreenParams.y);
			
			#ifdef TC_PERSPECTIVE
				mult *= pos.w;
			#else
				mult *= tcOrthoSize;
			#endif

		#endif
		
		
		#ifdef TC_BILLBOARD
			#ifdef TC_ROTATE
				float angle = ptcl.rotation;

				float c = cos(angle);
				float s = sin(angle);

				float3x3 rotation = float3x3(float3(c, -s, 0), float3(s, c, 0), float3(0, 0, 1));

				o.pos = pos + mul(UNITY_MATRIX_P, mul(bufPoints[id] * ptcl.size * mult, rotation));
			#else
				o.pos = pos + mul(UNITY_MATRIX_P, bufPoints[id] * ptcl.size * mult);
			#endif
		#elif TC_BILLBOARD_STRETCHED || TC_BILLBOARD_TAILSTRETCH
			
			half3 sv = mul((float3x3)UNITY_MATRIX_V, ptcl.velocity) + float3(0.00001f, 0.0f, 0.0f);
			half l = length(sv);
			
			half3 vRight = ptcl.size * sv / l	* mult;
			half3 vUp = float3(vRight.y, -vRight.x, 0.0f);

			o.pos = pos + mul(UNITY_MATRIX_P, float4(bufPoints[id].x * vRight * (1.0f + stretchBuffer[id] * (lengthScale + l * speedScale)) + bufPoints[id].y * vUp, 0.0f) );
		#else
			o.pos = float4(0.0f, 0.0f, 0.0f, 0.0f);
		#endif

		#ifdef TC_UV_SPRITE_ANIM
			half2 uv = bufPoints[id] + 0.5f;
			int sprite = (int)(particles[inst].life * (_SpriteAnimWidth * _SpriteAnimHeight) * _Cycles);
			int x = sprite % (int)_SpriteAnimWidth;
			int y = (int)(sprite / _SpriteAnimWidth);

			o.uv = float2(x * 1.0f / _SpriteAnimWidth, y * 1.0f / _SpriteAnimHeight) + uv * float2( 1.0f / _SpriteAnimWidth, 1.0f / _SpriteAnimHeight);
		#else
			o.uv = bufPoints[id] + 0.5f;
		#endif

		#ifdef TC_OFFSCREEN
			o.projPos = ComputeScreenPos(o.pos);
			o.projPos.z = -mul( UNITY_MATRIX_V, mul(TC_MATRIX_M, float4(ptcl.pos, 0.0f))).z;
		#endif
		
		#ifdef TC_HOOK_OUTPUT
			// the hook performed at the very end of vertex calculation
			#include "TCIncHookOutput.cginc"
		#endif
		
		return o;
	}

#endif