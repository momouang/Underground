//Shady
Shader "Revealing Shader"
{
	Properties
	{
		MyColor("Color", Color) = (1,1,1,1)
		MyMainTex("Albedo (RGB)", 2D) = "white" {}
		MyGlossiness("Smoothness", Range(0,1)) = 0.5
		MyMetallic("Metallic", Range(0,1)) = 0.0
		MyLightDirection("Light Direction", Vector) = (0,0,1,0)
		MyLightPosition("Light Position", Vector) = (0,0,0,0)
		MyLightAngle("Light Angle", Range(0,180)) = 45
		MyStrengthScalor("Strength", Float) = 50
	}//Properties end
	SubShader
	{
		Tags{ "RenderType" = "Transparent" "Queue" = "Transparent" }
		Blend SrcAlpha OneMinusSrcAlpha
		LOD 200

		
	// ------------------------------------------------------------
	// Surface shader code generated out of a CGPROGRAM block:
	ZWrite Off ColorMask RGB
	

	// ---- forward rendering base pass:
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardBase" }
		Blend SrcAlpha OneMinusSrcAlpha

CGPROGRAM
// compile directives
#pragma vertex vert_SurfaceReveal
#pragma fragment frag_SurfaceReveal
#pragma target 3.0
#pragma multi_compile_instancing
#pragma multi_compile_fog
#pragma multi_compile_fwdbasealpha noshadow
#include "HLSLSupport.cginc"
#define UNITY_INSTANCED_LOD_FADE
#define UNITY_INSTANCED_SH
#define UNITY_INSTANCED_LIGHTMAPSTS
#include "UnityShaderVariables.cginc"
#include "UnityShaderUtilities.cginc"
// -------- variant for: <when no other keywords are defined>
#if !defined(INSTANCING_ON)
// Surface shader code generated based on:
// writes to per-pixel normal: no
// writes to emission: YES
// writes to occlusion: no
// needs world space reflection vector: no
// needs world space normal vector: no
// needs screen space position: no
// needs world space position: YES
// needs view direction: no
// needs world space view direction: no
// needs world space position for lighting: YES
// needs world space view direction for lighting: YES
// needs world space view direction for lightmaps: no
// needs vertex color: no
// needs VFACE: no
// needs SV_IsFrontFace: no
// passes tangent-to-world matrix to pixel shader: no
// reads from normal: no
// 1 texcoords actually used
//   float2 _MainTex
#define _ALPHABLEND_ON 1
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "UnityPBSLighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

// Original surface shader snippet:
#line 19 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
//#pragma surface SurfaceReveal Standard fullforwardshadows alpha:fade
//#pragma target 3.0
		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
			float3 worldPos;
		};//Struct end

		half   MyGlossiness;
		half   MyMetallic;
		fixed4 MyColor;
		float4 MyLightPosition;
		float4 MyLightDirection;
		float  MyLightAngle;
		float  MyStrengthScalor;

		void SurfaceReveal(Input input, inout SurfaceOutputStandard o)
		{ 
			float3 Dir      = normalize(MyLightPosition - input.worldPos);
			float  Scale    = dot(Dir, MyLightDirection);
			float  Strength = Scale - cos(MyLightAngle * (3.14 / 360.0));
			Strength        = min(max(Strength * MyStrengthScalor, 0), 1);
			fixed4 RC       = tex2D(_MainTex, input.uv_MainTex) * MyColor;
			o.Albedo        = RC.rgb;
			o.Emission      = RC.rgb * RC.a * Strength;
			o.Metallic      = MyMetallic;
			o.Smoothness    = MyGlossiness;
			o.Alpha         = Strength * RC.a;
		}//SurfaceReveal end
	

// vertex-to-fragment interpolation data
// no lightmaps:
#ifndef LIGHTMAP_ON
// half-precision fragment shader registers:
#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
#define FOG_COMBINED_WITH_WORLD_POS
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldNormal : TEXCOORD1;
  float4 worldPos : TEXCOORD2;
  #if UNITY_SHOULD_SAMPLE_SH
  half3 sh : TEXCOORD3; // SH
  #endif
  DECLARE_LIGHT_COORDS(4)
  #if SHADER_TARGET >= 30
  float4 lmap : TEXCOORD5;
  #endif
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
#endif
// high-precision fragment shader registers:
#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldNormal : TEXCOORD1;
  float3 worldPos : TEXCOORD2;
  #if UNITY_SHOULD_SAMPLE_SH
  half3 sh : TEXCOORD3; // SH
  #endif
  UNITY_FOG_COORDS(4)
  DECLARE_LIGHT_COORDS(5)
  #if SHADER_TARGET >= 30
  float4 lmap : TEXCOORD6;
  #endif
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
#endif
#endif
// with lightmaps:
#ifdef LIGHTMAP_ON
// half-precision fragment shader registers:
#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
#define FOG_COMBINED_WITH_WORLD_POS
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldNormal : TEXCOORD1;
  float4 worldPos : TEXCOORD2;
  float4 lmap : TEXCOORD3;
  DECLARE_LIGHT_COORDS(4)
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
#endif
// high-precision fragment shader registers:
#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldNormal : TEXCOORD1;
  float3 worldPos : TEXCOORD2;
  float4 lmap : TEXCOORD3;
  UNITY_FOG_COORDS(4)
  DECLARE_LIGHT_COORDS(5)
  #ifdef DIRLIGHTMAP_COMBINED
  float3 tSpace0 : TEXCOORD6;
  float3 tSpace1 : TEXCOORD7;
  float3 tSpace2 : TEXCOORD8;
  #endif
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
#endif
#endif
float4 _MainTex_ST;

// vertex shader
v2f_SurfaceReveal vert_SurfaceReveal (appdata_full v) {
  UNITY_SETUP_INSTANCE_ID(v);
  v2f_SurfaceReveal o;
  UNITY_INITIALIZE_OUTPUT(v2f_SurfaceReveal,o);
  UNITY_TRANSFER_INSTANCE_ID(v,o);
  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
  o.pos = UnityObjectToClipPos(v.vertex);
  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
  #if defined(LIGHTMAP_ON) && defined(DIRLIGHTMAP_COMBINED)
  fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
  fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
  fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
  #endif
  #if defined(LIGHTMAP_ON) && defined(DIRLIGHTMAP_COMBINED) && !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
  o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
  o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
  o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
  #endif
  o.worldPos.xyz = worldPos;
  o.worldNormal = worldNormal;
  #ifdef DYNAMICLIGHTMAP_ON
  o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
  #endif
  #ifdef LIGHTMAP_ON
  o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
  #endif

  // SH/ambient and vertex lights
  #ifndef LIGHTMAP_ON
    #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
      o.sh = 0;
      // Approximated illumination from non-important point lights
      #ifdef VERTEXLIGHT_ON
        o.sh += Shade4PointLights (
          unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
          unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
          unity_4LightAtten0, worldPos, worldNormal);
      #endif
      o.sh = ShadeSHPerVertex (worldNormal, o.sh);
    #endif
  #endif // !LIGHTMAP_ON

  COMPUTE_LIGHT_COORDS(o); // pass light cookie coordinates to pixel shader
  #ifdef FOG_COMBINED_WITH_TSPACE
    UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o,o.pos); // pass fog coordinates to pixel shader
  #elif defined FOG_COMBINED_WITH_WORLD_POS
    UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o,o.pos); // pass fog coordinates to pixel shader
  #else
    UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
  #endif
  return o;
}

