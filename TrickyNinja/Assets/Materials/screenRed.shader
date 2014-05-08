// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32719,y:32712|emission-2-RGB,alpha-35-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33417,y:32702,ptlb:Warning Texture,ptin:_WarningTexture,tex:03d515f509a0fae4e83abb2f7be0c985,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:7,x:33170,y:33006,ptlb:Alpha Level,ptin:_AlphaLevel,glob:False,v1:0;n:type:ShaderForge.SFN_ChannelBlend,id:34,x:33172,y:32819|M-2-A,R-2-A;n:type:ShaderForge.SFN_Multiply,id:35,x:32980,y:32876|A-34-OUT,B-7-OUT;proporder:2-7;pass:END;sub:END;*/

Shader "Custom/screenRed" {
    Properties {
        _WarningTexture ("Warning Texture", 2D) = "white" {}
        _AlphaLevel ("Alpha Level", Float ) = 0
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
            uniform sampler2D _WarningTexture; uniform float4 _WarningTexture_ST;
            uniform float _AlphaLevel;
            struct VertexInput {
                float4 vertex : POSITION;
                float4 uv0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float2 node_52 = i.uv0;
                float4 node_2 = tex2D(_WarningTexture,TRANSFORM_TEX(node_52.rg, _WarningTexture));
                float3 emissive = node_2.rgb;
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,((node_2.a.r*node_2.a)*_AlphaLevel));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
