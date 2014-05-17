// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32719,y:32712|diff-21-OUT,spec-282-OUT,normal-118-RGB,emission-104-OUT,amdfl-360-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33734,y:32653,ptlb:LayerOne,ptin:_LayerOne,tex:ff6558d352d413f48b0680db59dd8add,ntxv:0,isnm:False|UVIN-4-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3,x:34188,y:32653,uv:0;n:type:ShaderForge.SFN_Panner,id:4,x:33962,y:32653,spu:-0.1,spv:0.1|UVIN-3-UVOUT;n:type:ShaderForge.SFN_Color,id:5,x:33924,y:32844,ptlb:Color1,ptin:_Color1,glob:False,c1:0.5241136,c2:0,c3:0.9632353,c4:1;n:type:ShaderForge.SFN_Power,id:7,x:33696,y:32844|VAL-5-RGB,EXP-9-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9,x:33903,y:33022,ptlb:Color1 Intensity,ptin:_Color1Intensity,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:10,x:33485,y:32653|A-2-RGB,B-7-OUT;n:type:ShaderForge.SFN_TexCoord,id:11,x:34224,y:33383,uv:0;n:type:ShaderForge.SFN_Panner,id:12,x:34004,y:33383,spu:0.1,spv:-0.1|UVIN-11-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:13,x:33756,y:33383,ptlb:LayerTwo,ptin:_LayerTwo,tex:668c6655ede1800458b78447e4e2b79b,ntxv:0,isnm:False|UVIN-12-UVOUT;n:type:ShaderForge.SFN_Multiply,id:14,x:33484,y:33395|A-13-RGB,B-17-OUT;n:type:ShaderForge.SFN_ValueProperty,id:15,x:33903,y:33113,ptlb:Color2 Intensity,ptin:_Color2Intensity,glob:False,v1:1;n:type:ShaderForge.SFN_Color,id:16,x:33940,y:33215,ptlb:color2,ptin:_color2,glob:False,c1:0.3551724,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Power,id:17,x:33714,y:33173|VAL-16-RGB,EXP-15-OUT;n:type:ShaderForge.SFN_Add,id:18,x:33478,y:33064|A-10-OUT,B-14-OUT;n:type:ShaderForge.SFN_Tex2d,id:19,x:34050,y:32284,ptlb:Layer 3,ptin:_Layer3,tex:9c2411d867b07ad49ba9e57bbbe20b25,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:20,x:34068,y:32474,ptlb:Layer3Color,ptin:_Layer3Color,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:21,x:33236,y:32278|A-19-RGB,B-20-RGB,C-102-G;n:type:ShaderForge.SFN_Tex2d,id:102,x:33413,y:32797,ptlb:RedGreenChannelMask,ptin:_RedGreenChannelMask,tex:8f92adc8dba7d6149911c777f7036c01,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:104,x:33126,y:32795|A-21-OUT,B-18-OUT,T-102-R;n:type:ShaderForge.SFN_Tex2d,id:118,x:33176,y:32588,ptlb:Rock Normal,ptin:_RockNormal,tex:0fc84f7b5d2d2eb408a2054e2c9c8422,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:271,x:33705,y:32458,ptlb:Specular,ptin:_Specular,tex:4c3999b386b501943b187563a982fd84,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:282,x:33236,y:32446|A-271-RGB,B-285-OUT;n:type:ShaderForge.SFN_ValueProperty,id:285,x:33425,y:32544,ptlb:SpecularValue,ptin:_SpecularValue,glob:False,v1:0.2;n:type:ShaderForge.SFN_Tex2d,id:349,x:33351,y:33047,ptlb:Diffuse Ambient ight,ptin:_DiffuseAmbientight,tex:04af745562aaecd43aa3f27db25b77f1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:360,x:33011,y:32967|A-349-RGB,B-362-RGB;n:type:ShaderForge.SFN_Color,id:362,x:33200,y:33113,ptlb:DiffuseAmbLightColor,ptin:_DiffuseAmbLightColor,glob:False,c1:0.145098,c2:0.3411765,c3:0.6862745,c4:0.4509804;proporder:2-5-9-13-15-16-19-20-102-118-271-285-349-362;pass:END;sub:END;*/

