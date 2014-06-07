// Shader created with Shader Forge Beta 0.34 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:31932,y:32514|diff-44-OUT,normal-80-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:32892,y:31827,ptlb:Outside,ptin:_Outside,tex:18b550561b3bbc14b9997dc167fa929a,ntxv:0,isnm:False|UVIN-1426-OUT;n:type:ShaderForge.SFN_Tex2d,id:3,x:32892,y:32010,ptlb:Middle,ptin:_Middle,tex:244e0b9736bc60844a3df155b829bcd2,ntxv:0,isnm:False|UVIN-1426-OUT;n:type:ShaderForge.SFN_Tex2d,id:4,x:32892,y:32231,ptlb:Blend,ptin:_Blend,tex:b11b21d024869054bbb79f6cca11b62b,ntxv:0,isnm:False|UVIN-1426-OUT;n:type:ShaderForge.SFN_Lerp,id:6,x:32576,y:31993|A-2-RGB,B-3-RGB,T-7-R;n:type:ShaderForge.SFN_VertexColor,id:7,x:32919,y:32438;n:type:ShaderForge.SFN_Lerp,id:43,x:32587,y:32191|A-3-RGB,B-4-RGB,T-7-G;n:type:ShaderForge.SFN_Blend,id:44,x:32333,y:32085,cmnt:Diffuse,blmd:10,clmp:True|SRC-43-OUT,DST-6-OUT;n:type:ShaderForge.SFN_Tex2d,id:56,x:33528,y:32405,ptlb:Outside Normal,ptin:_OutsideNormal,tex:8dc9e3a290b3d2f45bf3a81b7d6203e5,ntxv:3,isnm:True|UVIN-1426-OUT;n:type:ShaderForge.SFN_Tex2d,id:58,x:33528,y:32588,ptlb:Middle Normal,ptin:_MiddleNormal,tex:244e0b9736bc60844a3df155b829bcd2,ntxv:3,isnm:True|UVIN-1426-OUT;n:type:ShaderForge.SFN_Tex2d,id:60,x:33528,y:32809,ptlb:Blend Normal,ptin:_BlendNormal,tex:5d5b7e333bb427b41829295a77add215,ntxv:0,isnm:False|UVIN-1426-OUT;n:type:ShaderForge.SFN_Lerp,id:62,x:33212,y:32571|A-56-RGB,B-58-RGB,T-64-R;n:type:ShaderForge.SFN_VertexColor,id:64,x:33555,y:33016;n:type:ShaderForge.SFN_Lerp,id:66,x:33223,y:32769|A-58-RGB,B-60-RGB,T-64-G;n:type:ShaderForge.SFN_NormalBlend,id:80,x:32945,y:32656|BSE-62-OUT,DTL-66-OUT;n:type:ShaderForge.SFN_TexCoord,id:1425,x:33378,y:31792,uv:0;n:type:ShaderForge.SFN_Multiply,id:1426,x:33188,y:31985|A-1425-UVOUT,B-1427-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1427,x:33415,y:32066,ptlb:node_1427,ptin:_node_1427,glob:False,v1:1;proporder:2-3-4-56-58-60-1427;pass:END;sub:END;*/

