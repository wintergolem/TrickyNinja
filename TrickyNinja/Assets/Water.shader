// Shader created with Shader Forge Beta 0.34 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:False,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32719,y:32712|diff-489-OUT,spec-29-R,normal-798-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33839,y:33138,ptlb:bFoam,ptin:_bFoam,tex:c0728b3ea462b8a499b59998cc03f581,ntxv:0,isnm:False|UVIN-11-UVOUT;n:type:ShaderForge.SFN_Color,id:3,x:33385,y:32939,ptlb:FoamColor,ptin:_FoamColor,glob:False,c1:0.05393855,c2:0.04325262,c3:0.1470588,c4:1;n:type:ShaderForge.SFN_TexCoord,id:10,x:34540,y:32805,uv:0;n:type:ShaderForge.SFN_Panner,id:11,x:34128,y:32574,spu:0,spv:0.6|UVIN-698-OUT;n:type:ShaderForge.SFN_Lerp,id:17,x:33097,y:33241|A-3-RGB,B-18-RGB,T-2-RGB;n:type:ShaderForge.SFN_Color,id:18,x:33487,y:33404,ptlb:node_18,ptin:_node_18,glob:False,c1:0.6890467,c2:0.8431373,c3:0.757982,c4:1;n:type:ShaderForge.SFN_Tex2d,id:29,x:33170,y:31942,ptlb:node_29,ptin:_node_29,tex:27113c3f894840c45b70d0a42d261bf4,ntxv:0,isnm:False|UVIN-602-OUT;n:type:ShaderForge.SFN_Lerp,id:45,x:33403,y:33126|A-3-RGB,B-18-RGB,T-46-RGB;n:type:ShaderForge.SFN_Tex2d,id:46,x:33743,y:32841,ptlb:node_46,ptin:_node_46,tex:eb30a80e35de265419719386686fb458,ntxv:0,isnm:False|UVIN-47-UVOUT;n:type:ShaderForge.SFN_Panner,id:47,x:34096,y:32827,spu:0,spv:1|UVIN-698-OUT;n:type:ShaderForge.SFN_Tex2d,id:158,x:33481,y:32423,ptlb:node_158,ptin:_node_158,tex:02aad02c2db0f454b81a0d4db3d09315,ntxv:3,isnm:True|UVIN-159-UVOUT;n:type:ShaderForge.SFN_Panner,id:159,x:33880,y:32264,spu:0,spv:0.25|UVIN-187-OUT;n:type:ShaderForge.SFN_Multiply,id:187,x:34176,y:32223|A-10-UVOUT,B-189-OUT;n:type:ShaderForge.SFN_Vector1,id:189,x:34426,y:32473,v1:0.35;n:type:ShaderForge.SFN_Blend,id:200,x:32987,y:33051,blmd:5,clmp:True|SRC-17-OUT,DST-45-OUT;n:type:ShaderForge.SFN_Color,id:326,x:33880,y:32096,ptlb:node_326,ptin:_node_326,glob:False,c1:0.3102584,c2:0.1930527,c3:0.6911765,c4:1;n:type:ShaderForge.SFN_Blend,id:327,x:33461,y:32184,blmd:5,clmp:True|SRC-326-RGB,DST-158-RGB;n:type:ShaderForge.SFN_Lerp,id:489,x:32846,y:32419|A-200-OUT,B-29-RGB,T-29-A;n:type:ShaderForge.SFN_TexCoord,id:601,x:33583,y:31868,uv:0;n:type:ShaderForge.SFN_Multiply,id:602,x:33395,y:32006|A-601-UVOUT,B-606-OUT;n:type:ShaderForge.SFN_Vector1,id:606,x:33777,y:32073,v1:2;n:type:ShaderForge.SFN_Multiply,id:698,x:34296,y:32935|A-10-UVOUT,B-702-OUT;n:type:ShaderForge.SFN_ValueProperty,id:702,x:34492,y:33061,ptlb:node_702,ptin:_node_702,glob:False,v1:3;n:type:ShaderForge.SFN_Panner,id:763,x:33936,y:32468,spu:0,spv:0.25|UVIN-187-OUT;n:type:ShaderForge.SFN_Tex2d,id:764,x:33650,y:32615,ptlb:node_764,ptin:_node_764,tex:24eb57e14a628cc4caab4f1c51b05ef0,ntxv:3,isnm:True|UVIN-763-UVOUT;n:type:ShaderForge.SFN_Lerp,id:798,x:33138,y:32612|A-764-RGB,B-327-OUT,T-799-A;n:type:ShaderForge.SFN_Tex2d,id:799,x:33340,y:32740,ptlb:node_799,ptin:_node_799,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;proporder:2-3-18-46-158-326-29-702-764-799;pass:END;sub:END;*/