Shader "Shader Forge/VM_ElementalSolid" {
    Properties {
        _LayerOne ("LayerOne", 2D) = "white" {}
        _Color1 ("Color1", Color) = (0.5241136,0,0.9632353,1)
        _Color1Intensity ("Color1 Intensity", Float ) = 1
        _LayerTwo ("LayerTwo", 2D) = "white" {}
        _Color2Intensity ("Color2 Intensity", Float ) = 1
        _color2 ("color2", Color) = (0.3551724,1,1,1)
        _Layer3 ("Layer 3", 2D) = "white" {}
        _Layer3Color ("Layer3Color", Color) = (0.5,0.5,0.5,1)
        _RedGreenChannelMask ("RedGreenChannelMask", 2D) = "white" {}
        _RockNormal ("Rock Normal", 2D) = "black" {}
        _Specular ("Specular", 2D) = "white" {}
        _SpecularValue ("SpecularValue", Float ) = 0.2
        _DiffuseAmbientight ("Diffuse Ambient ight", 2D) = "white" {}
        _DiffuseAmbLightColor ("DiffuseAmbLightColor", Color) = (0.145098,0.3411765,0.6862745,0.4509804)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _LayerOne; uniform float4 _LayerOne_ST;
            uniform float4 _Color1;
            uniform float _Color1Intensity;
            uniform sampler2D _LayerTwo; uniform float4 _LayerTwo_ST;
            uniform float _Color2Intensity;
            uniform float4 _color2;
            uniform sampler2D _Layer3; uniform float4 _Layer3_ST;
            uniform float4 _Layer3Color;
            uniform sampler2D _RedGreenChannelMask; uniform float4 _RedGreenChannelMask_ST;
            uniform sampler2D _RockNormal; uniform float4 _RockNormal_ST;
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform float _SpecularValue;
            uniform sampler2D _DiffuseAmbientight; uniform float4 _DiffuseAmbientight_ST;
            uniform float4 _DiffuseAmbLightColor;
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
                float2 node_2560 = i.uv0;
                float3 normalLocal = tex2D(_RockNormal,TRANSFORM_TEX(node_2560.rg, _RockNormal)).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.xyz;
////// Emissive:
                float4 node_102 = tex2D(_RedGreenChannelMask,TRANSFORM_TEX(node_2560.rg, _RedGreenChannelMask));
                float3 node_21 = (tex2D(_Layer3,TRANSFORM_TEX(node_2560.rg, _Layer3)).rgb*_Layer3Color.rgb*node_102.g);
                float4 node_2559 = _Time + _TimeEditor;
                float2 node_4 = (i.uv0.rg+node_2559.g*float2(-0.1,0.1));
                float2 node_12 = (i.uv0.rg+node_2559.g*float2(0.1,-0.1));
                float3 emissive = lerp(node_21,((tex2D(_LayerOne,TRANSFORM_TEX(node_4, _LayerOne)).rgb*pow(_Color1.rgb,_Color1Intensity))+(tex2D(_LayerTwo,TRANSFORM_TEX(node_12, _LayerTwo)).rgb*pow(_color2.rgb,_Color2Intensity))),node_102.r);
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = (tex2D(_Specular,TRANSFORM_TEX(node_2560.rg, _Specular)).rgb*_SpecularValue);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                diffuseLight += (tex2D(_DiffuseAmbientight,TRANSFORM_TEX(node_2560.rg, _DiffuseAmbientight)).rgb*_DiffuseAmbLightColor.rgb); // Diffuse Ambient Light
                finalColor += diffuseLight * node_21;
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _LayerOne; uniform float4 _LayerOne_ST;
            uniform float4 _Color1;
            uniform float _Color1Intensity;
            uniform sampler2D _LayerTwo; uniform float4 _LayerTwo_ST;
            uniform float _Color2Intensity;
            uniform float4 _color2;
            uniform sampler2D _Layer3; uniform float4 _Layer3_ST;
            uniform float4 _Layer3Color;
            uniform sampler2D _RedGreenChannelMask; uniform float4 _RedGreenChannelMask_ST;
            uniform sampler2D _RockNormal; uniform float4 _RockNormal_ST;
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform float _SpecularValue;
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
                float2 node_2562 = i.uv0;
                float3 normalLocal = tex2D(_RockNormal,TRANSFORM_TEX(node_2562.rg, _RockNormal)).rgb;
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
                float3 specularColor = (tex2D(_Specular,TRANSFORM_TEX(node_2562.rg, _Specular)).rgb*_SpecularValue);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float4 node_102 = tex2D(_RedGreenChannelMask,TRANSFORM_TEX(node_2562.rg, _RedGreenChannelMask));
                float3 node_21 = (tex2D(_Layer3,TRANSFORM_TEX(node_2562.rg, _Layer3)).rgb*_Layer3Color.rgb*node_102.g);
                finalColor += diffuseLight * node_21;
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