// fragment shader
fixed4 frag_SurfaceReveal (v2f_SurfaceReveal IN) : SV_Target {
  UNITY_SETUP_INSTANCE_ID(IN);
  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
  // prepare and unpack data
  Input surfIN;
  #ifdef FOG_COMBINED_WITH_TSPACE
    UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
  #elif defined FOG_COMBINED_WITH_WORLD_POS
    UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
  #else
    UNITY_EXTRACT_FOG(IN);
  #endif
  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
  surfIN.uv_MainTex.x = 1.0;
  surfIN.worldPos.x = 1.0;
  surfIN.uv_MainTex = IN.pack0.xy;
  float3 worldPos = IN.worldPos.xyz;
  #ifndef USING_DIRECTIONAL_LIGHT
    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
  #else
    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
  #endif
  float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
  surfIN.worldPos = worldPos;
  #ifdef UNITY_COMPILER_HLSL
  SurfaceOutputStandard o = (SurfaceOutputStandard)0;
  #else
  SurfaceOutputStandard o;
  #endif
  o.Albedo = 0.0;
  o.Emission = 0.0;
  o.Alpha = 0.0;
  o.Occlusion = 1.0;
  fixed3 normalWorldVertex = fixed3(0,0,1);
  o.Normal = IN.worldNormal;
  normalWorldVertex = IN.worldNormal;

  // call surface function
  SurfaceReveal (surfIN, o);

  // compute lighting & shadowing factor
  UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
  fixed4 c = 0;

  // Setup lighting environment
  UnityGI gi;
  UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
  gi.indirect.diffuse = 0;
  gi.indirect.specular = 0;
  gi.light.color = _LightColor0.rgb;
  gi.light.dir = lightDir;
  // Call GI (lightmaps/SH/reflections) lighting function
  UnityGIInput giInput;
  UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
  giInput.light = gi.light;
  giInput.worldPos = worldPos;
  giInput.worldViewDir = worldViewDir;
  giInput.atten = atten;
  #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
    giInput.lightmapUV = IN.lmap;
  #else
    giInput.lightmapUV = 0.0;
  #endif
  #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
    giInput.ambient = IN.sh;
  #else
    giInput.ambient.rgb = 0.0;
  #endif
  giInput.probeHDR[0] = unity_SpecCube0_HDR;
  giInput.probeHDR[1] = unity_SpecCube1_HDR;
  #if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
    giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
  #endif
  #ifdef UNITY_SPECCUBE_BOX_PROJECTION
    giInput.boxMax[0] = unity_SpecCube0_BoxMax;
    giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
    giInput.boxMax[1] = unity_SpecCube1_BoxMax;
    giInput.boxMin[1] = unity_SpecCube1_BoxMin;
    giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
  #endif
  LightingStandard_GI(o, giInput, gi);

  // realtime lighting: call lighting function
  c += LightingStandard (o, worldViewDir, gi);
  c.rgb += o.Emission;
  UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
  return c;
}


