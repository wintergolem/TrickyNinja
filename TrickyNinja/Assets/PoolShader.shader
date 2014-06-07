// Shader created with Shader Forge Beta 0.34 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32719,y:32712|diff-1581-RGB,spec-720-OUT,gloss-720-OUT,normal-127-OUT,alpha-650-OUT,refract-625-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:34793,y:32653,ptlb:Spread,ptin:_Spread,tex:29e44676f98f56946baf8315beb42492,ntxv:0,isnm:False|UVIN-9-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8,x:35533,y:32580,uv:0;n:type:ShaderForge.SFN_Panner,id:9,x:35167,y:32649,spu:0,spv:-1|UVIN-1064-OUT;n:type:ShaderForge.SFN_VertexColor,id:55,x:33991,y:32466;n:type:ShaderForge.SFN_Lerp,id:56,x:33492,y:32765|A-83-RGB,B-159-OUT,T-55-R;n:type:ShaderForge.SFN_Color,id:83,x:33656,y:32352,ptlb:node_83,ptin:_node_83,glob:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:95,x:33534,y:32910|A-83-RGB,B-177-OUT,T-55-G;n:type:ShaderForge.SFN_Lerp,id:117,x:33220,y:32751|A-56-OUT,B-95-OUT,T-55-RGB;n:type:ShaderForge.SFN_Lerp,id:126,x:33761,y:33034|A-83-RGB,B-178-OUT,T-55-B;n:type:ShaderForge.SFN_Lerp,id:127,x:33301,y:32984|A-117-OUT,B-126-OUT,T-55-RGB;n:type:ShaderForge.SFN_Tex2d,id:155,x:34947,y:33281,ptlb:nlode_155,ptin:_nlode_155,tex:f230c12c60161da4980f648c33fd517e,ntxv:2,isnm:False|UVIN-222-OUT;n:type:ShaderForge.SFN_Lerp,id:159,x:34453,y:32995|A-161-RGB,B-880-OUT,T-2-R;n:type:ShaderForge.SFN_Color,id:161,x:35206,y:32963,ptlb:node_161,ptin:_node_161,glob:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:177,x:34453,y:33148|A-161-RGB,B-880-OUT,T-2-G;n:type:ShaderForge.SFN_Lerp,id:178,x:34453,y:33284|A-161-RGB,B-880-OUT,T-2-B;n:type:ShaderForge.SFN_Add,id:222,x:35288,y:33294|A-9-UVOUT,B-223-UVOUT;n:type:ShaderForge.SFN_Panner,id:223,x:35560,y:33378,spu:0.5,spv:-1;n:type:ShaderForge.SFN_Tex2d,id:524,x:34971,y:33557,ptlb:node_524,ptin:_node_524,tex:f230c12c60161da4980f648c33fd517e,ntxv:0,isnm:False|UVIN-525-OUT;n:type:ShaderForge.SFN_Add,id:525,x:35341,y:33500|A-9-UVOUT,B-526-UVOUT;n:type:ShaderForge.SFN_Panner,id:526,x:35553,y:33563,spu:-0.5,spv:-1;n:type:ShaderForge.SFN_Blend,id:527,x:34803,y:33444,blmd:10,clmp:True|SRC-155-RGB,DST-524-RGB;n:type:ShaderForge.SFN_ComponentMask,id:625,x:33145,y:33140,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-693-OUT;n:type:ShaderForge.SFN_Vector1,id:650,x:32983,y:32956,v1:0.1;n:type:ShaderForge.SFN_Blend,id:693,x:33523,y:33341,blmd:10,clmp:True|SRC-127-OUT,DST-799-OUT;n:type:ShaderForge.SFN_Vector1,id:720,x:33063,y:32730,v1:1;n:type:ShaderForge.SFN_Tex2d,id:751,x:34110,y:33539,ptlb:node_751,ptin:_node_751,tex:8dc9e3a290b3d2f45bf3a81b7d6203e5,ntxv:0,isnm:False|UVIN-772-UVOUT;n:type:ShaderForge.SFN_Panner,id:772,x:34377,y:33619,spu:0.5,spv:0.5|UVIN-8-UVOUT;n:type:ShaderForge.SFN_Multiply,id:799,x:33870,y:33703|A-751-RGB,B-802-OUT;n:type:ShaderForge.SFN_ValueProperty,id:802,x:34058,y:33762,ptlb:SoftenBase,ptin:_SoftenBase,glob:False,v1:0.25;n:type:ShaderForge.SFN_ValueProperty,id:859,x:34847,y:33792,ptlb:IncreaseWave,ptin:_IncreaseWave,glob:False,v1:1;n:type:ShaderForge.SFN_Power,id:880,x:34725,y:33875|VAL-527-OUT,EXP-859-OUT;n:type:ShaderForge.SFN_Multiply,id:933,x:35254,y:32802|A-8-U,B-970-OUT;n:type:ShaderForge.SFN_ValueProperty,id:970,x:35608,y:32924,ptlb:tilingU,ptin:_tilingU,glob:False,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:1059,x:35580,y:32823,ptlb:TilingV,ptin:_TilingV,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1060,x:35353,y:32717|A-8-V,B-1059-OUT;n:type:ShaderForge.SFN_Append,id:1064,x:35267,y:32458|A-1060-OUT,B-933-OUT;n:type:ShaderForge.SFN_Color,id:1581,x:33163,y:32434,ptlb:node_1581,ptin:_node_1581,glob:False,c1:0.03557525,c2:0.6911765,c3:0.06722502,c4:1;proporder:2-83-155-161-524-751-802-859-970-1059-1581;pass:END;sub:END;*/

