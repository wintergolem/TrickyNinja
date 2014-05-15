// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:False,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1280277,fgcg:0.1953466,fgcb:0.2352941,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32236,y:32307|diff-1503-OUT,spec-1838-RGB,normal-2024-OUT,emission-1394-OUT;n:type:ShaderForge.SFN_Color,id:27,x:33926,y:32610,ptlb:Emission Color,ptin:_EmissionColor,glob:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_TexCoord,id:368,x:34019,y:32381,uv:0;n:type:ShaderForge.SFN_Panner,id:482,x:33830,y:32381,spu:0.02,spv:-0.02|UVIN-368-UVOUT;n:type:ShaderForge.SFN_Vector1,id:752,x:33964,y:33529,v1:1;n:type:ShaderForge.SFN_Tex2d,id:813,x:33616,y:32381,ptlb:Rotation Layer 2,ptin:_RotationLayer2,tex:ff6558d352d413f48b0680db59dd8add,ntxv:0,isnm:False|UVIN-482-UVOUT;n:type:ShaderForge.SFN_Multiply,id:832,x:33332,y:32415|A-813-RGB,B-1564-OUT;n:type:ShaderForge.SFN_TexCoord,id:844,x:34047,y:32964,cmnt:This Node simply tells which set of UVs on the model it will need to manipulate.Default is set 0. Will have unpredictable effects if a uv set that the model doesnt have is selected.,uv:0;n:type:ShaderForge.SFN_Panner,id:845,x:33826,y:32916,cmnt:Movement is set using the U and V fields below. Positive and Negative values control direction Values themselves are the speed.,spu:-0.02,spv:0.02|UVIN-844-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:846,x:33646,y:32909,ptlb:Rotation Layer ,ptin:_RotationLayer,cmnt:This Branch Controlls the speed and direction of Layer2s UV panning,tex:668c6655ede1800458b78447e4e2b79b,ntxv:0,isnm:False|UVIN-845-UVOUT;n:type:ShaderForge.SFN_Color,id:856,x:34051,y:33303,ptlb:Rotation 1 Color,ptin:_Rotation1Color,glob:False,c1:1,c2:0.9076215,c3:0,c4:1;n:type:ShaderForge.SFN_Power,id:857,x:33840,y:33292|VAL-856-RGB,EXP-752-OUT;n:type:ShaderForge.SFN_Add,id:858,x:33163,y:32727|A-832-OUT,B-902-OUT;n:type:ShaderForge.SFN_Multiply,id:902,x:33339,y:32993|A-846-RGB,B-857-OUT;n:type:ShaderForge.SFN_Tex2d,id:1256,x:33207,y:32159,ptlb:Diffuse,ptin:_Diffuse,tex:7d62cab0cf101284c96939e5d19a3f86,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1334,x:33176,y:33154,ptlb:Stationary Layer Mask,ptin:_StationaryLayerMask,tex:e737f6a5bc169744f9811703dce0970a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:1394,x:32930,y:32727|A-858-OUT,B-1503-OUT,T-1334-A;n:type:ShaderForge.SFN_Multiply,id:1503,x:32891,y:32133|A-1256-RGB,B-1504-RGB;n:type:ShaderForge.SFN_Color,id:1504,x:32929,y:32318,ptlb:Diffuse Tint,ptin:_DiffuseTint,glob:False,c1:0.1911765,c2:0.1911765,c3:0.1911765,c4:1;n:type:ShaderForge.SFN_Power,id:1564,x:33495,y:32595|VAL-27-RGB,EXP-1565-OUT;n:type:ShaderForge.SFN_Vector1,id:1565,x:33720,y:32692,v1:2;n:type:ShaderForge.SFN_Tex2d,id:1827,x:32983,y:31878,ptlb:Rockm11111ormal,ptin:_Rockm11111ormal,tex:e397ba01720c4fb4faf46c4bc99d56eb,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:1838,x:32539,y:32643,ptlb:RockSpecular,ptin:_RockSpecular,tex:89468135a1deefb4f80c1750af3c8a37,ntxv:0,isnm:False|MIP-2068-OUT;n:type:ShaderForge.SFN_Multiply,id:2024,x:32620,y:31907|A-1827-RGB,B-2025-OUT;n:type:ShaderForge.SFN_Vector1,id:2025,x:32806,y:32062,v1:1;n:type:ShaderForge.SFN_Slider,id:2068,x:32478,y:32860,ptlb:node_2068,ptin:_node_2068,min:0,cur:2.100214,max:11;proporder:27-813-846-856-1256-1334-1504-1827-1838-2068;pass:END;sub:END;*/

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
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
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
                float4 uv0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_2238 = i.uv0;
                float3 normalLocal = (UnpackNormal(tex2D(_Rockm11111ormal,TRANSFORM_TEX(node_2238.rg, _Rockm11111ormal))).rgb*1.0);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
////// Emissive:
                float4 node_2237 = _Time + _TimeEditor;
                float2 node_482 = (i.uv0.rg+node_2237.g*float2(0.02,-0.02));
                float2 node_845 = (i.uv0.rg+node_2237.g*float2(-0.02,0.02)); // Movement is set using the U and V fields below. Positive and Negative values control direction Values themselves are the speed.
                float3 node_1503 = (tex2D(_Diffuse,TRANSFORM_TEX(node_2238.rg, _Diffuse)).rgb*_DiffuseTint.rgb);
                float3 emissive = lerp(((tex2D(_RotationLayer2,TRANSFORM_TEX(node_482, _RotationLayer2)).rgb*pow(_EmissionColor.rgb,2.0))+(tex2D(_RotationLayer,TRANSFORM_TEX(node_845, _RotationLayer)).rgb*pow(_Rotation1Color.rgb,1.0))),node_1503,tex2D(_StationaryLayerMask,TRANSFORM_TEX(node_2238.rg, _StationaryLayerMask)).a);
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = tex2Dlod(_RockSpecular,float4(TRANSFORM_TEX(node_2238.rg, _RockSpecular),0.0,_node_2068)).rgb;
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * node_1503;
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
            ZWrite Off
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
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
                float4 uv0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
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
                float2 node_2240 = i.uv0;
                float3 normalLocal = (UnpackNormal(tex2D(_Rockm11111ormal,TRANSFORM_TEX(node_2240.rg, _Rockm11111ormal))).rgb*1.0);
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
                float3 specularColor = tex2Dlod(_RockSpecular,float4(TRANSFORM_TEX(node_2240.rg, _RockSpecular),0.0,_node_2068)).rgb;
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float3 node_1503 = (tex2D(_Diffuse,TRANSFORM_TEX(node_2240.rg, _Diffuse)).rgb*_DiffuseTint.rgb);
                finalColor += diffuseLight * node_1503;
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