#endif

// -------- variant for: INSTANCING_ON 
#if defined(INSTANCING_ON)
// Surface shader code generated based on:
// writes to per-pixel normal: no
// writes to emission: YES
// writes to occlusion: no
// needs world space reflection vector: no
// needs world space normal vector: no
// needs screen space position: no
// needs world space position: YES
// needs view direction: no
// needs world space view direction: no
// needs world space position for lighting: YES
// needs world space view direction for lighting: YES
// needs world space view direction for lightmaps: no
// needs vertex color: no
// needs VFACE: no
// needs SV_IsFrontFace: no
// passes tangent-to-world matrix to pixel shader: no
// reads from normal: no
// 1 texcoords actually used
//   float2 _MainTex
#define _ALPHABLEND_ON 1
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "UnityPBSLighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

// Original surface shader snippet:
#line 19 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
//#pragma surface SurfaceReveal Standard fullforwardshadows alpha:fade
//#pragma target 3.0
		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
			float3 worldPos;
		};//Struct end

		half   MyGlossiness;
		half   MyMetallic;
		fixed4 MyColor;
		float4 MyLightPosition;
		float4 MyLightDirection;
		float  MyLightAngle;
		float  MyStrengthScalor;

		void SurfaceReveal(Input input, inout SurfaceOutputStandard o)
		{ 
			float3 Dir      = normalize(MyLightPosition - input.worldPos);
			float  Scale    = dot(Dir, MyLightDirection);
			float  Strength = Scale - cos(MyLightAngle * (3.14 / 360.0));
			Strength        = min(max(Strength * MyStrengthScalor, 0), 1);
			fixed4 RC       = tex2D(_MainTex, input.uv_MainTex) * MyColor;
			o.Albedo        = RC.rgb;
			o.Emission      = RC.rgb * RC.a * Strength;
			o.Metallic      = MyMetallic;
			o.Smoothness    = MyGlossiness;
			o.Alpha         = Strength * RC.a;
		}//SurfaceReveal end
	

