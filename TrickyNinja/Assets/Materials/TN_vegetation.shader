// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:,lico:0,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:0,culm:2,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32631,y:32948|diff-1615-OUT,spec-56-OUT,normal-17-RGB,emission-81-OUT,transm-1797-OUT,lwrap-1799-OUT,clip-10-A,voffset-1299-OUT;n:type:ShaderForge.SFN_LightVector,id:6,x:33712,y:32841;n:type:ShaderForge.SFN_NormalVector,id:7,x:33713,y:32994,pt:True;n:type:ShaderForge.SFN_Dot,id:8,x:33499,y:32888,dt:1|A-6-OUT,B-7-OUT;n:type:ShaderForge.SFN_Tex2d,id:10,x:34383,y:32519,ptlb:Diffuse,ptin:_Diffuse,tex:b43d82ab1c4a04d4db61f836d1b71592,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:11,x:33293,y:32823|A-719-OUT,B-8-OUT;n:type:ShaderForge.SFN_Tex2d,id:17,x:33103,y:32919,ptlb:Normal,ptin:_Normal,tex:12e44c0e469cf3f46a70d5c9e7790c57,ntxv:2,isnm:False;n:type:ShaderForge.SFN_HalfVector,id:34,x:33714,y:33163;n:type:ShaderForge.SFN_Dot,id:36,x:33450,y:33094,dt:1|A-7-OUT,B-34-OUT;n:type:ShaderForge.SFN_Power,id:37,x:33332,y:33094|VAL-36-OUT,EXP-64-OUT;n:type:ShaderForge.SFN_Slider,id:46,x:33934,y:33486,ptlb:Glossiness,ptin:_Glossiness,min:1,cur:11.60454,max:25;n:type:ShaderForge.SFN_Slider,id:55,x:33509,y:33470,ptlb:Specularity,ptin:_Specularity,min:1,cur:2.232889,max:6;n:type:ShaderForge.SFN_Multiply,id:56,x:33066,y:33101,cmnt:specular contribution|A-37-OUT,B-687-OUT;n:type:ShaderForge.SFN_Exp,id:64,x:33509,y:33246,et:1|IN-694-OUT;n:type:ShaderForge.SFN_AmbientLight,id:75,x:33629,y:32545;n:type:ShaderForge.SFN_Multiply,id:81,x:33293,y:32673|A-75-RGB,B-719-OUT;n:type:ShaderForge.SFN_Tex2d,id:680,x:33509,y:33591,ptlb:Specular,ptin:_Specular,tex:c299858234161e841b0f99ee384feb87,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:687,x:33308,y:33441|A-55-OUT,B-680-RGB;n:type:ShaderForge.SFN_Tex2d,id:693,x:33889,y:33257,ptlb:Gloss,ptin:_Gloss,tex:c299858234161e841b0f99ee384feb87,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:694,x:33690,y:33301|A-693-RGB,B-46-OUT;n:type:ShaderForge.SFN_Color,id:711,x:33875,y:32776,ptlb:Diffuse Color,ptin:_DiffuseColor,glob:False,c1:0.594677,c2:0.7794118,c3:0.07450257,c4:1;n:type:ShaderForge.SFN_Multiply,id:719,x:33629,y:32693|A-1178-OUT,B-711-RGB;n:type:ShaderForge.SFN_Vector3,id:722,x:34115,y:32595,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Lerp,id:1178,x:33875,y:32616|A-722-OUT,B-1262-OUT,T-1234-OUT;n:type:ShaderForge.SFN_Slider,id:1234,x:34115,y:32859,ptlb:Diffuse Value,ptin:_DiffuseValue,min:0,cur:0.488385,max:1;n:type:ShaderForge.SFN_Vector1,id:1244,x:34383,y:32706,v1:4;n:type:ShaderForge.SFN_Multiply,id:1262,x:34115,y:32686|A-10-RGB,B-1244-OUT;n:type:ShaderForge.SFN_VertexColor,id:1293,x:34014,y:34052;n:type:ShaderForge.SFN_Pi,id:1294,x:34013,y:34206;n:type:ShaderForge.SFN_Multiply,id:1295,x:33811,y:34151|A-1293-B,B-1294-OUT;n:type:ShaderForge.SFN_Time,id:1296,x:34013,y:34333;n:type:ShaderForge.SFN_Add,id:1297,x:33614,y:34198|A-1295-OUT,B-1358-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1298,x:33438,y:34354,ptlb:Amplitude,ptin:_Amplitude,glob:False,v1:0.03;n:type:ShaderForge.SFN_Multiply,id:1299,x:33234,y:34074|A-1320-OUT,B-1293-R,C-1300-OUT,D-1298-OUT;n:type:ShaderForge.SFN_Sin,id:1300,x:33438,y:34180|IN-1297-OUT;n:type:ShaderForge.SFN_Vector4Property,id:1308,x:34005,y:33749,ptlb:Wind Direction,ptin:_WindDirection,glob:False,v1:1,v2:0.5,v3:0.5,v4:0;n:type:ShaderForge.SFN_NormalVector,id:1310,x:34010,y:33903,pt:True;n:type:ShaderForge.SFN_Add,id:1311,x:33779,y:33854|A-1308-XYZ,B-1310-OUT;n:type:ShaderForge.SFN_Normalize,id:1320,x:33551,y:33918|IN-1311-OUT;n:type:ShaderForge.SFN_Multiply,id:1358,x:33811,y:34297|A-1296-T,B-1361-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1361,x:34013,y:34503,ptlb:Wind Power,ptin:_WindPower,glob:False,v1:1.5;n:type:ShaderForge.SFN_VertexColor,id:1388,x:33440,y:32263,cmnt:tip color;n:type:ShaderForge.SFN_Desaturate,id:1588,x:33875,y:32422|COL-10-RGB,DES-1750-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:1615,x:32993,y:32757,cmnt:diffuse color|M-1388-RGB,R-11-OUT,G-1773-OUT,B-11-OUT;n:type:ShaderForge.SFN_Color,id:1718,x:33716,y:32276,ptlb:Tip Color,ptin:_TipColor,glob:False,c1:0.9863105,c2:1,c3:0.007515132,c4:1;n:type:ShaderForge.SFN_Blend,id:1727,x:33507,y:32391,blmd:10,clmp:True|SRC-1718-RGB,DST-1588-OUT;n:type:ShaderForge.SFN_Vector1,id:1750,x:34060,y:32511,v1:1;n:type:ShaderForge.SFN_Multiply,id:1773,x:33293,y:32526|A-1727-OUT,B-1774-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1774,x:33684,y:32481,ptlb:Tip Brightness,ptin:_TipBrightness,glob:False,v1:1.5;n:type:ShaderForge.SFN_Vector3,id:1797,x:33067,y:33251,v1:0.9,v2:1,v3:0.5;n:type:ShaderForge.SFN_Vector3,id:1799,x:33067,y:33359,v1:0.9,v2:0.9,v3:0.8;proporder:10-17-46-55-680-693-711-1234-1298-1308-1361-1718-1774;pass:END;sub:END;*/

