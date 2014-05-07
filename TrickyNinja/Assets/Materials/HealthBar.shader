// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32719,y:32712|diff-12-OUT,spec-102-OUT,emission-12-OUT,alpha-145-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33848,y:32483,ptlb:Base Texture,ptin:_BaseTexture,tex:7357248814f8db246a731a7518998812,ntxv:0,isnm:False|UVIN-6-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3,x:33848,y:32702,ptlb:Pan Texture 1,ptin:_PanTexture1,tex:df839c567d0a4b147a1447b1dea1e3fb,ntxv:0,isnm:False|UVIN-7-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4,x:33848,y:32921,ptlb:Pan Texture 2,ptin:_PanTexture2,tex:26cbde59d7ae2354ba43064ca0ff53ca,ntxv:0,isnm:False|UVIN-8-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5,x:33848,y:33137,ptlb:Pan Texture 3,ptin:_PanTexture3,tex:91af063e06f4c584191e8201fae1567f,ntxv:0,isnm:False|UVIN-9-UVOUT;n:type:ShaderForge.SFN_Panner,id:6,x:34042,y:32469,spu:0.3,spv:0.1;n:type:ShaderForge.SFN_Panner,id:7,x:34042,y:32696,spu:0.4,spv:0.2;n:type:ShaderForge.SFN_Panner,id:8,x:34050,y:32928,spu:0.2,spv:0.1;n:type:ShaderForge.SFN_Panner,id:9,x:34056,y:33136,spu:0.3,spv:0.15;n:type:ShaderForge.SFN_Blend,id:10,x:33560,y:32597,blmd:1,clmp:True|SRC-2-RGB,DST-3-RGB;n:type:ShaderForge.SFN_Blend,id:11,x:33560,y:32788,blmd:1,clmp:True|SRC-10-OUT,DST-4-RGB;n:type:ShaderForge.SFN_Blend,id:12,x:33560,y:32978,blmd:1,clmp:True|SRC-11-OUT,DST-5-RGB;n:type:ShaderForge.SFN_Blend,id:23,x:33555,y:33155,blmd:1,clmp:True|SRC-3-A,DST-4-A;n:type:ShaderForge.SFN_Blend,id:64,x:33561,y:33356,blmd:1,clmp:True|SRC-23-OUT,DST-5-A;n:type:ShaderForge.SFN_HalfVector,id:81,x:33551,y:32319;n:type:ShaderForge.SFN_NormalVector,id:83,x:33550,y:32166,pt:False;n:type:ShaderForge.SFN_Dot,id:85,x:33369,y:32229,dt:0|A-83-OUT,B-81-OUT;n:type:ShaderForge.SFN_Power,id:102,x:33180,y:32375|VAL-85-OUT,EXP-116-OUT;n:type:ShaderForge.SFN_Exp,id:116,x:33384,y:32442,et:1|IN-123-OUT;n:type:ShaderForge.SFN_ValueProperty,id:123,x:33557,y:32494,ptlb:Gloss Value,ptin:_GlossValue,glob:False,v1:6;n:type:ShaderForge.SFN_Tex2d,id:144,x:33844,y:33505,ptlb:Capsule Alpha,ptin:_CapsuleAlpha,tex:517d189368310e64da2079647c1ec0ba,ntxv:0,isnm:False|UVIN-167-UVOUT;n:type:ShaderForge.SFN_Blend,id:145,x:33322,y:33446,blmd:1,clmp:True|SRC-64-OUT,DST-144-A;n:type:ShaderForge.SFN_Panner,id:167,x:34029,y:33505,spu:0,spv:0|UVIN-251-UVOUT,DIST-178-OUT;n:type:ShaderForge.SFN_ValueProperty,id:178,x:34233,y:33628,ptlb:Health Level ,ptin:_HealthLevel,glob:False,v1:7;n:type:ShaderForge.SFN_TexCoord,id:251,x:34234,y:33456,uv:0;proporder:2-3-4-5-123-144-178;pass:END;sub:END;*/