// vertex-to-fragment interpolation data
// no lightmaps:
#ifndef LIGHTMAP_ON
// half-precision fragment shader registers:
#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
#define FOG_COMBINED_WITH_WORLD_POS
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldNormal : TEXCOORD1;
  float4 worldPos : TEXCOORD2;
  #if UNITY_SHOULD_SAMPLE_SH
  half3 sh : TEXCOORD3; // SH
  #endif
  DECLARE_LIGHT_COORDS(4)
  #if SHADER_TARGET >= 30
  float4 lmap : TEXCOORD5;
  #endif
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
#endif
// high-precision fragment shader registers:
#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldNormal : TEXCOORD1;
  float3 worldPos : TEXCOORD2;
  #if UNITY_SHOULD_SAMPLE_SH
  half3 sh : TEXCOORD3; // SH
  #endif
  UNITY_FOG_COORDS(4)
  DECLARE_LIGHT_COORDS(5)
  #if SHADER_TARGET >= 30
  float4 lmap : TEXCOORD6;
  #endif
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
#endif
#endif
// with lightmaps:
#ifdef LIGHTMAP_ON
// half-precision fragment shader registers:
#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
#define FOG_COMBINED_WITH_WORLD_POS
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldNormal : TEXCOORD1;
  float4 worldPos : TEXCOORD2;
  float4 lmap : TEXCOORD3;
  DECLARE_LIGHT_COORDS(4)
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
#endif
// high-precision fragment shader registers:
#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldNormal : TEXCOORD1;
  float3 worldPos : TEXCOORD2;
  float4 lmap : TEXCOORD3;
  UNITY_FOG_COORDS(4)
  DECLARE_LIGHT_COORDS(5)
  #ifdef DIRLIGHTMAP_COMBINED
  float3 tSpace0 : TEXCOORD6;
  float3 tSpace1 : TEXCOORD7;
  float3 tSpace2 : TEXCOORD8;
  #endif
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
#endif
#endif
float4 _MainTex_ST;

// vertex shader
v2f_SurfaceReveal vert_SurfaceReveal (appdata_full v) {
  UNITY_SETUP_INSTANCE_ID(v);
  v2f_SurfaceReveal o;
  UNITY_INITIALIZE_OUTPUT(v2f_SurfaceReveal,o);
  UNITY_TRANSFER_INSTANCE_ID(v,o);
  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
  o.pos = UnityObjectToClipPos(v.vertex);
  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
  #if defined(LIGHTMAP_ON) && defined(DIRLIGHTMAP_COMBINED)
  fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
  fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
  fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
  #endif
  #if defined(LIGHTMAP_ON) && defined(DIRLIGHTMAP_COMBINED) && !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
  o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
  o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
  o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
  #endif
  o.worldPos.xyz = worldPos;
  o.worldNormal = worldNormal;
  #ifdef DYNAMICLIGHTMAP_ON
  o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
  #endif
  #ifdef LIGHTMAP_ON
  o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
  #endif

  // SH/ambient and vertex lights
  #ifndef LIGHTMAP_ON
    #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
      o.sh = 0;
      // Approximated illumination from non-important point lights
      #ifdef VERTEXLIGHT_ON
        o.sh += Shade4PointLights (
          unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
          unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
          unity_4LightAtten0, worldPos, worldNormal);
      #endif
      o.sh = ShadeSHPerVertex (worldNormal, o.sh);
    #endif
  #endif // !LIGHTMAP_ON

  COMPUTE_LIGHT_COORDS(o); // pass light cookie coordinates to pixel shader
  #ifdef FOG_COMBINED_WITH_TSPACE
    UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o,o.pos); // pass fog coordinates to pixel shader
  #elif defined FOG_COMBINED_WITH_WORLD_POS
    UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o,o.pos); // pass fog coordinates to pixel shader
  #else
    UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
  #endif
  return o;
}

