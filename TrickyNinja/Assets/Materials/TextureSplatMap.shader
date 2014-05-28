// Shader created with Shader Forge Beta 0.32 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.32;sub:START;pass:START;ps:flbk:Bumped Diffuse,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32719,y:32712|diff-6-OUT,spec-38-OUT,normal-29-OUT;n:type:ShaderForge.SFN_VertexColor,id:5,x:33713,y:32549;n:type:ShaderForge.SFN_ChannelBlend,id:6,x:33426,y:32758,cmnt:diffuse blend|M-5-RGB,R-23-RGB,G-24-RGB,B-25-RGB;n:type:ShaderForge.SFN_Tex2d,id:23,x:33713,y:32717,ptlb:Red Diffuse,ptin:_RedDiffuse,tex:185be0d60dbe9bd41a767ba32cced1da,ntxv:0,isnm:False|UVIN-92-OUT;n:type:ShaderForge.SFN_Tex2d,id:24,x:33713,y:32932,ptlb:Green Diffuse,ptin:_GreenDiffuse,tex:49d0dc9565f670f44a18ecaf2fdb15dc,ntxv:0,isnm:False|UVIN-102-OUT;n:type:ShaderForge.SFN_Tex2d,id:25,x:33713,y:33163,ptlb:Blue Diffuse,ptin:_BlueDiffuse,tex:6da499c27587740a2a5035de1e712062,ntxv:0,isnm:False|UVIN-108-OUT;n:type:ShaderForge.SFN_Tex2d,id:26,x:33885,y:32865,ptlb:Red Normal,ptin:_RedNormal,ntxv:3,isnm:True|UVIN-92-OUT;n:type:ShaderForge.SFN_Tex2d,id:27,x:33884,y:33084,ptlb:Green Normal,ptin:_GreenNormal,ntxv:3,isnm:True|UVIN-102-OUT;n:type:ShaderForge.SFN_Tex2d,id:28,x:33884,y:33317,ptlb:Blue Normal,ptin:_BlueNormal,ntxv:3,isnm:True|UVIN-108-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:29,x:33426,y:33009,cmnt:normal blend|M-5-RGB,R-26-RGB,G-27-RGB,B-28-RGB;n:type:ShaderForge.SFN_Tex2d,id:35,x:34076,y:32990,ptlb:Red Specular,ptin:_RedSpecular,ntxv:0,isnm:False|UVIN-92-OUT;n:type:ShaderForge.SFN_Tex2d,id:36,x:34068,y:33219,ptlb:Green Specular,ptin:_GreenSpecular,ntxv:0,isnm:False|UVIN-102-OUT;n:type:ShaderForge.SFN_Tex2d,id:37,x:34061,y:33488,ptlb:Blue Specular,ptin:_BlueSpecular,ntxv:0,isnm:False|UVIN-108-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:38,x:33426,y:33255,cmnt:specular blend|M-5-RGB,R-35-RGB,G-36-RGB,B-37-RGB;n:type:ShaderForge.SFN_ChannelBlend,id:44,x:33426,y:33466,cmnt:gloss blend|M-5-RGB,R-35-A,G-36-A,B-37-A;n:type:ShaderForge.SFN_TexCoord,id:91,x:34369,y:32488,uv:0;n:type:ShaderForge.SFN_Multiply,id:92,x:34168,y:32602|A-91-UVOUT,B-93-OUT;n:type:ShaderForge.SFN_ValueProperty,id:93,x:34369,y:32688,ptlb:Red Map Tile,ptin:_RedMapTile,glob:False,v1:1;n:type:ShaderForge.SFN_TexCoord,id:100,x:34556,y:32708,uv:0;n:type:ShaderForge.SFN_Multiply,id:102,x:34357,y:32820|A-100-UVOUT,B-104-OUT;n:type:ShaderForge.SFN_ValueProperty,id:104,x:34556,y:32908,ptlb:Green Map Tile,ptin:_GreenMapTile,glob:False,v1:1;n:type:ShaderForge.SFN_TexCoord,id:106,x:34642,y:33010,uv:0;n:type:ShaderForge.SFN_Multiply,id:108,x:34443,y:33122|A-106-UVOUT,B-110-OUT;n:type:ShaderForge.SFN_ValueProperty,id:110,x:34642,y:33210,ptlb:Blue Map Tile,ptin:_BlueMapTile,glob:False,v1:1;proporder:93-23-26-35-104-24-27-36-110-25-28-37;pass:END;sub:END;*/

