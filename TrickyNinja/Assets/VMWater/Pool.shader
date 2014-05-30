// Shader created with Shader Forge Beta 0.34 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:False,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:31494,y:32590|diff-1138-OUT,spec-46-A,normal-1188-OUT,emission-1138-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33788,y:32233,ptlb:bFoam,ptin:_bFoam,tex:c0728b3ea462b8a499b59998cc03f581,ntxv:0,isnm:False|UVIN-1718-UVOUT;n:type:ShaderForge.SFN_Color,id:3,x:33334,y:32034,ptlb:WaterColor,ptin:_WaterColor,glob:False,c1:0.05393855,c2:0.04325262,c3:0.1470588,c4:1;n:type:ShaderForge.SFN_TexCoord,id:10,x:34839,y:31923,uv:0;n:type:ShaderForge.SFN_Panner,id:11,x:34077,y:31669,spu:-1,spv:0.1|UVIN-698-OUT;n:type:ShaderForge.SFN_Lerp,id:17,x:33046,y:32336|A-3-RGB,B-18-RGB,T-2-RGB;n:type:ShaderForge.SFN_Color,id:18,x:33436,y:32499,ptlb:FoaMcOLOR,ptin:_FoaMcOLOR,glob:False,c1:0.6890467,c2:0.8431373,c3:0.757982,c4:1;n:type:ShaderForge.SFN_Lerp,id:45,x:33352,y:32221|A-3-RGB,B-18-RGB,T-46-RGB;n:type:ShaderForge.SFN_Tex2d,id:46,x:33692,y:31934,ptlb:Foam2,ptin:_Foam2,tex:eb30a80e35de265419719386686fb458,ntxv:0,isnm:False|UVIN-11-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:158,x:33486,y:31547,ptlb:WaveNormal,ptin:_WaveNormal,tex:3789cba3306a4c14c866e2c00bbfc7cd,ntxv:3,isnm:True|UVIN-1990-UVOUT;n:type:ShaderForge.SFN_Blend,id:200,x:32936,y:32146,blmd:5,clmp:True|SRC-17-OUT,DST-45-OUT;n:type:ShaderForge.SFN_Color,id:326,x:33829,y:31191,ptlb:Flat normal color,ptin:_Flatnormalcolor,glob:False,c1:0.3102584,c2:0.1930527,c3:0.6911765,c4:1;n:type:ShaderForge.SFN_Blend,id:327,x:33410,y:31279,blmd:5,clmp:True|SRC-326-RGB,DST-158-RGB;n:type:ShaderForge.SFN_TexCoord,id:601,x:33760,y:30893,uv:0;n:type:ShaderForge.SFN_Multiply,id:602,x:33344,y:31101|A-601-UVOUT,B-606-OUT;n:type:ShaderForge.SFN_Vector1,id:606,x:33902,y:31096,v1:10;n:type:ShaderForge.SFN_Multiply,id:698,x:34262,y:31957|A-1843-OUT,B-702-OUT;n:type:ShaderForge.SFN_ValueProperty,id:702,x:34419,y:32149,ptlb:tILER,ptin:_tILER,glob:False,v1:3;n:type:ShaderForge.SFN_Tex2d,id:1074,x:33258,y:32772,ptlb:node_1074,ptin:_node_1074,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-1941-UVOUT;n:type:ShaderForge.SFN_Lerp,id:1075,x:32901,y:32914|A-1076-RGB,B-3-RGB,T-1074-RGB;n:type:ShaderForge.SFN_Color,id:1076,x:33139,y:32986,ptlb:node_1076,ptin:_node_1076,glob:False,c1:0.01422413,c2:0.1005642,c3:0.125,c4:1;n:type:ShaderForge.SFN_Lerp,id:1138,x:32419,y:32562|A-1075-OUT,B-200-OUT,T-1682-OUT;n:type:ShaderForge.SFN_VertexColor,id:1139,x:32427,y:32176;n:type:ShaderForge.SFN_Lerp,id:1188,x:31808,y:31431|A-1189-RGB,B-158-RGB,T-2027-OUT;n:type:ShaderForge.SFN_Tex2d,id:1189,x:32327,y:30494,ptlb:node_1189,ptin:_node_1189,tex:24eb57e14a628cc4caab4f1c51b05ef0,ntxv:3,isnm:True|UVIN-1201-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1200,x:33215,y:30526,uv:0;n:type:ShaderForge.SFN_Panner,id:1201,x:32707,y:30478,spu:0.5,spv:0.5|UVIN-1202-OUT;n:type:ShaderForge.SFN_Multiply,id:1202,x:33020,y:30672|A-1200-UVOUT,B-1203-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1203,x:33348,y:30800,ptlb:node_1203,ptin:_node_1203,glob:False,v1:10;n:type:ShaderForge.SFN_Multiply,id:1682,x:32340,y:32811|A-1139-R,B-1684-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1684,x:32526,y:33053,ptlb:node_1684,ptin:_node_1684,glob:False,v1:0.05;n:type:ShaderForge.SFN_Panner,id:1718,x:34047,y:32072,spu:-1,spv:-0.1|UVIN-698-OUT;n:type:ShaderForge.SFN_Add,id:1843,x:34582,y:32115|A-10-UVOUT,B-1845-OUT;n:type:ShaderForge.SFN_Vector1,id:1845,x:34700,y:32315,v1:0.25;n:type:ShaderForge.SFN_TexCoord,id:1940,x:33844,y:32860,uv:0;n:type:ShaderForge.SFN_Panner,id:1941,x:33583,y:32830,spu:0.1,spv:0.1|UVIN-1948-OUT;n:type:ShaderForge.SFN_Multiply,id:1948,x:33599,y:33053|A-1940-UVOUT,B-1952-OUT;n:type:ShaderForge.SFN_Vector1,id:1952,x:33840,y:33147,v1:3;n:type:ShaderForge.SFN_TexCoord,id:1988,x:34470,y:31436,uv:0;n:type:ShaderForge.SFN_Multiply,id:1989,x:34083,y:31408|A-1988-UVOUT,B-1991-OUT;n:type:ShaderForge.SFN_Panner,id:1990,x:33883,y:31464,spu:-0.25,spv:0.1|UVIN-1989-OUT;n:type:ShaderForge.SFN_Vector1,id:1991,x:34307,y:31658,v1:1;n:type:ShaderForge.SFN_VertexColor,id:2013,x:32716,y:31696;n:type:ShaderForge.SFN_Multiply,id:2027,x:32477,y:31833|A-2013-R,B-2028-OUT;n:type:ShaderForge.SFN_Vector1,id:2028,x:32655,y:31981,v1:1;proporder:2-3-18-46-158-326-702-1074-1076-1189-1203-1684;pass:END;sub:END;*/