// fragment shader
fixed4 frag_SurfaceReveal (v2f_SurfaceReveal IN) : SV_Target {
  UNITY_SETUP_INSTANCE_ID(IN);
  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
  // prepare and unpack data
  Input surfIN;
  #ifdef FOG_COMBINED_WITH_TSPACE
    UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
  #elif defined FOG_COMBINED_WITH_WORLD_POS
    UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
  #else
    UNITY_EXTRACT_FOG(IN);
  #endif
  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
  surfIN.uv_MainTex.x = 1.0;
  surfIN.worldPos.x = 1.0;
  surfIN.uv_MainTex = IN.pack0.xy;
  float3 worldPos = IN.worldPos.xyz;
  #ifndef USING_DIRECTIONAL_LIGHT
    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
  #else
    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
  #endif
  float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
  surfIN.worldPos = worldPos;
  #ifdef UNITY_COMPILER_HLSL
  SurfaceOutputStandard o = (SurfaceOutputStandard)0;
  #else
  SurfaceOutputStandard o;
  #endif
  o.Albedo = 0.0;
  o.Emission = 0.0;
  o.Alpha = 0.0;
  o.Occlusion = 1.0;
  fixed3 normalWorldVertex = fixed3(0,0,1);
  o.Normal = IN.worldNormal;
  normalWorldVertex = IN.worldNormal;

  // call surface function
  SurfaceReveal (surfIN, o);

  // compute lighting & shadowing factor
  UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
  fixed4 c = 0;

  // Setup lighting environment
  UnityGI gi;
  UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
  gi.indirect.diffuse = 0;
  gi.indirect.specular = 0;
  gi.light.color = _LightColor0.rgb;
  gi.light.dir = lightDir;
  // Call GI (lightmaps/SH/reflections) lighting function
  UnityGIInput giInput;
  UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
  giInput.light = gi.light;
  giInput.worldPos = worldPos;
  giInput.worldViewDir = worldViewDir;
  giInput.atten = atten;
  #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
    giInput.lightmapUV = IN.lmap;
  #else
    giInput.lightmapUV = 0.0;
  #endif
  #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
    giInput.ambient = IN.sh;
  #else
    giInput.ambient.rgb = 0.0;
  #endif
  giInput.probeHDR[0] = unity_SpecCube0_HDR;
  giInput.probeHDR[1] = unity_SpecCube1_HDR;
  #if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
    giInput.boxMin[0] = unity_SpecCube0_BoxMin; // .w holds lerp value for blending
  #endif
  #ifdef UNITY_SPECCUBE_BOX_PROJECTION
    giInput.boxMax[0] = unity_SpecCube0_BoxMax;
    giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
    giInput.boxMax[1] = unity_SpecCube1_BoxMax;
    giInput.boxMin[1] = unity_SpecCube1_BoxMin;
    giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
  #endif
  LightingStandard_GI(o, giInput, gi);

  // realtime lighting: call lighting function
  c += LightingStandard (o, worldViewDir, gi);
  c.rgb += o.Emission;
  UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
  return c;
}


#endif


ENDCG

}

	// ---- forward rendering additive lights pass:
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardAdd" }
		ZWrite Off Blend One One
		Blend SrcAlpha One

CGPROGRAM
// compile directives
#pragma vertex vert_SurfaceReveal
#pragma fragment frag_SurfaceReveal
#pragma target 3.0
#pragma multi_compile_instancing
#pragma multi_compile_fog
#pragma skip_variants INSTANCING_ON
#pragma multi_compile_fwdadd_fullshadows noshadow
#include "HLSLSupport.cginc"
#define UNITY_INSTANCED_LOD_FADE
#define UNITY_INSTANCED_SH
#define UNITY_INSTANCED_LIGHTMAPSTS
#include "UnityShaderVariables.cginc"
#include "UnityShaderUtilities.cginc"
// -------- variant for: <when no other keywords are defined>
#if !defined(INSTANCING_ON)
// Surface shader code generated based on:
// writes to per-pixel normal: no
// writes to emission: YES
// writes to occlusion: no
// needs world space reflection vector: no
// needs world space normal vector: no
// needs screen space position: no
// needs world space position: YES
// needs view direction: no
// needs world space view direction: no
// needs world space position for lighting: YES
// needs world space view direction for lighting: YES
// needs world space view direction for lightmaps: no
// needs vertex color: no
// needs VFACE: no
// needs SV_IsFrontFace: no
// passes tangent-to-world matrix to pixel shader: no
// reads from normal: no
// 1 texcoords actually used
//   float2 _MainTex
#define _ALPHABLEND_ON 1
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "UnityPBSLighting.cginc"
#include "AutoLight.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

// Original surface shader snippet:
#line 19 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
//#pragma surface SurfaceReveal Standard fullforwardshadows alpha:fade
//#pragma target 3.0
		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
			float3 worldPos;
		};//Struct end

		half   MyGlossiness;
		half   MyMetallic;
		fixed4 MyColor;
		float4 MyLightPosition;
		float4 MyLightDirection;
		float  MyLightAngle;
		float  MyStrengthScalor;

		void SurfaceReveal(Input input, inout SurfaceOutputStandard o)
		{ 
			float3 Dir      = normalize(MyLightPosition - input.worldPos);
			float  Scale    = dot(Dir, MyLightDirection);
			float  Strength = Scale - cos(MyLightAngle * (3.14 / 360.0));
			Strength        = min(max(Strength * MyStrengthScalor, 0), 1);
			fixed4 RC       = tex2D(_MainTex, input.uv_MainTex) * MyColor;
			o.Albedo        = RC.rgb;
			o.Emission      = RC.rgb * RC.a * Strength;
			o.Metallic      = MyMetallic;
			o.Smoothness    = MyGlossiness;
			o.Alpha         = Strength * RC.a;
		}//SurfaceReveal end
	

