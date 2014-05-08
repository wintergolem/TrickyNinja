// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:True,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:2,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1352,x:32719,y:32712|diff-1868-OUT,amdfl-1868-OUT,custl-1868-OUT,alpha-1830-OUT;n:type:ShaderForge.SFN_Tex2d,id:1353,x:33772,y:32403,ptlb:Map 1,ptin:_Map1,tex:7388ba9a09d07ce4dbdfa96c14a26ce3,ntxv:0,isnm:False|UVIN-1358-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:1355,x:33772,y:32594,ptlb:Map 2,ptin:_Map2,tex:d75ec92d1fd7a4947b3f2f60d4191160,ntxv:0,isnm:False|UVIN-1424-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:1357,x:33766,y:32803,ptlb:Map 3,ptin:_Map3,tex:0df7a0b61c9dfa6408ae01459c10ffec,ntxv:0,isnm:False|UVIN-1746-UVOUT;n:type:ShaderForge.SFN_Panner,id:1358,x:33988,y:32403,spu:0,spv:0.2;n:type:ShaderForge.SFN_Panner,id:1424,x:33988,y:32594,spu:0,spv:0.3;n:type:ShaderForge.SFN_Blend,id:1426,x:33567,y:32431,blmd:10,clmp:True|SRC-1353-RGB,DST-1355-RGB;n:type:ShaderForge.SFN_Panner,id:1746,x:33982,y:32788,spu:0,spv:1;n:type:ShaderForge.SFN_Blend,id:1760,x:33388,y:32553,blmd:10,clmp:True|SRC-1426-OUT,DST-1357-RGB;n:type:ShaderForge.SFN_Multiply,id:1823,x:33171,y:32844|A-1760-OUT,B-1856-RGB;n:type:ShaderForge.SFN_Blend,id:1828,x:33448,y:32737,blmd:1,clmp:True|SRC-1353-A,DST-1355-A;n:type:ShaderForge.SFN_Blend,id:1830,x:33448,y:32919,blmd:10,clmp:True|SRC-1828-OUT,DST-1357-A;n:type:ShaderForge.SFN_Color,id:1856,x:33465,y:33128,ptlb:Smoke Color,ptin:_SmokeColor,glob:False,c1:0.3529412,c2:0.63903,c3:0.8823529,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1867,x:33465,y:33302,ptlb:Value Blend,ptin:_ValueBlend,tex:7ef1f0954c456a24e957fcf0c687ee18,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Blend,id:1868,x:33009,y:32915,blmd:10,clmp:True|SRC-1823-OUT,DST-1935-OUT;n:type:ShaderForge.SFN_Add,id:1935,x:33181,y:33211|A-1867-RGB,B-1937-RGB;n:type:ShaderForge.SFN_Color,id:1937,x:33465,y:33494,ptlb:Value Blend Color,ptin:_ValueBlendColor,glob:False,c1:0.1882353,c2:0.2741602,c3:1,c4:1;proporder:1353-1355-1357-1856-1867-1937;pass:END;sub:END;*/

