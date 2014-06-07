// Shader created with Shader Forge Beta 0.34 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:False,mssp:True,lmpd:True,lprd:True,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1280277,fgcg:0.1953466,fgcb:0.2352941,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32236,y:32307|diff-2257-OUT,spec-1838-RGB,normal-2024-OUT,emission-2257-OUT;n:type:ShaderForge.SFN_Color,id:27,x:33926,y:32610,ptlb:Emission Color,ptin:_EmissionColor,glob:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_TexCoord,id:368,x:34019,y:32381,uv:0;n:type:ShaderForge.SFN_Panner,id:482,x:33830,y:32381,spu:0.03,spv:-0.03|UVIN-368-UVOUT;n:type:ShaderForge.SFN_Vector1,id:752,x:33964,y:33529,v1:1;n:type:ShaderForge.SFN_Tex2d,id:813,x:33616,y:32381,ptlb:Rotation Layer 2,ptin:_RotationLayer2,tex:ff6558d352d413f48b0680db59dd8add,ntxv:0,isnm:False|UVIN-482-UVOUT;n:type:ShaderForge.SFN_Multiply,id:832,x:33332,y:32415|A-813-RGB,B-1564-OUT;n:type:ShaderForge.SFN_TexCoord,id:844,x:34047,y:32964,cmnt:This Node simply tells which set of UVs on the model it will need to manipulate.Default is set 0. Will have unpredictable effects if a uv set that the model doesnt have is selected.,uv:0;n:type:ShaderForge.SFN_Panner,id:845,x:33826,y:32916,cmnt:Movement is set using the U and V fields below. Positive and Negative values control direction Values themselves are the speed.,spu:-0.02,spv:0.02|UVIN-844-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:846,x:33646,y:32909,ptlb:Rotation Layer ,ptin:_RotationLayer,cmnt:This Branch Controlls the speed and direction of Layer2s UV panning,tex:668c6655ede1800458b78447e4e2b79b,ntxv:0,isnm:False|UVIN-845-UVOUT;n:type:ShaderForge.SFN_Color,id:856,x:34051,y:33303,ptlb:Rotation 1 Color,ptin:_Rotation1Color,glob:False,c1:1,c2:0.9076215,c3:0,c4:1;n:type:ShaderForge.SFN_Power,id:857,x:33840,y:33292|VAL-856-RGB,EXP-752-OUT;n:type:ShaderForge.SFN_Add,id:858,x:33163,y:32727|A-832-OUT,B-902-OUT;n:type:ShaderForge.SFN_Multiply,id:902,x:33339,y:32993|A-846-RGB,B-857-OUT;n:type:ShaderForge.SFN_Tex2d,id:1256,x:33748,y:31760,ptlb:Diffuse,ptin:_Diffuse,tex:7d62cab0cf101284c96939e5d19a3f86,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1334,x:33176,y:33154,ptlb:Stationary Layer Mask,ptin:_StationaryLayerMask,tex:e737f6a5bc169744f9811703dce0970a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:1394,x:32930,y:32727|A-858-OUT,B-1503-OUT,T-1334-A;n:type:ShaderForge.SFN_Multiply,id:1503,x:33401,y:31760|A-1256-RGB,B-1504-RGB;n:type:ShaderForge.SFN_Color,id:1504,x:33748,y:31974,ptlb:Diffuse Tint,ptin:_DiffuseTint,glob:False,c1:0.1911765,c2:0.1911765,c3:0.1911765,c4:1;n:type:ShaderForge.SFN_Power,id:1564,x:33495,y:32595|VAL-27-RGB,EXP-1565-OUT;n:type:ShaderForge.SFN_Vector1,id:1565,x:33720,y:32692,v1:2;n:type:ShaderForge.SFN_Tex2d,id:1827,x:32837,y:31903,ptlb:Rockm11111ormal,ptin:_Rockm11111ormal,tex:e397ba01720c4fb4faf46c4bc99d56eb,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:1838,x:32886,y:32127,ptlb:RockSpecular,ptin:_RockSpecular,tex:89468135a1deefb4f80c1750af3c8a37,ntxv:0,isnm:False|MIP-2068-OUT;n:type:ShaderForge.SFN_Multiply,id:2024,x:32606,y:31903|A-1827-RGB,B-2025-OUT;n:type:ShaderForge.SFN_Vector1,id:2025,x:32692,y:32056,v1:1;n:type:ShaderForge.SFN_Slider,id:2068,x:32478,y:32860,ptlb:node_2068,ptin:_node_2068,min:0,cur:2.100214,max:11;n:type:ShaderForge.SFN_VertexColor,id:2241,x:32930,y:32472;n:type:ShaderForge.SFN_Lerp,id:2257,x:32563,y:32398|A-1503-OUT,B-1394-OUT,T-2241-R;n:type:ShaderForge.SFN_Lerp,id:2294,x:32606,y:31769|A-1503-OUT,B-1503-OUT,T-2241-G;proporder:27-813-846-856-1256-1334-1504-1827-1838-2068;pass:END;sub:END;*/