// vertex-to-fragment interpolation data
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldNormal : TEXCOORD1;
  float3 worldPos : TEXCOORD2;
  DECLARE_LIGHT_COORDS(3)
  UNITY_FOG_COORDS(4)
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
float4 _MainTex_ST;

// vertex shader
v2f_SurfaceReveal vert_SurfaceReveal (appdata_full v) {
  UNITY_SETUP_INSTANCE_ID(v);
  v2f_SurfaceReveal o;
  UNITY_INITIALIZE_OUTPUT(v2f_SurfaceReveal,o);
  UNITY_TRANSFER_INSTANCE_ID(v,o);
  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
  o.pos = UnityObjectToClipPos(v.vertex);
  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
  o.worldPos.xyz = worldPos;
  o.worldNormal = worldNormal;

  COMPUTE_LIGHT_COORDS(o); // pass light cookie coordinates to pixel shader
  UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
  return o;
}

// fragment shader
fixed4 frag_SurfaceReveal (v2f_SurfaceReveal IN) : SV_Target {
  UNITY_SETUP_INSTANCE_ID(IN);
  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
  // prepare and unpack data
  Input surfIN;
  #ifdef FOG_COMBINED_WITH_TSPACE
    UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
  #elif defined FOG_COMBINED_WITH_WORLD_POS
    UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
  #else
    UNITY_EXTRACT_FOG(IN);
  #endif
  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
  surfIN.uv_MainTex.x = 1.0;
  surfIN.worldPos.x = 1.0;
  surfIN.uv_MainTex = IN.pack0.xy;
  float3 worldPos = IN.worldPos.xyz;
  #ifndef USING_DIRECTIONAL_LIGHT
    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
  #else
    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
  #endif
  float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
  surfIN.worldPos = worldPos;
  #ifdef UNITY_COMPILER_HLSL
  SurfaceOutputStandard o = (SurfaceOutputStandard)0;
  #else
  SurfaceOutputStandard o;
  #endif
  o.Albedo = 0.0;
  o.Emission = 0.0;
  o.Alpha = 0.0;
  o.Occlusion = 1.0;
  fixed3 normalWorldVertex = fixed3(0,0,1);
  o.Normal = IN.worldNormal;
  normalWorldVertex = IN.worldNormal;

  // call surface function
  SurfaceReveal (surfIN, o);
  UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
  fixed4 c = 0;

  // Setup lighting environment
  UnityGI gi;
  UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
  gi.indirect.diffuse = 0;
  gi.indirect.specular = 0;
  gi.light.color = _LightColor0.rgb;
  gi.light.dir = lightDir;
  gi.light.color *= atten;
  c += LightingStandard (o, worldViewDir, gi);
  UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
  return c;
}


#endif


ENDCG

}

	// ---- meta information extraction pass:
	Pass {
		Name "Meta"
		Tags { "LightMode" = "Meta" }
		Cull Off

CGPROGRAM
// compile directives
#pragma vertex vert_SurfaceReveal
#pragma fragment frag_SurfaceReveal
#pragma target 3.0
#pragma multi_compile_instancing
#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
#pragma shader_feature EDITOR_VISUALIZATION

#include "HLSLSupport.cginc"
#define UNITY_INSTANCED_LOD_FADE
#define UNITY_INSTANCED_SH
#define UNITY_INSTANCED_LIGHTMAPSTS
#include "UnityShaderVariables.cginc"
#include "UnityShaderUtilities.cginc"
// -------- variant for: <when no other keywords are defined>
#if !defined(INSTANCING_ON)
// Surface shader code generated based on:
// writes to per-pixel normal: no
// writes to emission: YES
// writes to occlusion: no
// needs world space reflection vector: no
// needs world space normal vector: no
// needs screen space position: no
// needs world space position: YES
// needs view direction: no
// needs world space view direction: no
// needs world space position for lighting: YES
// needs world space view direction for lighting: YES
// needs world space view direction for lightmaps: no
// needs vertex color: no
// needs VFACE: no
// needs SV_IsFrontFace: no
// passes tangent-to-world matrix to pixel shader: no
// reads from normal: no
// 1 texcoords actually used
//   float2 _MainTex
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "UnityPBSLighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

// Original surface shader snippet:
#line 19 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
//#pragma surface SurfaceReveal Standard fullforwardshadows alpha:fade
//#pragma target 3.0
		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
			float3 worldPos;
		};//Struct end

		half   MyGlossiness;
		half   MyMetallic;
		fixed4 MyColor;
		float4 MyLightPosition;
		float4 MyLightDirection;
		float  MyLightAngle;
		float  MyStrengthScalor;

		void SurfaceReveal(Input input, inout SurfaceOutputStandard o)
		{ 
			float3 Dir      = normalize(MyLightPosition - input.worldPos);
			float  Scale    = dot(Dir, MyLightDirection);
			float  Strength = Scale - cos(MyLightAngle * (3.14 / 360.0));
			Strength        = min(max(Strength * MyStrengthScalor, 0), 1);
			fixed4 RC       = tex2D(_MainTex, input.uv_MainTex) * MyColor;
			o.Albedo        = RC.rgb;
			o.Emission      = RC.rgb * RC.a * Strength;
			o.Metallic      = MyMetallic;
			o.Smoothness    = MyGlossiness;
			o.Alpha         = Strength * RC.a;
		}//SurfaceReveal end
	
