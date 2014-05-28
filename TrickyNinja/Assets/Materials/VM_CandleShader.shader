// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32154,y:32712|diff-522-OUT,spec-538-OUT,emission-285-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33431,y:32824,ptlb:Flicmker,ptin:_Flicmker,tex:f7cbda1b9919e8e45b0610f40218d702,ntxv:0,isnm:False|UVIN-5-UVOUT;n:type:ShaderForge.SFN_Color,id:3,x:33567,y:32447,ptlb:Candle Color,ptin:_CandleColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_TexCoord,id:4,x:34117,y:32824,uv:0;n:type:ShaderForge.SFN_Panner,id:5,x:33651,y:32824,spu:0.25,spv:0.25|UVIN-12-OUT;n:type:ShaderForge.SFN_Multiply,id:6,x:32861,y:32808|A-3-RGB,B-2-RGB;n:type:ShaderForge.SFN_Multiply,id:12,x:33852,y:32824|A-4-UVOUT,B-14-OUT;n:type:ShaderForge.SFN_ValueProperty,id:14,x:33912,y:33094,ptlb:node_14,ptin:_node_14,glob:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:53,x:33355,y:33121,ptlb:Flicker Drop off,ptin:_FlickerDropoff,tex:cd1047d9626a19648b9fecc80ddf4fdd,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:285,x:32487,y:32810|A-6-OUT,B-3-RGB,T-317-OUT;n:type:ShaderForge.SFN_Multiply,id:317,x:32968,y:33328|A-53-R,B-319-OUT;n:type:ShaderForge.SFN_Vector1,id:319,x:33210,y:33486,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:472,x:33311,y:32676,ptlb:node_472,ptin:_node_472,glob:False,v1:0.2;n:type:ShaderForge.SFN_Multiply,id:522,x:32986,y:32441|A-3-RGB,B-472-OUT;n:type:ShaderForge.SFN_Vector1,id:538,x:32562,y:32749,v1:1;proporder:3-2-14-53-472;pass:END;sub:END;*/

Shader "Shader Forge/VM_CandleShader" {
    Properties {
        _CandleColor ("Candle Color", Color) = (0.5,0.5,0.5,1)
        _Flicmker ("Flicmker", 2D) = "white" {}
        _node_14 ("node_14", Float ) = 0
        _FlickerDropoff ("Flicker Drop off", 2D) = "white" {}
        _node_472 ("node_472", Float ) = 0.2
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
            uniform sampler2D _Flicmker; uniform float4 _Flicmker_ST;
            uniform float4 _CandleColor;
            uniform float _node_14;
            uniform sampler2D _FlickerDropoff; uniform float4 _FlickerDropoff_ST;
            uniform float _node_472;
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.xyz;
////// Emissive:
                float4 node_577 = _Time + _TimeEditor;
                float2 node_5 = ((i.uv0.rg*_node_14)+node_577.g*float2(0.25,0.25));
                float4 node_2 = tex2D(_Flicmker,TRANSFORM_TEX(node_5, _Flicmker));
                float2 node_578 = i.uv0;
                float4 node_53 = tex2D(_FlickerDropoff,TRANSFORM_TEX(node_578.rg, _FlickerDropoff));
                float3 emissive = lerp((_CandleColor.rgb*node_2.rgb),_CandleColor.rgb,(node_53.r*1.0));
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_538 = 1.0;
                float3 specularColor = float3(node_538,node_538,node_538);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * (_CandleColor.rgb*_node_472);
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
            uniform sampler2D _Flicmker; uniform float4 _Flicmker_ST;
            uniform float4 _CandleColor;
            uniform float _node_14;
            uniform sampler2D _FlickerDropoff; uniform float4 _FlickerDropoff_ST;
            uniform float _node_472;
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
                float node_538 = 1.0;
                float3 specularColor = float3(node_538,node_538,node_538);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * (_CandleColor.rgb*_node_472);
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