Shader "Custom/TextureBlend" {
    Properties {
        _RedMapTile ("Red Map Tile", Float ) = 1
        _RedDiffuse ("Red Diffuse", 2D) = "white" {}
        _RedNormal ("Red Normal", 2D) = "bump" {}
        _RedSpecular ("Red Specular", 2D) = "white" {}
        _GreenMapTile ("Green Map Tile", Float ) = 1
        _GreenDiffuse ("Green Diffuse", 2D) = "white" {}
        _GreenNormal ("Green Normal", 2D) = "bump" {}
        _GreenSpecular ("Green Specular", 2D) = "white" {}
        _BlueMapTile ("Blue Map Tile", Float ) = 1
        _BlueDiffuse ("Blue Diffuse", 2D) = "white" {}
        _BlueNormal ("Blue Normal", 2D) = "bump" {}
        _BlueSpecular ("Blue Specular", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
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
            uniform sampler2D _RedDiffuse; uniform float4 _RedDiffuse_ST;
            uniform sampler2D _GreenDiffuse; uniform float4 _GreenDiffuse_ST;
            uniform sampler2D _BlueDiffuse; uniform float4 _BlueDiffuse_ST;
            uniform sampler2D _RedNormal; uniform float4 _RedNormal_ST;
            uniform sampler2D _GreenNormal; uniform float4 _GreenNormal_ST;
            uniform sampler2D _BlueNormal; uniform float4 _BlueNormal_ST;
            uniform sampler2D _RedSpecular; uniform float4 _RedSpecular_ST;
            uniform sampler2D _GreenSpecular; uniform float4 _GreenSpecular_ST;
            uniform sampler2D _BlueSpecular; uniform float4 _BlueSpecular_ST;
            uniform float _RedMapTile;
            uniform float _GreenMapTile;
            uniform float _BlueMapTile;
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
                float4 node_5 = i.vertexColor;
                float2 node_92 = (i.uv0.rg*_RedMapTile);
                float2 node_102 = (i.uv0.rg*_GreenMapTile);
                float2 node_108 = (i.uv0.rg*_BlueMapTile);
                float3 normalLocal = (node_5.rgb.r*UnpackNormal(tex2D(_RedNormal,TRANSFORM_TEX(node_92, _RedNormal))).rgb + node_5.rgb.g*UnpackNormal(tex2D(_GreenNormal,TRANSFORM_TEX(node_102, _GreenNormal))).rgb + node_5.rgb.b*UnpackNormal(tex2D(_BlueNormal,TRANSFORM_TEX(node_108, _BlueNormal))).rgb);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float4 node_35 = tex2D(_RedSpecular,TRANSFORM_TEX(node_92, _RedSpecular));
                float4 node_36 = tex2D(_GreenSpecular,TRANSFORM_TEX(node_102, _GreenSpecular));
                float4 node_37 = tex2D(_BlueSpecular,TRANSFORM_TEX(node_108, _BlueSpecular));
                float3 specularColor = (node_5.rgb.r*node_35.rgb + node_5.rgb.g*node_36.rgb + node_5.rgb.b*node_37.rgb);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * (node_5.rgb.r*tex2D(_RedDiffuse,TRANSFORM_TEX(node_92, _RedDiffuse)).rgb + node_5.rgb.g*tex2D(_GreenDiffuse,TRANSFORM_TEX(node_102, _GreenDiffuse)).rgb + node_5.rgb.b*tex2D(_BlueDiffuse,TRANSFORM_TEX(node_108, _BlueDiffuse)).rgb);
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
            uniform sampler2D _RedDiffuse; uniform float4 _RedDiffuse_ST;
            uniform sampler2D _GreenDiffuse; uniform float4 _GreenDiffuse_ST;
            uniform sampler2D _BlueDiffuse; uniform float4 _BlueDiffuse_ST;
            uniform sampler2D _RedNormal; uniform float4 _RedNormal_ST;
            uniform sampler2D _GreenNormal; uniform float4 _GreenNormal_ST;
            uniform sampler2D _BlueNormal; uniform float4 _BlueNormal_ST;
            uniform sampler2D _RedSpecular; uniform float4 _RedSpecular_ST;
            uniform sampler2D _GreenSpecular; uniform float4 _GreenSpecular_ST;
            uniform sampler2D _BlueSpecular; uniform float4 _BlueSpecular_ST;
            uniform float _RedMapTile;
            uniform float _GreenMapTile;
            uniform float _BlueMapTile;
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
                float4 node_5 = i.vertexColor;
                float2 node_92 = (i.uv0.rg*_RedMapTile);
                float2 node_102 = (i.uv0.rg*_GreenMapTile);
                float2 node_108 = (i.uv0.rg*_BlueMapTile);
                float3 normalLocal = (node_5.rgb.r*UnpackNormal(tex2D(_RedNormal,TRANSFORM_TEX(node_92, _RedNormal))).rgb + node_5.rgb.g*UnpackNormal(tex2D(_GreenNormal,TRANSFORM_TEX(node_102, _GreenNormal))).rgb + node_5.rgb.b*UnpackNormal(tex2D(_BlueNormal,TRANSFORM_TEX(node_108, _BlueNormal))).rgb);
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
                float4 node_35 = tex2D(_RedSpecular,TRANSFORM_TEX(node_92, _RedSpecular));
                float4 node_36 = tex2D(_GreenSpecular,TRANSFORM_TEX(node_102, _GreenSpecular));
                float4 node_37 = tex2D(_BlueSpecular,TRANSFORM_TEX(node_108, _BlueSpecular));
                float3 specularColor = (node_5.rgb.r*node_35.rgb + node_5.rgb.g*node_36.rgb + node_5.rgb.b*node_37.rgb);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * (node_5.rgb.r*tex2D(_RedDiffuse,TRANSFORM_TEX(node_92, _RedDiffuse)).rgb + node_5.rgb.g*tex2D(_GreenDiffuse,TRANSFORM_TEX(node_102, _GreenDiffuse)).rgb + node_5.rgb.b*tex2D(_BlueDiffuse,TRANSFORM_TEX(node_108, _BlueDiffuse)).rgb);
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Bumped Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