#include "UnityMetaPass.cginc"

// vertex-to-fragment interpolation data
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldPos : TEXCOORD1;
#ifdef EDITOR_VISUALIZATION
  float2 vizUV : TEXCOORD2;
  float4 lightCoord : TEXCOORD3;
#endif
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
float4 _MainTex_ST;

// vertex shader
v2f_SurfaceReveal vert_SurfaceReveal (appdata_full v) {
  UNITY_SETUP_INSTANCE_ID(v);
  v2f_SurfaceReveal o;
  UNITY_INITIALIZE_OUTPUT(v2f_SurfaceReveal,o);
  UNITY_TRANSFER_INSTANCE_ID(v,o);
  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
  o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
#ifdef EDITOR_VISUALIZATION
  o.vizUV = 0;
  o.lightCoord = 0;
  if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
    o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.texcoord.xy, v.texcoord1.xy, v.texcoord2.xy, unity_EditorViz_Texture_ST);
  else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
  {
    o.vizUV = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
  }
#endif
  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
  o.worldPos.xyz = worldPos;
  return o;
}

// fragment shader
fixed4 frag_SurfaceReveal (v2f_SurfaceReveal IN) : SV_Target {
  UNITY_SETUP_INSTANCE_ID(IN);
  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
  // prepare and unpack data
  Input surfIN;
  #ifdef FOG_COMBINED_WITH_TSPACE
    UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
  #elif defined FOG_COMBINED_WITH_WORLD_POS
    UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
  #else
    UNITY_EXTRACT_FOG(IN);
  #endif
  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
  surfIN.uv_MainTex.x = 1.0;
  surfIN.worldPos.x = 1.0;
  surfIN.uv_MainTex = IN.pack0.xy;
  float3 worldPos = IN.worldPos.xyz;
  #ifndef USING_DIRECTIONAL_LIGHT
    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
  #else
    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
  #endif
  surfIN.worldPos = worldPos;
  #ifdef UNITY_COMPILER_HLSL
  SurfaceOutputStandard o = (SurfaceOutputStandard)0;
  #else
  SurfaceOutputStandard o;
  #endif
  o.Albedo = 0.0;
  o.Emission = 0.0;
  o.Alpha = 0.0;
  o.Occlusion = 1.0;
  fixed3 normalWorldVertex = fixed3(0,0,1);

  // call surface function
  SurfaceReveal (surfIN, o);
  UnityMetaInput metaIN;
  UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
  metaIN.Albedo = o.Albedo;
  metaIN.Emission = o.Emission;
#ifdef EDITOR_VISUALIZATION
  metaIN.VizUV = IN.vizUV;
  metaIN.LightCoord = IN.lightCoord;
#endif
  return UnityMetaFragment(metaIN);
}


#endif

// -------- variant for: INSTANCING_ON 
#if defined(INSTANCING_ON)
// Surface shader code generated based on:
// writes to per-pixel normal: no
// writes to emission: YES
// writes to occlusion: no
// needs world space reflection vector: no
// needs world space normal vector: no
// needs screen space position: no
// needs world space position: YES
// needs view direction: no
// needs world space view direction: no
// needs world space position for lighting: YES
// needs world space view direction for lighting: YES
// needs world space view direction for lightmaps: no
// needs vertex color: no
// needs VFACE: no
// needs SV_IsFrontFace: no
// passes tangent-to-world matrix to pixel shader: no
// reads from normal: no
// 1 texcoords actually used
//   float2 _MainTex
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "UnityPBSLighting.cginc"

