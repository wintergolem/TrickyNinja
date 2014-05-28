// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32465,y:32714|diff-497-OUT,spec-1695-OUT,gloss-1664-OUT,emission-1412-OUT,refract-1918-UVOUT;n:type:ShaderForge.SFN_Color,id:13,x:33940,y:32259,ptlb:Whacc,ptin:_Whacc,glob:False,c1:0.5686275,c2:0.8431373,c3:0.9921569,c4:1;n:type:ShaderForge.SFN_Multiply,id:14,x:33644,y:32311|A-268-R,B-13-RGB;n:type:ShaderForge.SFN_Tex2d,id:25,x:34227,y:33232,ptlb:RedGreenMap,ptin:_RedGreenMap,tex:1a10ed914a9025d4e907a00da91d4600,ntxv:0,isnm:False|UVIN-255-UVOUT;n:type:ShaderForge.SFN_Multiply,id:26,x:33659,y:33153|A-25-R,B-28-RGB;n:type:ShaderForge.SFN_Multiply,id:27,x:33659,y:33334|A-25-G,B-29-G;n:type:ShaderForge.SFN_Color,id:28,x:33899,y:33105,ptlb:node_28,ptin:_node_28,glob:False,c1:0.5241136,c2:0,c3:0.9632353,c4:1;n:type:ShaderForge.SFN_Color,id:29,x:33885,y:33334,ptlb:node_29,ptin:_node_29,glob:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:36,x:33380,y:33153|A-26-OUT,B-27-OUT;n:type:ShaderForge.SFN_Add,id:91,x:33376,y:32442|A-14-OUT,B-102-OUT;n:type:ShaderForge.SFN_Multiply,id:102,x:33644,y:32486|A-268-G,B-104-RGB;n:type:ShaderForge.SFN_Color,id:104,x:33922,y:32563,ptlb:nov,ptin:_nov,glob:False,c1:0,c2:0.9117646,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:220,x:34852,y:33232,uv:0;n:type:ShaderForge.SFN_Multiply,id:221,x:34606,y:33232|A-220-UVOUT,B-540-OUT;n:type:ShaderForge.SFN_Panner,id:255,x:34420,y:33232,spu:0.02,spv:-0.05|UVIN-221-OUT;n:type:ShaderForge.SFN_Tex2d,id:268,x:34207,y:32369,ptlb:node_268,ptin:_node_268,tex:1a10ed914a9025d4e907a00da91d4600,ntxv:0,isnm:False|UVIN-295-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:293,x:34832,y:32383,uv:0;n:type:ShaderForge.SFN_Panner,id:295,x:34400,y:32369,spu:-0.2,spv:0.3|UVIN-1030-OUT;n:type:ShaderForge.SFN_Lerp,id:392,x:33143,y:32781|A-91-OUT,B-36-OUT,T-1629-OUT;n:type:ShaderForge.SFN_Tex2d,id:395,x:33843,y:32744,ptlb:node_395,ptin:_node_395,tex:7ef1f0954c456a24e957fcf0c687ee18,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:497,x:33062,y:32957|A-392-OUT,B-499-OUT;n:type:ShaderForge.SFN_Vector1,id:499,x:33181,y:33153,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:540,x:34724,y:33546,ptlb:node_540,ptin:_node_540,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1030,x:34578,y:32393|A-293-UVOUT,B-1031-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1031,x:34784,y:32606,ptlb:node_1031,ptin:_node_1031,glob:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:1165,x:32955,y:33134,v1:0.2;n:type:ShaderForge.SFN_Multiply,id:1412,x:33107,y:32529|A-392-OUT,B-1165-OUT;n:type:ShaderForge.SFN_Multiply,id:1629,x:33494,y:32790|A-395-A,B-1631-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1631,x:33708,y:32990,ptlb:color balance,ptin:_colorbalance,glob:False,v1:1.5;n:type:ShaderForge.SFN_ValueProperty,id:1664,x:32790,y:32611,ptlb:Gloss,ptin:_Gloss,glob:False,v1:-1;n:type:ShaderForge.SFN_ValueProperty,id:1695,x:32672,y:32481,ptlb:Specular,ptin:_Specular,glob:False,v1:0.5;n:type:ShaderForge.SFN_TexCoord,id:1918,x:32932,y:33215,uv:0;proporder:13-25-28-29-104-268-395-540-1031-1631-1664-1695;pass:END;sub:END;*/