Shader "Shader Forge/Burning" {
    Properties {
        _EmissionColor ("Emission Color", Color) = (1,0,0,1)
        _RotationLayer2 ("Rotation Layer 2", 2D) = "white" {}
        _RotationLayer ("Rotation Layer ", 2D) = "white" {}
        _Rotation1Color ("Rotation 1 Color", Color) = (1,0.9076215,0,1)
        _Diffuse ("Diffuse", 2D) = "white" {}
        _StationaryLayerMask ("Stationary Layer Mask", 2D) = "white" {}
        _DiffuseTint ("Diffuse Tint", Color) = (0.1911765,0.1911765,0.1911765,1)
        _Rockm11111ormal ("Rockm11111ormal", 2D) = "bump" {}
        _RockSpecular ("RockSpecular", 2D) = "white" {}
        _node_2068 ("node_2068", Range(0, 11)) = 2.100214
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            #ifndef LIGHTMAP_OFF
                float4 unity_LightmapST;
                sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform float4 _EmissionColor;
            uniform sampler2D _RotationLayer2; uniform float4 _RotationLayer2_ST;
            uniform sampler2D _RotationLayer; uniform float4 _RotationLayer_ST;
            uniform float4 _Rotation1Color;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform sampler2D _StationaryLayerMask; uniform float4 _StationaryLayerMask_ST;
            uniform float4 _DiffuseTint;
            uniform sampler2D _Rockm11111ormal; uniform float4 _Rockm11111ormal_ST;
            uniform sampler2D _RockSpecular; uniform float4 _RockSpecular_ST;
            uniform float _node_2068;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
                #ifndef LIGHTMAP_OFF
                    float2 uvLM : TEXCOORD7;
                #else
                    float3 shLight : TEXCOORD7;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                #ifdef LIGHTMAP_OFF
                    o.shLight = ShadeSH9(float4(mul(_Object2World, float4(v.normal,0)).xyz * unity_Scale.w,1)) * 0.5;
                #endif
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                #ifndef LIGHTMAP_OFF
                    o.uvLM = v.texcoord1 * unity_LightmapST.xy + unity_LightmapST.zw;
                #endif
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_2316 = i.uv0;
                float3 normalLocal = (UnpackNormal(tex2D(_Rockm11111ormal,TRANSFORM_TEX(node_2316.rg, _Rockm11111ormal))).rgb*1.0);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                #ifndef LIGHTMAP_OFF
                    float4 lmtex = tex2D(unity_Lightmap,i.uvLM);
                    #ifndef DIRLIGHTMAP_OFF
                        float3 lightmap = DecodeLightmap(lmtex);
                        float3 scalePerBasisVector = DecodeLightmap(tex2D(unity_LightmapInd,i.uvLM));
                        UNITY_DIRBASIS
                        half3 normalInRnmBasis = saturate (mul (unity_DirBasis, normalLocal));
                        lightmap *= dot (normalInRnmBasis, scalePerBasisVector);
                    #else
                        float3 lightmap = DecodeLightmap(lmtex);
                    #endif
                #endif
                #ifndef LIGHTMAP_OFF
                    #ifdef DIRLIGHTMAP_OFF
                        float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                    #else
                        float3 lightDirection = normalize (scalePerBasisVector.x * unity_DirBasis[0] + scalePerBasisVector.y * unity_DirBasis[1] + scalePerBasisVector.z * unity_DirBasis[2]);
                        lightDirection = mul(lightDirection,tangentTransform); // Tangent to world
                    #endif
                #else
                    float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                #endif
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                #ifndef LIGHTMAP_OFF
                    float3 diffuse = lightmap.rgb;
                #else
                    float3 diffuse = max( 0.0, NdotL) * attenColor;
                #endif
////// Emissive:
                float3 node_1503 = (tex2D(_Diffuse,TRANSFORM_TEX(node_2316.rg, _Diffuse)).rgb*_DiffuseTint.rgb);
                float4 node_2315 = _Time + _TimeEditor;
                float2 node_482 = (i.uv0.rg+node_2315.g*float2(0.03,-0.03));
                float2 node_845 = (i.uv0.rg+node_2315.g*float2(-0.02,0.02)); // Movement is set using the U and V fields below. Positive and Negative values control direction Values themselves are the speed.
                float4 node_2241 = i.vertexColor;
                float3 node_2257 = lerp(node_1503,lerp(((tex2D(_RotationLayer2,TRANSFORM_TEX(node_482, _RotationLayer2)).rgb*pow(_EmissionColor.rgb,2.0))+(tex2D(_RotationLayer,TRANSFORM_TEX(node_845, _RotationLayer)).rgb*pow(_Rotation1Color.rgb,1.0))),node_1503,tex2D(_StationaryLayerMask,TRANSFORM_TEX(node_2316.rg, _StationaryLayerMask)).a),node_2241.r);
                float3 emissive = node_2257;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = tex2Dlod(_RockSpecular,float4(TRANSFORM_TEX(node_2316.rg, _RockSpecular),0.0,_node_2068)).rgb;
                float3 specular = 1 * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                #ifndef LIGHTMAP_OFF
                    #ifndef DIRLIGHTMAP_OFF
                        specular *= lightmap;
                    #else
                        specular *= (floor(attenuation) * _LightColor0.xyz);
                    #endif
                #else
                    specular *= (floor(attenuation) * _LightColor0.xyz);
                #endif
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                #ifdef LIGHTMAP_OFF
                    diffuseLight += i.shLight; // Per-Vertex Light Probes / Spherical harmonics
                #endif
                finalColor += diffuseLight * node_2257;
                finalColor += specular;
                finalColor += emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            #ifndef LIGHTMAP_OFF
                float4 unity_LightmapST;
                sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform float4 _EmissionColor;
            uniform sampler2D _RotationLayer2; uniform float4 _RotationLayer2_ST;
            uniform sampler2D _RotationLayer; uniform float4 _RotationLayer_ST;
            uniform float4 _Rotation1Color;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform sampler2D _StationaryLayerMask; uniform float4 _StationaryLayerMask_ST;
            uniform float4 _DiffuseTint;
            uniform sampler2D _Rockm11111ormal; uniform float4 _Rockm11111ormal_ST;
            uniform sampler2D _RockSpecular; uniform float4 _RockSpecular_ST;
            uniform float _node_2068;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
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
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_2318 = i.uv0;
                float3 normalLocal = (UnpackNormal(tex2D(_Rockm11111ormal,TRANSFORM_TEX(node_2318.rg, _Rockm11111ormal))).rgb*1.0);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = tex2Dlod(_RockSpecular,float4(TRANSFORM_TEX(node_2318.rg, _RockSpecular),0.0,_node_2068)).rgb;
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float3 node_1503 = (tex2D(_Diffuse,TRANSFORM_TEX(node_2318.rg, _Diffuse)).rgb*_DiffuseTint.rgb);
                float4 node_2317 = _Time + _TimeEditor;
                float2 node_482 = (i.uv0.rg+node_2317.g*float2(0.03,-0.03));
                float2 node_845 = (i.uv0.rg+node_2317.g*float2(-0.02,0.02)); // Movement is set using the U and V fields below. Positive and Negative values control direction Values themselves are the speed.
                float4 node_2241 = i.vertexColor;
                float3 node_2257 = lerp(node_1503,lerp(((tex2D(_RotationLayer2,TRANSFORM_TEX(node_482, _RotationLayer2)).rgb*pow(_EmissionColor.rgb,2.0))+(tex2D(_RotationLayer,TRANSFORM_TEX(node_845, _RotationLayer)).rgb*pow(_Rotation1Color.rgb,1.0))),node_1503,tex2D(_StationaryLayerMask,TRANSFORM_TEX(node_2318.rg, _StationaryLayerMask)).a),node_2241.r);
                finalColor += diffuseLight * node_2257;
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