Shader "Shader Forge/Water" {
    Properties {
        _bFoam ("bFoam", 2D) = "white" {}
        _FoamColor ("FoamColor", Color) = (0.05393855,0.04325262,0.1470588,1)
        _node_18 ("node_18", Color) = (0.6890467,0.8431373,0.757982,1)
        _node_46 ("node_46", 2D) = "white" {}
        _node_158 ("node_158", 2D) = "bump" {}
        _node_326 ("node_326", Color) = (0.3102584,0.1930527,0.6911765,1)
        _node_29 ("node_29", 2D) = "white" {}
        _node_702 ("node_702", Float ) = 3
        _node_764 ("node_764", 2D) = "bump" {}
        _node_799 ("node_799", 2D) = "white" {}
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
            #pragma exclude_renderers xbox360 ps3 flash 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _bFoam; uniform float4 _bFoam_ST;
            uniform float4 _FoamColor;
            uniform float4 _node_18;
            uniform sampler2D _node_29; uniform float4 _node_29_ST;
            uniform sampler2D _node_46; uniform float4 _node_46_ST;
            uniform sampler2D _node_158; uniform float4 _node_158_ST;
            uniform float4 _node_326;
            uniform float _node_702;
            uniform sampler2D _node_764; uniform float4 _node_764_ST;
            uniform sampler2D _node_799; uniform float4 _node_799_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
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
                float4 node_836 = _Time + _TimeEditor;
                float2 node_10 = i.uv0;
                float node_189 = 0.35;
                float2 node_187 = (node_10.rg*node_189);
                float2 node_763 = (node_187+node_836.g*float2(0,0.25));
                float3 node_764 = UnpackNormal(tex2D(_node_764,TRANSFORM_TEX(node_763, _node_764)));
                float2 node_159 = (node_187+node_836.g*float2(0,0.25));
                float3 node_158 = UnpackNormal(tex2D(_node_158,TRANSFORM_TEX(node_159, _node_158)));
                float3 node_327 = saturate(max(_node_326.rgb,node_158.rgb));
                float2 node_837 = i.uv0;
                float3 normalLocal = lerp(node_764.rgb,node_327,tex2D(_node_799,TRANSFORM_TEX(node_837.rg, _node_799)).a);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float2 node_602 = (i.uv0.rg*2.0);
                float4 node_29 = tex2D(_node_29,TRANSFORM_TEX(node_602, _node_29));
                float3 specularColor = float3(node_29.r,node_29.r,node_29.r);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float2 node_698 = (node_10.rg*_node_702);
                float2 node_11 = (node_698+node_836.g*float2(0,0.6));
                float4 node_2 = tex2D(_bFoam,TRANSFORM_TEX(node_11, _bFoam));
                float3 node_17 = lerp(_FoamColor.rgb,_node_18.rgb,node_2.rgb);
                float2 node_47 = (node_698+node_836.g*float2(0,1));
                float4 node_46 = tex2D(_node_46,TRANSFORM_TEX(node_47, _node_46));
                float3 node_45 = lerp(_FoamColor.rgb,_node_18.rgb,node_46.rgb);
                finalColor += diffuseLight * lerp(saturate(max(node_17,node_45)),node_29.rgb,node_29.a);
                finalColor += specular;
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
            #pragma exclude_renderers xbox360 ps3 flash 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _bFoam; uniform float4 _bFoam_ST;
            uniform float4 _FoamColor;
            uniform float4 _node_18;
            uniform sampler2D _node_29; uniform float4 _node_29_ST;
            uniform sampler2D _node_46; uniform float4 _node_46_ST;
            uniform sampler2D _node_158; uniform float4 _node_158_ST;
            uniform float4 _node_326;
            uniform float _node_702;
            uniform sampler2D _node_764; uniform float4 _node_764_ST;
            uniform sampler2D _node_799; uniform float4 _node_799_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
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
                float4 node_838 = _Time + _TimeEditor;
                float2 node_10 = i.uv0;
                float node_189 = 0.35;
                float2 node_187 = (node_10.rg*node_189);
                float2 node_763 = (node_187+node_838.g*float2(0,0.25));
                float3 node_764 = UnpackNormal(tex2D(_node_764,TRANSFORM_TEX(node_763, _node_764)));
                float2 node_159 = (node_187+node_838.g*float2(0,0.25));
                float3 node_158 = UnpackNormal(tex2D(_node_158,TRANSFORM_TEX(node_159, _node_158)));
                float3 node_327 = saturate(max(_node_326.rgb,node_158.rgb));
                float2 node_839 = i.uv0;
                float3 normalLocal = lerp(node_764.rgb,node_327,tex2D(_node_799,TRANSFORM_TEX(node_839.rg, _node_799)).a);
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
                float2 node_602 = (i.uv0.rg*2.0);
                float4 node_29 = tex2D(_node_29,TRANSFORM_TEX(node_602, _node_29));
                float3 specularColor = float3(node_29.r,node_29.r,node_29.r);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float2 node_698 = (node_10.rg*_node_702);
                float2 node_11 = (node_698+node_838.g*float2(0,0.6));
                float4 node_2 = tex2D(_bFoam,TRANSFORM_TEX(node_11, _bFoam));
                float3 node_17 = lerp(_FoamColor.rgb,_node_18.rgb,node_2.rgb);
                float2 node_47 = (node_698+node_838.g*float2(0,1));
                float4 node_46 = tex2D(_node_46,TRANSFORM_TEX(node_47, _node_46));
                float3 node_45 = lerp(_FoamColor.rgb,_node_18.rgb,node_46.rgb);
                finalColor += diffuseLight * lerp(saturate(max(node_17,node_45)),node_29.rgb,node_29.a);
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
