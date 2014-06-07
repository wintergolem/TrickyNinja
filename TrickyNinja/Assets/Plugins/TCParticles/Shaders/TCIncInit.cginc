#include "UnityCG.cginc"
#pragma target 5.0

StructuredBuffer<Particle> particles : register(cs_5_0, u[0]);

sampler2D _ColTex;
float4 emitterPos;

float glow;

#ifdef TC_MESH
	StructuredBuffer<float2> uvs;
#endif

StructuredBuffer<float3> bufPoints;


#ifndef TC_BILLBOARD
#ifndef TC_MESH
	float speedScale;
	float lengthScale;
#endif
#endif


#ifdef TC_BILLBOARD_STRETCHED
	StructuredBuffer<float> stretchBuffer;
#endif

#ifdef TC_BILLBOARD_TAILSTRETCH
	StructuredBuffer<float> stretchBuffer;
#endif

#ifdef TC_COLOUR_SPEED
	float maxSpeed;
#endif



float bufferOffset;
float maxParticles;
float tcOrthoSize;

#ifdef TC_UV_SPRITE_ANIM
	float _SpriteAnimWidth;
	float _SpriteAnimHeight;

	float4 _SpriteAnimUv;

	float _Cycles;
#endif




float4x4 TC_MATRIX_M;
float4x4 TC_MATRIX_V;

float4x4 TC_MATRIX_VP;