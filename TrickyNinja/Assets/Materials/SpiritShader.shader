// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32719,y:32712|emission-10-OUT,custl-237-OUT,alpha-223-OUT;n:type:ShaderForge.SFN_Color,id:2,x:33431,y:32746,ptlb:Dark Color,ptin:_DarkColor,glob:False,c1:0.2558391,c2:0.3099928,c3:0.6691177,c4:1;n:type:ShaderForge.SFN_Time,id:4,x:33953,y:32947;n:type:ShaderForge.SFN_ValueProperty,id:5,x:33955,y:32869,ptlb:Flicker Speed,ptin:_FlickerSpeed,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:6,x:33765,y:32899|A-5-OUT,B-4-T;n:type:ShaderForge.SFN_Sin,id:7,x:33598,y:32900|IN-6-OUT;n:type:ShaderForge.SFN_RemapRange,id:9,x:33428,y:32900,frmn:-1,frmx:1,tomn:0,tomx:1|IN-7-OUT;n:type:ShaderForge.SFN_Lerp,id:10,x:33196,y:32812|A-12-RGB,B-2-RGB,T-9-OUT;n:type:ShaderForge.SFN_Color,id:12,x:33432,y:32576,ptlb:Light Color,ptin:_LightColor,glob:False,c1:0.299362,c2:0.4569853,c3:0.8308824,c4:1;n:type:ShaderForge.SFN_Tex2d,id:14,x:33843,y:33078,ptlb:Particle 1,ptin:_Particle1,tex:e86309e208f6f8448bc8f47480da449f,ntxv:0,isnm:False|UVIN-15-UVOUT;n:type:ShaderForge.SFN_Panner,id:15,x:34042,y:33076,spu:0.4,spv:0.3;n:type:ShaderForge.SFN_Color,id:117,x:33840,y:33268,ptlb:Particle 1 Color,ptin:_Particle1Color,glob:False,c1:0.1930147,c2:0.2890467,c3:0.75,c4:1;n:type:ShaderForge.SFN_Multiply,id:127,x:33647,y:33198|A-14-RGB,B-117-RGB;n:type:ShaderForge.SFN_Tex2d,id:145,x:33842,y:33448,ptlb:Particle 2,ptin:_Particle2,tex:e86309e208f6f8448bc8f47480da449f,ntxv:0,isnm:False|UVIN-147-UVOUT;n:type:ShaderForge.SFN_Panner,id:147,x:34041,y:33446,spu:-0.4,spv:0.2;n:type:ShaderForge.SFN_Color,id:149,x:33839,y:33638,ptlb:Particle 2 Color,ptin:_Particle2Color,glob:False,c1:0.1930147,c2:0.2890467,c3:0.75,c4:1;n:type:ShaderForge.SFN_Multiply,id:151,x:33646,y:33568|A-145-RGB,B-149-RGB;n:type:ShaderForge.SFN_Blend,id:152,x:33443,y:33273,blmd:10,clmp:True|SRC-127-OUT,DST-151-OUT;n:type:ShaderForge.SFN_Blend,id:183,x:33443,y:33510,blmd:6,clmp:True|SRC-14-A,DST-145-A;n:type:ShaderForge.SFN_Tex2d,id:197,x:33839,y:33817,ptlb:Particle 3,ptin:_Particle3,tex:e86309e208f6f8448bc8f47480da449f,ntxv:0,isnm:False|UVIN-199-UVOUT;n:type:ShaderForge.SFN_Panner,id:199,x:34038,y:33815,spu:0.2,spv:-0.2;n:type:ShaderForge.SFN_Color,id:201,x:33839,y:34008,ptlb:Particle 3 Color,ptin:_Particle3Color,glob:False,c1:0.3707829,c2:0.7241395,c3:0.9338235,c4:1;n:type:ShaderForge.SFN_Multiply,id:203,x:33643,y:33937|A-197-RGB,B-201-RGB;n:type:ShaderForge.SFN_Tex2d,id:205,x:33839,y:34180,ptlb:Particle 4,ptin:_Particle4,tex:e86309e208f6f8448bc8f47480da449f,ntxv:0,isnm:False|UVIN-207-UVOUT;n:type:ShaderForge.SFN_Panner,id:207,x:34038,y:34178,spu:0.5,spv:-0.3;n:type:ShaderForge.SFN_Color,id:209,x:33836,y:34370,ptlb:Particle 4 Color,ptin:_Particle4Color,glob:False,c1:0.659318,c2:0.6020221,c3:0.9632353,c4:1;n:type:ShaderForge.SFN_Multiply,id:211,x:33643,y:34300|A-205-RGB,B-209-RGB;n:type:ShaderForge.SFN_Blend,id:212,x:33418,y:34103,blmd:10,clmp:True|SRC-203-OUT,DST-211-OUT;n:type:ShaderForge.SFN_Blend,id:213,x:33171,y:33688,blmd:10,clmp:True|SRC-152-OUT,DST-212-OUT;n:type:ShaderForge.SFN_Blend,id:222,x:33438,y:33846,blmd:6,clmp:True|SRC-197-A,DST-205-A;n:type:ShaderForge.SFN_Blend,id:223,x:33171,y:33509,blmd:6,clmp:True|SRC-183-OUT,DST-222-OUT;n:type:ShaderForge.SFN_Fresnel,id:236,x:33282,y:33124|EXP-270-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:237,x:33071,y:33124|M-236-OUT,R-213-OUT;n:type:ShaderForge.SFN_ValueProperty,id:270,x:33486,y:33146,ptlb:Edge Glow,ptin:_EdgeGlow,glob:False,v1:2;proporder:2-5-12-14-117-145-149-197-201-205-209-270;pass:END;sub:END;*/