Shader "Custom/smoke" {
    Properties {
        _Map1 ("Map 1", 2D) = "white" {}
        _Map2 ("Map 2", 2D) = "white" {}
        _Map3 ("Map 3", 2D) = "white" {}
        _SmokeColor ("Smoke Color", Color) = (0.3529412,0.63903,0.8823529,1)
        _ValueBlend ("Value Blend", 2D) = "white" {}
        _ValueBlendColor ("Value Blend Color", Color) = (0.1882353,0.2741602,1,1)
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
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            #ifndef LIGHTMAP_OFF
                sampler2D unity_Lightmap;
                float4 unity_LightmapST;
                #ifndef DIRLIGHTMAP_OFF
                    sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _Map1; uniform float4 _Map1_ST;
            uniform sampler2D _Map2; uniform float4 _Map2_ST;
            uniform sampler2D _Map3; uniform float4 _Map3_ST;
            uniform float4 _SmokeColor;
            uniform sampler2D _ValueBlend; uniform float4 _ValueBlend_ST;
            uniform float4 _ValueBlendColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float4 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                #ifndef LIGHTMAP_OFF
                    float2 uvLM : TEXCOORD5;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                #ifndef LIGHTMAP_OFF
                    o.uvLM = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                #endif
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                #ifndef LIGHTMAP_OFF
                    float4 lmtex = tex2D(unity_Lightmap,i.uvLM);
                    #ifndef DIRLIGHTMAP_OFF
                        float3 lightmap = DecodeLightmap(lmtex);
                        float3 scalePerBasisVector = DecodeLightmap(tex2D(unity_LightmapInd,i.uvLM));
                        UNITY_DIRBASIS
                        half3 normalInRnmBasis = saturate (mul (unity_DirBasis, float3(0,0,1)));
                        lightmap *= dot (normalInRnmBasis, scalePerBasisVector);
                    #else
                        float3 lightmap = DecodeLightmap(tex2D(unity_Lightmap,i.uvLM));
                    #endif
                #endif
////// Lighting:
                float4 node_2471 = _Time + _TimeEditor;
                float2 node_2470 = i.uv0;
                float2 node_1358 = (node_2470.rg+node_2471.g*float2(0,0.2));
                float4 node_1353 = tex2D(_Map1,TRANSFORM_TEX(node_1358, _Map1));
                float2 node_1424 = (node_2470.rg+node_2471.g*float2(0,0.3));
                float4 node_1355 = tex2D(_Map2,TRANSFORM_TEX(node_1424, _Map2));
                float2 node_1746 = (node_2470.rg+node_2471.g*float2(0,1));
                float4 node_1357 = tex2D(_Map3,TRANSFORM_TEX(node_1746, _Map3));
                float3 node_1868 = saturate(( (tex2D(_ValueBlend,TRANSFORM_TEX(node_2470.rg, _ValueBlend)).rgb+_ValueBlendColor.rgb) > 0.5 ? (1.0-(1.0-2.0*((tex2D(_ValueBlend,TRANSFORM_TEX(node_2470.rg, _ValueBlend)).rgb+_ValueBlendColor.rgb)-0.5))*(1.0-(saturate(( node_1357.rgb > 0.5 ? (1.0-(1.0-2.0*(node_1357.rgb-0.5))*(1.0-saturate(( node_1355.rgb > 0.5 ? (1.0-(1.0-2.0*(node_1355.rgb-0.5))*(1.0-node_1353.rgb)) : (2.0*node_1355.rgb*node_1353.rgb) )))) : (2.0*node_1357.rgb*saturate(( node_1355.rgb > 0.5 ? (1.0-(1.0-2.0*(node_1355.rgb-0.5))*(1.0-node_1353.rgb)) : (2.0*node_1355.rgb*node_1353.rgb) ))) ))*_SmokeColor.rgb))) : (2.0*(tex2D(_ValueBlend,TRANSFORM_TEX(node_2470.rg, _ValueBlend)).rgb+_ValueBlendColor.rgb)*(saturate(( node_1357.rgb > 0.5 ? (1.0-(1.0-2.0*(node_1357.rgb-0.5))*(1.0-saturate(( node_1355.rgb > 0.5 ? (1.0-(1.0-2.0*(node_1355.rgb-0.5))*(1.0-node_1353.rgb)) : (2.0*node_1355.rgb*node_1353.rgb) )))) : (2.0*node_1357.rgb*saturate(( node_1355.rgb > 0.5 ? (1.0-(1.0-2.0*(node_1355.rgb-0.5))*(1.0-node_1353.rgb)) : (2.0*node_1355.rgb*node_1353.rgb) ))) ))*_SmokeColor.rgb)) ));
                float3 finalColor = node_1868;
/// Final Color:
                return fixed4(finalColor,saturate(( node_1357.a > 0.5 ? (1.0-(1.0-2.0*(node_1357.a-0.5))*(1.0-saturate((node_1353.a*node_1355.a)))) : (2.0*node_1357.a*saturate((node_1353.a*node_1355.a))) )));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