Shader "Shader Forge/PoolShader" {
    Properties {
        _Spread ("Spread", 2D) = "white" {}
        _node_83 ("node_83", Color) = (0,0,0,1)
        _nlode_155 ("nlode_155", 2D) = "black" {}
        _node_161 ("node_161", Color) = (0,0,0,1)
        _node_524 ("node_524", 2D) = "white" {}
        _node_751 ("node_751", 2D) = "white" {}
        _SoftenBase ("SoftenBase", Float ) = 0.25
        _IncreaseWave ("IncreaseWave", Float ) = 1
        _tilingU ("tilingU", Float ) = 2
        _TilingV ("TilingV", Float ) = 1
        _node_1581 ("node_1581", Color) = (0.03557525,0.6911765,0.06722502,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
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
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform sampler2D _Spread; uniform float4 _Spread_ST;
            uniform float4 _node_83;
            uniform sampler2D _nlode_155; uniform float4 _nlode_155_ST;
            uniform float4 _node_161;
            uniform sampler2D _node_524; uniform float4 _node_524_ST;
            uniform sampler2D _node_751; uniform float4 _node_751_ST;
            uniform float _SoftenBase;
            uniform float _IncreaseWave;
            uniform float _tilingU;
            uniform float _TilingV;
            uniform float4 _node_1581;
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
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float4 node_1666 = _Time + _TimeEditor;
                float2 node_8 = i.uv0;
                float2 node_9 = (float2((node_8.g*_TilingV),(node_8.r*_tilingU))+node_1666.g*float2(0,-1));
                float2 node_1667 = i.uv0;
                float2 node_222 = (node_9+(node_1667.rg+node_1666.g*float2(0.5,-1)));
                float2 node_525 = (node_9+(node_1667.rg+node_1666.g*float2(-0.5,-1)));
                float3 node_880 = pow(saturate(( tex2D(_node_524,TRANSFORM_TEX(node_525, _node_524)).rgb > 0.5 ? (1.0-(1.0-2.0*(tex2D(_node_524,TRANSFORM_TEX(node_525, _node_524)).rgb-0.5))*(1.0-tex2D(_nlode_155,TRANSFORM_TEX(node_222, _nlode_155)).rgb)) : (2.0*tex2D(_node_524,TRANSFORM_TEX(node_525, _node_524)).rgb*tex2D(_nlode_155,TRANSFORM_TEX(node_222, _nlode_155)).rgb) )),_IncreaseWave);
                float4 node_2 = tex2D(_Spread,TRANSFORM_TEX(node_9, _Spread));
                float4 node_55 = i.vertexColor;
                float3 node_127 = lerp(lerp(lerp(_node_83.rgb,lerp(_node_161.rgb,node_880,node_2.r),node_55.r),lerp(_node_83.rgb,lerp(_node_161.rgb,node_880,node_2.g),node_55.g),node_55.rgb),lerp(_node_83.rgb,lerp(_node_161.rgb,node_880,node_2.b),node_55.b),node_55.rgb);
                float3 normalLocal = node_127;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 node_772 = (node_8.rg+node_1666.g*float2(0.5,0.5));
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + saturate(( (tex2D(_node_751,TRANSFORM_TEX(node_772, _node_751)).rgb*_SoftenBase) > 0.5 ? (1.0-(1.0-2.0*((tex2D(_node_751,TRANSFORM_TEX(node_772, _node_751)).rgb*_SoftenBase)-0.5))*(1.0-node_127)) : (2.0*(tex2D(_node_751,TRANSFORM_TEX(node_772, _node_751)).rgb*_SoftenBase)*node_127) )).rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
///////// Gloss:
                float node_720 = 1.0;
                float gloss = node_720;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = float3(node_720,node_720,node_720);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * _node_1581.rgb;
                finalColor += specular;
/// Final Color:
                return fixed4(lerp(sceneColor.rgb, finalColor,0.1),1);
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
            uniform sampler2D _Spread; uniform float4 _Spread_ST;
            uniform float4 _node_83;
            uniform sampler2D _nlode_155; uniform float4 _nlode_155_ST;
            uniform float4 _node_161;
            uniform sampler2D _node_524; uniform float4 _node_524_ST;
            uniform sampler2D _node_751; uniform float4 _node_751_ST;
            uniform float _SoftenBase;
            uniform float _IncreaseWave;
            uniform float _tilingU;
            uniform float _TilingV;
            uniform float4 _node_1581;
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
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float4 node_1668 = _Time + _TimeEditor;
                float2 node_8 = i.uv0;
                float2 node_9 = (float2((node_8.g*_TilingV),(node_8.r*_tilingU))+node_1668.g*float2(0,-1));
                float2 node_1669 = i.uv0;
                float2 node_222 = (node_9+(node_1669.rg+node_1668.g*float2(0.5,-1)));
                float2 node_525 = (node_9+(node_1669.rg+node_1668.g*float2(-0.5,-1)));
                float3 node_880 = pow(saturate(( tex2D(_node_524,TRANSFORM_TEX(node_525, _node_524)).rgb > 0.5 ? (1.0-(1.0-2.0*(tex2D(_node_524,TRANSFORM_TEX(node_525, _node_524)).rgb-0.5))*(1.0-tex2D(_nlode_155,TRANSFORM_TEX(node_222, _nlode_155)).rgb)) : (2.0*tex2D(_node_524,TRANSFORM_TEX(node_525, _node_524)).rgb*tex2D(_nlode_155,TRANSFORM_TEX(node_222, _nlode_155)).rgb) )),_IncreaseWave);
                float4 node_2 = tex2D(_Spread,TRANSFORM_TEX(node_9, _Spread));
                float4 node_55 = i.vertexColor;
                float3 node_127 = lerp(lerp(lerp(_node_83.rgb,lerp(_node_161.rgb,node_880,node_2.r),node_55.r),lerp(_node_83.rgb,lerp(_node_161.rgb,node_880,node_2.g),node_55.g),node_55.rgb),lerp(_node_83.rgb,lerp(_node_161.rgb,node_880,node_2.b),node_55.b),node_55.rgb);
                float3 normalLocal = node_127;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 node_772 = (node_8.rg+node_1668.g*float2(0.5,0.5));
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + saturate(( (tex2D(_node_751,TRANSFORM_TEX(node_772, _node_751)).rgb*_SoftenBase) > 0.5 ? (1.0-(1.0-2.0*((tex2D(_node_751,TRANSFORM_TEX(node_772, _node_751)).rgb*_SoftenBase)-0.5))*(1.0-node_127)) : (2.0*(tex2D(_node_751,TRANSFORM_TEX(node_772, _node_751)).rgb*_SoftenBase)*node_127) )).rg;
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
                float node_720 = 1.0;
                float gloss = node_720;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = float3(node_720,node_720,node_720);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * _node_1581.rgb;
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 0.1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