Shader "Custom/SpiritShader" {
    Properties {
        _DarkColor ("Dark Color", Color) = (0.2558391,0.3099928,0.6691177,1)
        _FlickerSpeed ("Flicker Speed", Float ) = 1
        _LightColor ("Light Color", Color) = (0.299362,0.4569853,0.8308824,1)
        _Particle1 ("Particle 1", 2D) = "white" {}
        _Particle1Color ("Particle 1 Color", Color) = (0.1930147,0.2890467,0.75,1)
        _Particle2 ("Particle 2", 2D) = "white" {}
        _Particle2Color ("Particle 2 Color", Color) = (0.1930147,0.2890467,0.75,1)
        _Particle3 ("Particle 3", 2D) = "white" {}
        _Particle3Color ("Particle 3 Color", Color) = (0.3707829,0.7241395,0.9338235,1)
        _Particle4 ("Particle 4", 2D) = "white" {}
        _Particle4Color ("Particle 4 Color", Color) = (0.659318,0.6020221,0.9632353,1)
        _EdgeGlow ("Edge Glow", Float ) = 2
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
            uniform float4 _TimeEditor;
            uniform float4 _DarkColor;
            uniform float _FlickerSpeed;
            uniform float4 _LightColor;
            uniform sampler2D _Particle1; uniform float4 _Particle1_ST;
            uniform float4 _Particle1Color;
            uniform sampler2D _Particle2; uniform float4 _Particle2_ST;
            uniform float4 _Particle2Color;
            uniform sampler2D _Particle3; uniform float4 _Particle3_ST;
            uniform float4 _Particle3Color;
            uniform sampler2D _Particle4; uniform float4 _Particle4_ST;
            uniform float4 _Particle4Color;
            uniform float _EdgeGlow;
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
////// Lighting:
////// Emissive:
                float4 node_4 = _Time + _TimeEditor;
                float3 emissive = lerp(_LightColor.rgb,_DarkColor.rgb,(sin((_FlickerSpeed*node_4.g))*0.5+0.5));
                float node_236 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_EdgeGlow);
                float4 node_276 = _Time + _TimeEditor;
                float2 node_275 = i.uv0;
                float2 node_15 = (node_275.rg+node_276.g*float2(0.4,0.3));
                float4 node_14 = tex2D(_Particle1,TRANSFORM_TEX(node_15, _Particle1));
                float2 node_147 = (node_275.rg+node_276.g*float2(-0.4,0.2));
                float4 node_145 = tex2D(_Particle2,TRANSFORM_TEX(node_147, _Particle2));
                float2 node_199 = (node_275.rg+node_276.g*float2(0.2,-0.2));
                float4 node_197 = tex2D(_Particle3,TRANSFORM_TEX(node_199, _Particle3));
                float2 node_207 = (node_275.rg+node_276.g*float2(0.5,-0.3));
                float4 node_205 = tex2D(_Particle4,TRANSFORM_TEX(node_207, _Particle4));
                float3 finalColor = emissive + (node_236.r*saturate(( saturate(( (node_205.rgb*_Particle4Color.rgb) > 0.5 ? (1.0-(1.0-2.0*((node_205.rgb*_Particle4Color.rgb)-0.5))*(1.0-(node_197.rgb*_Particle3Color.rgb))) : (2.0*(node_205.rgb*_Particle4Color.rgb)*(node_197.rgb*_Particle3Color.rgb)) )) > 0.5 ? (1.0-(1.0-2.0*(saturate(( (node_205.rgb*_Particle4Color.rgb) > 0.5 ? (1.0-(1.0-2.0*((node_205.rgb*_Particle4Color.rgb)-0.5))*(1.0-(node_197.rgb*_Particle3Color.rgb))) : (2.0*(node_205.rgb*_Particle4Color.rgb)*(node_197.rgb*_Particle3Color.rgb)) ))-0.5))*(1.0-saturate(( (node_145.rgb*_Particle2Color.rgb) > 0.5 ? (1.0-(1.0-2.0*((node_145.rgb*_Particle2Color.rgb)-0.5))*(1.0-(node_14.rgb*_Particle1Color.rgb))) : (2.0*(node_145.rgb*_Particle2Color.rgb)*(node_14.rgb*_Particle1Color.rgb)) )))) : (2.0*saturate(( (node_205.rgb*_Particle4Color.rgb) > 0.5 ? (1.0-(1.0-2.0*((node_205.rgb*_Particle4Color.rgb)-0.5))*(1.0-(node_197.rgb*_Particle3Color.rgb))) : (2.0*(node_205.rgb*_Particle4Color.rgb)*(node_197.rgb*_Particle3Color.rgb)) ))*saturate(( (node_145.rgb*_Particle2Color.rgb) > 0.5 ? (1.0-(1.0-2.0*((node_145.rgb*_Particle2Color.rgb)-0.5))*(1.0-(node_14.rgb*_Particle1Color.rgb))) : (2.0*(node_145.rgb*_Particle2Color.rgb)*(node_14.rgb*_Particle1Color.rgb)) ))) )));
/// Final Color:
                return fixed4(finalColor,saturate((1.0-(1.0-saturate((1.0-(1.0-node_14.a)*(1.0-node_145.a))))*(1.0-saturate((1.0-(1.0-node_197.a)*(1.0-node_205.a)))))));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