#define INTERNAL_DATA
#define WorldReflectionVector(data,normal) data.worldRefl
#define WorldNormalVector(data,normal) normal

// Original surface shader snippet:
#line 19 ""
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
//#pragma surface SurfaceReveal Standard fullforwardshadows alpha:fade
//#pragma target 3.0
		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
			float3 worldPos;
		};//Struct end

		half   MyGlossiness;
		half   MyMetallic;
		fixed4 MyColor;
		float4 MyLightPosition;
		float4 MyLightDirection;
		float  MyLightAngle;
		float  MyStrengthScalor;

		void SurfaceReveal(Input input, inout SurfaceOutputStandard o)
		{ 
			float3 Dir      = normalize(MyLightPosition - input.worldPos);
			float  Scale    = dot(Dir, MyLightDirection);
			float  Strength = Scale - cos(MyLightAngle * (3.14 / 360.0));
			Strength        = min(max(Strength * MyStrengthScalor, 0), 1);
			fixed4 RC       = tex2D(_MainTex, input.uv_MainTex) * MyColor;
			o.Albedo        = RC.rgb;
			o.Emission      = RC.rgb * RC.a * Strength;
			o.Metallic      = MyMetallic;
			o.Smoothness    = MyGlossiness;
			o.Alpha         = Strength * RC.a;
		}//SurfaceReveal end
	
#include "UnityMetaPass.cginc"

// vertex-to-fragment interpolation data
struct v2f_SurfaceReveal {
  UNITY_POSITION(pos);
  float2 pack0 : TEXCOORD0; // _MainTex
  float3 worldPos : TEXCOORD1;
#ifdef EDITOR_VISUALIZATION
  float2 vizUV : TEXCOORD2;
  float4 lightCoord : TEXCOORD3;
#endif
  UNITY_VERTEX_INPUT_INSTANCE_ID
  UNITY_VERTEX_OUTPUT_STEREO
};
float4 _MainTex_ST;

// vertex shader
v2f_SurfaceReveal vert_SurfaceReveal (appdata_full v) {
  UNITY_SETUP_INSTANCE_ID(v);
  v2f_SurfaceReveal o;
  UNITY_INITIALIZE_OUTPUT(v2f_SurfaceReveal,o);
  UNITY_TRANSFER_INSTANCE_ID(v,o);
  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
  o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
#ifdef EDITOR_VISUALIZATION
  o.vizUV = 0;
  o.lightCoord = 0;
  if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
    o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.texcoord.xy, v.texcoord1.xy, v.texcoord2.xy, unity_EditorViz_Texture_ST);
  else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
  {
    o.vizUV = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
  }
#endif
  o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
  o.worldPos.xyz = worldPos;
  return o;
}

// fragment shader
fixed4 frag_SurfaceReveal (v2f_SurfaceReveal IN) : SV_Target {
  UNITY_SETUP_INSTANCE_ID(IN);
  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
  // prepare and unpack data
  Input surfIN;
  #ifdef FOG_COMBINED_WITH_TSPACE
    UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
  #elif defined FOG_COMBINED_WITH_WORLD_POS
    UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
  #else
    UNITY_EXTRACT_FOG(IN);
  #endif
  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
  surfIN.uv_MainTex.x = 1.0;
  surfIN.worldPos.x = 1.0;
  surfIN.uv_MainTex = IN.pack0.xy;
  float3 worldPos = IN.worldPos.xyz;
  #ifndef USING_DIRECTIONAL_LIGHT
    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
  #else
    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
  #endif
  surfIN.worldPos = worldPos;
  #ifdef UNITY_COMPILER_HLSL
  SurfaceOutputStandard o = (SurfaceOutputStandard)0;
  #else
  SurfaceOutputStandard o;
  #endif
  o.Albedo = 0.0;
  o.Emission = 0.0;
  o.Alpha = 0.0;
  o.Occlusion = 1.0;
  fixed3 normalWorldVertex = fixed3(0,0,1);

  // call surface function
  SurfaceReveal (surfIN, o);
  UnityMetaInput metaIN;
  UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
  metaIN.Albedo = o.Albedo;
  metaIN.Emission = o.Emission;
#ifdef EDITOR_VISUALIZATION
  metaIN.VizUV = IN.vizUV;
  metaIN.LightCoord = IN.lightCoord;
#endif
  return UnityMetaFragment(metaIN);
}


#endif


ENDCG

}

	// ---- end of surface shader generated code

#LINE 53

	}//SubShader end
		FallBack "Diffuse"
}//Shader end