Shader "Shader Forge/TN_vegetation" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Normal ("Normal", 2D) = "black" {}
        _Glossiness ("Glossiness", Range(1, 25)) = 11.60454
        _Specularity ("Specularity", Range(1, 6)) = 2.232889
        _Specular ("Specular", 2D) = "white" {}
        _Gloss ("Gloss", 2D) = "white" {}
        _DiffuseColor ("Diffuse Color", Color) = (0.594677,0.7794118,0.07450257,1)
        _DiffuseValue ("Diffuse Value", Range(0, 1)) = 0.488385
        _Amplitude ("Amplitude", Float ) = 0.03
        _WindDirection ("Wind Direction", Vector) = (1,0.5,0.5,0)
        _WindPower ("Wind Power", Float ) = 1.5
        _TipColor ("Tip Color", Color) = (0.9863105,1,0.007515132,1)
        _TipBrightness ("Tip Brightness", Float ) = 1.5
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
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
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _Glossiness;
            uniform float _Specularity;
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform sampler2D _Gloss; uniform float4 _Gloss_ST;
            uniform float4 _DiffuseColor;
            uniform float _DiffuseValue;
            uniform float _Amplitude;
            uniform float4 _WindDirection;
            uniform float _WindPower;
            uniform float4 _TipColor;
            uniform float _TipBrightness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float4 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.vertexColor = v.vertexColor;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_1293 = o.vertexColor;
                float4 node_1296 = _Time + _TimeEditor;
                v.vertex.xyz += (normalize((_WindDirection.rgb+v.normal))*node_1293.r*sin(((node_1293.b*3.141592654)+(node_1296.g*_WindPower)))*_Amplitude);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                float2 node_1825 = i.uv0;
                float4 node_10 = tex2D(_Diffuse,TRANSFORM_TEX(node_1825.rg, _Diffuse));
                clip(node_10.a - 0.5);
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalLocal = tex2D(_Normal,TRANSFORM_TEX(node_1825.rg, _Normal)).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 w = float3(0.9,0.9,0.8)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 backLight = max(float3(0.0,0.0,0.0), -NdotLWrap + w ) * float3(0.9,1,0.5);
                float3 diffuse = (forwardLight+backLight) * attenColor + UNITY_LIGHTMODEL_AMBIENT.xyz;