Shader "Shader Forge/VM_Crystals" {
    Properties {
        _Whacc ("Whacc", Color) = (0.5686275,0.8431373,0.9921569,1)
        _RedGreenMap ("RedGreenMap", 2D) = "white" {}
        _node_28 ("node_28", Color) = (0.5241136,0,0.9632353,1)
        _node_29 ("node_29", Color) = (0,0,0,1)
        _nov ("nov", Color) = (0,0.9117646,1,1)
        _node_268 ("node_268", 2D) = "white" {}
        _node_395 ("node_395", 2D) = "white" {}
        _node_540 ("node_540", Float ) = 1
        _node_1031 ("node_1031", Float ) = 1
        _colorbalance ("color balance", Float ) = 1.5
        _Gloss ("Gloss", Float ) = -1
        _Specular ("Specular", Float ) = 0.5
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
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform float4 _Whacc;
            uniform sampler2D _RedGreenMap; uniform float4 _RedGreenMap_ST;
            uniform float4 _node_28;
            uniform float4 _node_29;
            uniform float4 _nov;
            uniform sampler2D _node_268; uniform float4 _node_268_ST;
            uniform sampler2D _node_395; uniform float4 _node_395_ST;
            uniform float _node_540;
            uniform float _node_1031;
            uniform float _colorbalance;
            uniform float _Gloss;
            uniform float _Specular;
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
                float4 screenPos : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + i.uv0.rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.xyz;
////// Emissive:
                float4 node_2052 = _Time + _TimeEditor;
                float2 node_293 = i.uv0;
                float2 node_295 = ((node_293.rg*_node_1031)+node_2052.g*float2(-0.2,0.3));
                float4 node_268 = tex2D(_node_268,TRANSFORM_TEX(node_295, _node_268));
                float3 node_14 = (node_268.r*_Whacc.rgb);
                float3 node_91 = (node_14+(node_268.g*_nov.rgb));
                float2 node_255 = ((i.uv0.rg*_node_540)+node_2052.g*float2(0.02,-0.05));
                float4 node_25 = tex2D(_RedGreenMap,TRANSFORM_TEX(node_255, _RedGreenMap));
                float3 node_36 = ((node_25.r*_node_28.rgb)+(node_25.g*_node_29.g));
                float2 node_2053 = i.uv0;
                float4 node_395 = tex2D(_node_395,TRANSFORM_TEX(node_2053.rg, _node_395));
                float3 node_392 = lerp(node_91,node_36,(node_395.a*_colorbalance));
                float3 emissive = (node_392*0.2);
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = float3(_Specular,_Specular,_Specular);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * (node_392*1.0);
                finalColor += specular;
                finalColor += emissive;
/// Final Color:
                return fixed4(lerp(sceneColor.rgb, finalColor,1),1);
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
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform float4 _Whacc;
            uniform sampler2D _RedGreenMap; uniform float4 _RedGreenMap_ST;
            uniform float4 _node_28;
            uniform float4 _node_29;
            uniform float4 _nov;
            uniform sampler2D _node_268; uniform float4 _node_268_ST;
            uniform sampler2D _node_395; uniform float4 _node_395_ST;
            uniform float _node_540;
            uniform float _node_1031;
            uniform float _colorbalance;
            uniform float _Gloss;
            uniform float _Specular;
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
                float4 screenPos : TEXCOORD3;
                LIGHTING_COORDS(4,5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
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
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + i.uv0.rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = float3(_Specular,_Specular,_Specular);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float4 node_2054 = _Time + _TimeEditor;
                float2 node_293 = i.uv0;
                float2 node_295 = ((node_293.rg*_node_1031)+node_2054.g*float2(-0.2,0.3));
                float4 node_268 = tex2D(_node_268,TRANSFORM_TEX(node_295, _node_268));
                float3 node_14 = (node_268.r*_Whacc.rgb);
                float3 node_91 = (node_14+(node_268.g*_nov.rgb));
                float2 node_255 = ((i.uv0.rg*_node_540)+node_2054.g*float2(0.02,-0.05));
                float4 node_25 = tex2D(_RedGreenMap,TRANSFORM_TEX(node_255, _RedGreenMap));
                float3 node_36 = ((node_25.r*_node_28.rgb)+(node_25.g*_node_29.g));
                float2 node_2055 = i.uv0;
                float4 node_395 = tex2D(_node_395,TRANSFORM_TEX(node_2055.rg, _node_395));
                float3 node_392 = lerp(node_91,node_36,(node_395.a*_colorbalance));
                finalColor += diffuseLight * (node_392*1.0);
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