Shader "VMWater/Pool" {
    Properties {
        _bFoam ("bFoam", 2D) = "white" {}
        _WaterColor ("WaterColor", Color) = (0.05393855,0.04325262,0.1470588,1)
        _FoaMcOLOR ("FoaMcOLOR", Color) = (0.6890467,0.8431373,0.757982,1)
        _Foam2 ("Foam2", 2D) = "white" {}
        _WaveNormal ("WaveNormal", 2D) = "bump" {}
        _Flatnormalcolor ("Flat normal color", Color) = (0.3102584,0.1930527,0.6911765,1)
        _tILER ("tILER", Float ) = 3
        _node_1074 ("node_1074", 2D) = "white" {}
        _node_1076 ("node_1076", Color) = (0.01422413,0.1005642,0.125,1)
        _node_1189 ("node_1189", 2D) = "bump" {}
        _node_1203 ("node_1203", Float ) = 10
        _node_1684 ("node_1684", Float ) = 0.05
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
            uniform float4 _WaterColor;
            uniform float4 _FoaMcOLOR;
            uniform sampler2D _Foam2; uniform float4 _Foam2_ST;
            uniform sampler2D _WaveNormal; uniform float4 _WaveNormal_ST;
            uniform float _tILER;
            uniform sampler2D _node_1074; uniform float4 _node_1074_ST;
            uniform float4 _node_1076;
            uniform sampler2D _node_1189; uniform float4 _node_1189_ST;
            uniform float _node_1203;
            uniform float _node_1684;
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
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float4 node_2056 = _Time + _TimeEditor;
                float2 node_1201 = ((i.uv0.rg*_node_1203)+node_2056.g*float2(0.5,0.5));
                float2 node_1990 = ((i.uv0.rg*1.0)+node_2056.g*float2(-0.25,0.1));
                float3 node_158 = UnpackNormal(tex2D(_WaveNormal,TRANSFORM_TEX(node_1990, _WaveNormal)));
                float3 normalLocal = lerp(UnpackNormal(tex2D(_node_1189,TRANSFORM_TEX(node_1201, _node_1189))).rgb,node_158.rgb,(i.vertexColor.r*1.0));
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
                float2 node_1941 = ((i.uv0.rg*3.0)+node_2056.g*float2(0.1,0.1));
                float2 node_698 = ((i.uv0.rg+0.25)*_tILER);
                float2 node_1718 = (node_698+node_2056.g*float2(-1,-0.1));
                float2 node_11 = (node_698+node_2056.g*float2(-1,0.1));
                float4 node_46 = tex2D(_Foam2,TRANSFORM_TEX(node_11, _Foam2));
                float3 node_200 = saturate(max(lerp(_WaterColor.rgb,_FoaMcOLOR.rgb,tex2D(_bFoam,TRANSFORM_TEX(node_1718, _bFoam)).rgb),lerp(_WaterColor.rgb,_FoaMcOLOR.rgb,node_46.rgb)));
                float3 node_1138 = lerp(lerp(_node_1076.rgb,_WaterColor.rgb,tex2D(_node_1074,TRANSFORM_TEX(node_1941, _node_1074)).rgb),node_200,(i.vertexColor.r*_node_1684));
                float3 emissive = node_1138;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = float3(node_46.a,node_46.a,node_46.a);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * node_1138;
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
            #pragma exclude_renderers xbox360 ps3 flash 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _bFoam; uniform float4 _bFoam_ST;
            uniform float4 _WaterColor;
            uniform float4 _FoaMcOLOR;
            uniform sampler2D _Foam2; uniform float4 _Foam2_ST;
            uniform sampler2D _WaveNormal; uniform float4 _WaveNormal_ST;
            uniform float _tILER;
            uniform sampler2D _node_1074; uniform float4 _node_1074_ST;
            uniform float4 _node_1076;
            uniform sampler2D _node_1189; uniform float4 _node_1189_ST;
            uniform float _node_1203;
            uniform float _node_1684;
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
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
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
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float4 node_2057 = _Time + _TimeEditor;
                float2 node_1201 = ((i.uv0.rg*_node_1203)+node_2057.g*float2(0.5,0.5));
                float2 node_1990 = ((i.uv0.rg*1.0)+node_2057.g*float2(-0.25,0.1));
                float3 node_158 = UnpackNormal(tex2D(_WaveNormal,TRANSFORM_TEX(node_1990, _WaveNormal)));
                float3 normalLocal = lerp(UnpackNormal(tex2D(_node_1189,TRANSFORM_TEX(node_1201, _node_1189))).rgb,node_158.rgb,(i.vertexColor.r*1.0));
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
                float2 node_698 = ((i.uv0.rg+0.25)*_tILER);
                float2 node_11 = (node_698+node_2057.g*float2(-1,0.1));
                float4 node_46 = tex2D(_Foam2,TRANSFORM_TEX(node_11, _Foam2));
                float3 specularColor = float3(node_46.a,node_46.a,node_46.a);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float2 node_1941 = ((i.uv0.rg*3.0)+node_2057.g*float2(0.1,0.1));
                float2 node_1718 = (node_698+node_2057.g*float2(-1,-0.1));
                float3 node_200 = saturate(max(lerp(_WaterColor.rgb,_FoaMcOLOR.rgb,tex2D(_bFoam,TRANSFORM_TEX(node_1718, _bFoam)).rgb),lerp(_WaterColor.rgb,_FoaMcOLOR.rgb,node_46.rgb)));
                float3 node_1138 = lerp(lerp(_node_1076.rgb,_WaterColor.rgb,tex2D(_node_1074,TRANSFORM_TEX(node_1941, _node_1074)).rgb),node_200,(i.vertexColor.r*_node_1684));
                finalColor += diffuseLight * node_1138;
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