Shader "Custom/HealthBar" {
    Properties {
        _BaseTexture ("Base Texture", 2D) = "white" {}
        _PanTexture1 ("Pan Texture 1", 2D) = "white" {}
        _PanTexture2 ("Pan Texture 2", 2D) = "white" {}
        _PanTexture3 ("Pan Texture 3", 2D) = "white" {}
        _GlossValue ("Gloss Value", Float ) = 6
        _CapsuleAlpha ("Capsule Alpha", 2D) = "white" {}
        _HealthLevel ("Health Level ", Float ) = 7
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
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
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _BaseTexture; uniform float4 _BaseTexture_ST;
            uniform sampler2D _PanTexture1; uniform float4 _PanTexture1_ST;
            uniform sampler2D _PanTexture2; uniform float4 _PanTexture2_ST;
            uniform sampler2D _PanTexture3; uniform float4 _PanTexture3_ST;
            uniform float _GlossValue;
            uniform sampler2D _CapsuleAlpha; uniform float4 _CapsuleAlpha_ST;
            uniform float _HealthLevel;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 uv0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.xyz;
////// Emissive:
                float4 node_303 = _Time + _TimeEditor;
                float2 node_302 = i.uv0;
                float2 node_6 = (node_302.rg+node_303.g*float2(0.3,0.1));
                float2 node_7 = (node_302.rg+node_303.g*float2(0.4,0.2));
                float4 node_3 = tex2D(_PanTexture1,TRANSFORM_TEX(node_7, _PanTexture1));
                float2 node_8 = (node_302.rg+node_303.g*float2(0.2,0.1));
                float4 node_4 = tex2D(_PanTexture2,TRANSFORM_TEX(node_8, _PanTexture2));
                float2 node_9 = (node_302.rg+node_303.g*float2(0.3,0.15));
                float4 node_5 = tex2D(_PanTexture3,TRANSFORM_TEX(node_9, _PanTexture3));
                float3 node_12 = saturate((saturate((saturate((tex2D(_BaseTexture,TRANSFORM_TEX(node_6, _BaseTexture)).rgb*node_3.rgb))*node_4.rgb))*node_5.rgb));
                float3 emissive = node_12;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_102 = pow(dot(i.normalDir,halfDirection),exp2(_GlossValue));
                float3 specularColor = float3(node_102,node_102,node_102);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * node_12;
                finalColor += specular;
                finalColor += emissive;
                float2 node_167 = (i.uv0.rg+_HealthLevel*float2(0,0));
/// Final Color:
                return fixed4(finalColor,saturate((saturate((saturate((node_3.a*node_4.a))*node_5.a))*tex2D(_CapsuleAlpha,TRANSFORM_TEX(node_167, _CapsuleAlpha)).a)));
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
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _BaseTexture; uniform float4 _BaseTexture_ST;
            uniform sampler2D _PanTexture1; uniform float4 _PanTexture1_ST;
            uniform sampler2D _PanTexture2; uniform float4 _PanTexture2_ST;
            uniform sampler2D _PanTexture3; uniform float4 _PanTexture3_ST;
            uniform float _GlossValue;
            uniform sampler2D _CapsuleAlpha; uniform float4 _CapsuleAlpha_ST;
            uniform float _HealthLevel;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 uv0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
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
                float node_102 = pow(dot(i.normalDir,halfDirection),exp2(_GlossValue));
                float3 specularColor = float3(node_102,node_102,node_102);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float4 node_305 = _Time + _TimeEditor;
                float2 node_304 = i.uv0;
                float2 node_6 = (node_304.rg+node_305.g*float2(0.3,0.1));
                float2 node_7 = (node_304.rg+node_305.g*float2(0.4,0.2));
                float4 node_3 = tex2D(_PanTexture1,TRANSFORM_TEX(node_7, _PanTexture1));
                float2 node_8 = (node_304.rg+node_305.g*float2(0.2,0.1));
                float4 node_4 = tex2D(_PanTexture2,TRANSFORM_TEX(node_8, _PanTexture2));
                float2 node_9 = (node_304.rg+node_305.g*float2(0.3,0.15));
                float4 node_5 = tex2D(_PanTexture3,TRANSFORM_TEX(node_9, _PanTexture3));
                float3 node_12 = saturate((saturate((saturate((tex2D(_BaseTexture,TRANSFORM_TEX(node_6, _BaseTexture)).rgb*node_3.rgb))*node_4.rgb))*node_5.rgb));
                finalColor += diffuseLight * node_12;
                finalColor += specular;
                float2 node_167 = (i.uv0.rg+_HealthLevel*float2(0,0));
/// Final Color:
                return fixed4(finalColor * saturate((saturate((saturate((node_3.a*node_4.a))*node_5.a))*tex2D(_CapsuleAlpha,TRANSFORM_TEX(node_167, _CapsuleAlpha)).a)),0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
