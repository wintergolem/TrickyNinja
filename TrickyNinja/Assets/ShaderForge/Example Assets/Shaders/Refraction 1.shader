// Shader created with Shader Forge Beta 0.34 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:0,limd:1,uamb:False,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:2,dpts:2,wrdp:True,ufog:False,aust:False,igpj:False,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:0,x:33338,y:32442|diff-271-OUT,spec-75-OUT,gloss-76-OUT,normal-215-OUT,transm-29-OUT,lwrap-29-OUT,alpha-22-OUT,refract-14-OUT;n:type:ShaderForge.SFN_Multiply,id:14,x:33677,y:32724|A-309-OUT,B-220-OUT;n:type:ShaderForge.SFN_ComponentMask,id:16,x:33924,y:32557,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-321-OUT;n:type:ShaderForge.SFN_Vector1,id:22,x:33677,y:32651,v1:0.3;n:type:ShaderForge.SFN_Tex2d,id:25,x:34163,y:32573,ptlb:Refraction,ptin:_Refraction,tex:64918bd998b46594e92b3b152c288075,ntxv:2,isnm:False|UVIN-222-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:26,x:34848,y:32472,uv:0;n:type:ShaderForge.SFN_Multiply,id:27,x:34514,y:32566|A-26-UVOUT,B-28-OUT;n:type:ShaderForge.SFN_Vector1,id:28,x:34680,y:32677,v1:1;n:type:ShaderForge.SFN_Vector1,id:29,x:33677,y:32545,v1:1;n:type:ShaderForge.SFN_Vector1,id:75,x:34190,y:32260,v1:4;n:type:ShaderForge.SFN_Vector1,id:76,x:33677,y:32486,v1:0;n:type:ShaderForge.SFN_Lerp,id:215,x:33924,y:32408|A-216-OUT,B-321-OUT,T-396-OUT;n:type:ShaderForge.SFN_Vector3,id:216,x:34085,y:32445,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Fresnel,id:217,x:33847,y:32284;n:type:ShaderForge.SFN_ConstantLerp,id:219,x:33677,y:32284,a:0.02,b:0.2|IN-217-OUT;n:type:ShaderForge.SFN_Multiply,id:220,x:33847,y:32803|A-396-OUT,B-221-OUT;n:type:ShaderForge.SFN_Vector1,id:221,x:34085,y:32831,v1:0.2;n:type:ShaderForge.SFN_Panner,id:222,x:34322,y:32485,spu:0,spv:0.75|UVIN-27-OUT;n:type:ShaderForge.SFN_Color,id:241,x:33741,y:32075,ptlb:WaterColor,ptin:_WaterColor,glob:False,c1:0.03445306,c2:0.01362458,c3:0.6176471,c4:1;n:type:ShaderForge.SFN_Blend,id:271,x:33362,y:32095,blmd:6,clmp:True|SRC-241-RGB,DST-219-OUT;n:type:ShaderForge.SFN_Multiply,id:309,x:33842,y:32699|A-16-OUT,B-25-A;n:type:ShaderForge.SFN_Lerp,id:321,x:34242,y:32755|A-25-RGB,B-327-RGB,T-381-G;n:type:ShaderForge.SFN_Tex2d,id:327,x:34484,y:32831,ptlb:node_327,ptin:_node_327,tex:5d5b7e333bb427b41829295a77add215,ntxv:2,isnm:False|UVIN-338-UVOUT;n:type:ShaderForge.SFN_Panner,id:338,x:34749,y:32859,spu:0,spv:0.5|UVIN-359-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:359,x:35025,y:32822,uv:0;n:type:ShaderForge.SFN_VertexColor,id:381,x:34576,y:33032;n:type:ShaderForge.SFN_ValueProperty,id:396,x:34137,y:32960,ptlb:Refraction_intensity,ptin:_Refraction_intensity,glob:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:406,x:33650,y:32610,v1:0;proporder:25-241-327-396;pass:END;sub:END;*/

Shader "Shader Forge/Examples/Refraction" {
    Properties {
        _Refraction ("Refraction", 2D) = "black" {}
        _WaterColor ("WaterColor", Color) = (0.03445306,0.01362458,0.6176471,1)
        _node_327 ("node_327", 2D) = "black" {}
        _Refraction_intensity ("Refraction_intensity", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles xbox360 ps3 flash 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform sampler2D _Refraction; uniform float4 _Refraction_ST;
            uniform float4 _WaterColor;
            uniform sampler2D _node_327; uniform float4 _node_327_ST;
            uniform float _Refraction_intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                float4 screenPos : TEXCOORD5;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(6,7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float4 node_467 = _Time + _TimeEditor;
                float2 node_222 = ((i.uv0.rg*1.0)+node_467.g*float2(0,0.75));
                float4 node_25 = tex2D(_Refraction,TRANSFORM_TEX(node_222, _Refraction));
                float2 node_338 = (i.uv0.rg+node_467.g*float2(0,0.5));
                float3 node_321 = lerp(node_25.rgb,tex2D(_node_327,TRANSFORM_TEX(node_338, _node_327)).rgb,i.vertexColor.g);
                float3 normalLocal = lerp(float3(0,0,1),node_321,_Refraction_intensity);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + ((node_321.rg*node_25.a)*(_Refraction_intensity*0.2));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float node_29 = 1.0;
                float3 w = float3(node_29,node_29,node_29)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 backLight = max(float3(0.0,0.0,0.0), -NdotLWrap + w ) * float3(node_29,node_29,node_29);
                float3 diffuse = (forwardLight+backLight) * attenColor;
///////// Gloss:
                float gloss = 0.0;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_75 = 4.0;
                float3 specularColor = float3(node_75,node_75,node_75);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * saturate((1.0-(1.0-_WaterColor.rgb)*(1.0-lerp(0.02,0.2,(1.0-max(0,dot(normalDirection, viewDirection)))))));
                finalColor += specular;
/// Final Color:
                return fixed4(lerp(sceneColor.rgb, finalColor,0.3),1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers gles xbox360 ps3 flash 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform sampler2D _Refraction; uniform float4 _Refraction_ST;
            uniform float4 _WaterColor;
            uniform sampler2D _node_327; uniform float4 _node_327_ST;
            uniform float _Refraction_intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                float4 screenPos : TEXCOORD5;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(6,7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float4 node_468 = _Time + _TimeEditor;
                float2 node_222 = ((i.uv0.rg*1.0)+node_468.g*float2(0,0.75));
                float4 node_25 = tex2D(_Refraction,TRANSFORM_TEX(node_222, _Refraction));
                float2 node_338 = (i.uv0.rg+node_468.g*float2(0,0.5));
                float3 node_321 = lerp(node_25.rgb,tex2D(_node_327,TRANSFORM_TEX(node_338, _node_327)).rgb,i.vertexColor.g);
                float3 normalLocal = lerp(float3(0,0,1),node_321,_Refraction_intensity);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + ((node_321.rg*node_25.a)*(_Refraction_intensity*0.2));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float node_29 = 1.0;
                float3 w = float3(node_29,node_29,node_29)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 backLight = max(float3(0.0,0.0,0.0), -NdotLWrap + w ) * float3(node_29,node_29,node_29);
                float3 diffuse = (forwardLight+backLight) * attenColor;
///////// Gloss:
                float gloss = 0.0;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_75 = 4.0;
                float3 specularColor = float3(node_75,node_75,node_75);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * saturate((1.0-(1.0-_WaterColor.rgb)*(1.0-lerp(0.02,0.2,(1.0-max(0,dot(normalDirection, viewDirection)))))));
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 0.3,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