////// Emissive:
                float3 node_719 = (lerp(float3(0,0,0),(node_10.rgb*4.0),_DiffuseValue)*_DiffuseColor.rgb);
                float3 emissive = (UNITY_LIGHTMODEL_AMBIENT.rgb*node_719);
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 node_7 = normalDirection;
                float3 specularColor = (pow(max(0,dot(node_7,halfDirection)),exp2((tex2D(_Gloss,TRANSFORM_TEX(node_1825.rg, _Gloss)).rgb*_Glossiness)))*(_Specularity*tex2D(_Specular,TRANSFORM_TEX(node_1825.rg, _Specular)).rgb));
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float4 node_1388 = i.vertexColor; // tip color
                float3 node_11 = (node_719*max(0,dot(lightDirection,node_7)));
                finalColor += diffuseLight * (node_1388.rgb.r*node_11 + node_1388.rgb.g*(saturate(( lerp(node_10.rgb,dot(node_10.rgb,float3(0.3,0.59,0.11)),1.0) > 0.5 ? (1.0-(1.0-2.0*(lerp(node_10.rgb,dot(node_10.rgb,float3(0.3,0.59,0.11)),1.0)-0.5))*(1.0-_TipColor.rgb)) : (2.0*lerp(node_10.rgb,dot(node_10.rgb,float3(0.3,0.59,0.11)),1.0)*_TipColor.rgb) ))*_TipBrightness) + node_1388.rgb.b*node_11);
                finalColor += specular;
                finalColor += emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCollector"
            Tags {
                "LightMode"="ShadowCollector"
            }
            Cull Off
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCOLLECTOR
            #define SHADOW_COLLECTOR_PASS
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcollector
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _Amplitude;
            uniform float4 _WindDirection;
            uniform float _WindPower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_COLLECTOR;
                float4 uv0 : TEXCOORD5;
                float3 normalDir : TEXCOORD6;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.vertexColor = v.vertexColor;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float4 node_1293 = o.vertexColor;
                float4 node_1296 = _Time + _TimeEditor;
                v.vertex.xyz += (normalize((_WindDirection.rgb+v.normal))*node_1293.r*sin(((node_1293.b*3.141592654)+(node_1296.g*_WindPower)))*_Amplitude);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_COLLECTOR(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                float2 node_1826 = i.uv0;
                float4 node_10 = tex2D(_Diffuse,TRANSFORM_TEX(node_1826.rg, _Diffuse));
                clip(node_10.a - 0.5);
                i.normalDir = normalize(i.normalDir);
                SHADOW_COLLECTOR_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Cull Off
            Offset 1, 1
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _Amplitude;
            uniform float4 _WindDirection;
            uniform float _WindPower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.vertexColor = v.vertexColor;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                float4 node_1293 = o.vertexColor;
                float4 node_1296 = _Time + _TimeEditor;
                v.vertex.xyz += (normalize((_WindDirection.rgb+v.normal))*node_1293.r*sin(((node_1293.b*3.141592654)+(node_1296.g*_WindPower)))*_Amplitude);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                float2 node_1827 = i.uv0;
                float4 node_10 = tex2D(_Diffuse,TRANSFORM_TEX(node_1827.rg, _Diffuse));
                clip(node_10.a - 0.5);
                i.normalDir = normalize(i.normalDir);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