Shader "Shader Forge/Riverbed" {
    Properties {
        _Outside ("Outside", 2D) = "white" {}
        _Middle ("Middle", 2D) = "white" {}
        _Blend ("Blend", 2D) = "white" {}
        _OutsideNormal ("Outside Normal", 2D) = "bump" {}
        _MiddleNormal ("Middle Normal", 2D) = "bump" {}
        _BlendNormal ("Blend Normal", 2D) = "white" {}
        _node_1427 ("node_1427", Float ) = 1
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
            uniform sampler2D _Outside; uniform float4 _Outside_ST;
            uniform sampler2D _Middle; uniform float4 _Middle_ST;
            uniform sampler2D _Blend; uniform float4 _Blend_ST;
            uniform sampler2D _OutsideNormal; uniform float4 _OutsideNormal_ST;
            uniform sampler2D _MiddleNormal; uniform float4 _MiddleNormal_ST;
            uniform sampler2D _BlendNormal; uniform float4 _BlendNormal_ST;
            uniform float _node_1427;
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
                float2 node_1426 = (i.uv0.rg*_node_1427);
                float3 node_58 = UnpackNormal(tex2D(_MiddleNormal,TRANSFORM_TEX(node_1426, _MiddleNormal)));
                float4 node_64 = i.vertexColor;
                float3 node_80_nrm_base = lerp(UnpackNormal(tex2D(_OutsideNormal,TRANSFORM_TEX(node_1426, _OutsideNormal))).rgb,node_58.rgb,node_64.r) + float3(0,0,1);
                float3 node_80_nrm_detail = lerp(node_58.rgb,tex2D(_BlendNormal,TRANSFORM_TEX(node_1426, _BlendNormal)).rgb,node_64.g) * float3(-1,-1,1);
                float3 node_80_nrm_combined = node_80_nrm_base*dot(node_80_nrm_base, node_80_nrm_detail)/node_80_nrm_base.z - node_80_nrm_detail;
                float3 node_80 = node_80_nrm_combined;
                float3 normalLocal = node_80;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float4 node_3 = tex2D(_Middle,TRANSFORM_TEX(node_1426, _Middle));
                float4 node_7 = i.vertexColor;
                finalColor += diffuseLight * saturate(( lerp(tex2D(_Outside,TRANSFORM_TEX(node_1426, _Outside)).rgb,node_3.rgb,node_7.r) > 0.5 ? (1.0-(1.0-2.0*(lerp(tex2D(_Outside,TRANSFORM_TEX(node_1426, _Outside)).rgb,node_3.rgb,node_7.r)-0.5))*(1.0-lerp(node_3.rgb,tex2D(_Blend,TRANSFORM_TEX(node_1426, _Blend)).rgb,node_7.g))) : (2.0*lerp(tex2D(_Outside,TRANSFORM_TEX(node_1426, _Outside)).rgb,node_3.rgb,node_7.r)*lerp(node_3.rgb,tex2D(_Blend,TRANSFORM_TEX(node_1426, _Blend)).rgb,node_7.g)) ));
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
            uniform sampler2D _Outside; uniform float4 _Outside_ST;
            uniform sampler2D _Middle; uniform float4 _Middle_ST;
            uniform sampler2D _Blend; uniform float4 _Blend_ST;
            uniform sampler2D _OutsideNormal; uniform float4 _OutsideNormal_ST;
            uniform sampler2D _MiddleNormal; uniform float4 _MiddleNormal_ST;
            uniform sampler2D _BlendNormal; uniform float4 _BlendNormal_ST;
            uniform float _node_1427;
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
                float2 node_1426 = (i.uv0.rg*_node_1427);
                float3 node_58 = UnpackNormal(tex2D(_MiddleNormal,TRANSFORM_TEX(node_1426, _MiddleNormal)));
                float4 node_64 = i.vertexColor;
                float3 node_80_nrm_base = lerp(UnpackNormal(tex2D(_OutsideNormal,TRANSFORM_TEX(node_1426, _OutsideNormal))).rgb,node_58.rgb,node_64.r) + float3(0,0,1);
                float3 node_80_nrm_detail = lerp(node_58.rgb,tex2D(_BlendNormal,TRANSFORM_TEX(node_1426, _BlendNormal)).rgb,node_64.g) * float3(-1,-1,1);
                float3 node_80_nrm_combined = node_80_nrm_base*dot(node_80_nrm_base, node_80_nrm_detail)/node_80_nrm_base.z - node_80_nrm_detail;
                float3 node_80 = node_80_nrm_combined;
                float3 normalLocal = node_80;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float4 node_3 = tex2D(_Middle,TRANSFORM_TEX(node_1426, _Middle));
                float4 node_7 = i.vertexColor;
                finalColor += diffuseLight * saturate(( lerp(tex2D(_Outside,TRANSFORM_TEX(node_1426, _Outside)).rgb,node_3.rgb,node_7.r) > 0.5 ? (1.0-(1.0-2.0*(lerp(tex2D(_Outside,TRANSFORM_TEX(node_1426, _Outside)).rgb,node_3.rgb,node_7.r)-0.5))*(1.0-lerp(node_3.rgb,tex2D(_Blend,TRANSFORM_TEX(node_1426, _Blend)).rgb,node_7.g))) : (2.0*lerp(tex2D(_Outside,TRANSFORM_TEX(node_1426, _Outside)).rgb,node_3.rgb,node_7.r)*lerp(node_3.rgb,tex2D(_Blend,TRANSFORM_TEX(node_1426, _Blend)).rgb,node_7.g)) ));
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
