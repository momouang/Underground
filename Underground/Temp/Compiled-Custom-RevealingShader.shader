// Compiled shader for Windows, Mac, Linux

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/RevealingShader" {
Properties {
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _MainTex ("Albedo (RGB)", 2D) = "white" { }
 _Glossiness ("Smoothness", Range(0.000000,1.000000)) = 0.500000
 _Metallic ("Metallic", Range(0.000000,1.000000)) = 0.000000
 _LightDirection ("Light Direction", Vector) = (0.000000,0.000000,1.000000,0.000000)
 _LightPosition ("Light Position", Vector) = (0.000000,0.000000,0.000000,0.000000)
 _LightAngle ("Light Angle", Range(0.000000,180.000000)) = 45.000000
 _StrengthScalar ("Strength", Float) = 50.000000
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD6 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set CUBE Texture "unity_SpecCube0" to slot 1 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 2 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 1

Constant Buffer "FGlobals" (376 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_SpecCube0_BoxMax at 48
  Vector4 unity_SpecCube0_BoxMin at 64
  Vector4 unity_SpecCube0_ProbePosition at 80
  Vector4 unity_SpecCube0_HDR at 96
  Vector4 unity_SpecCube1_BoxMax at 112
  Vector4 unity_SpecCube1_BoxMin at 128
  Vector4 unity_SpecCube1_ProbePosition at 144
  Vector4 unity_SpecCube1_HDR at 160
  Vector4 unity_ProbeVolumeParams at 176
  Vector3 unity_ProbeVolumeSizeInv at 256
  Vector3 unity_ProbeVolumeMin at 272
  Vector4 _LightColor0 at 288
  Float _Glossiness at 304
  Float _Metallic at 308
  Vector4 _Color at 320
  Vector4 _LightPosition at 336
  Vector4 _LightDirection at 352
  Float _LightAngle at 368
  Float _StrengthScalar at 372
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float _Glossiness;
    float _Metallic;
    float4 _Color;
    float4 _LightPosition;
    float4 _LightDirection;
    float _LightAngle;
    float _StrengthScalar;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(1) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float3 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float3 u_xlat9;
    float3 u_xlat10;
    bool3 u_xlatb10;
    float3 u_xlat11;
    bool3 u_xlatb12;
    float3 u_xlat13;
    float u_xlat14;
    float u_xlat26;
    float u_xlat27;
    float u_xlat39;
    float u_xlat40;
    float u_xlat41;
    bool u_xlatb41;
    float u_xlat42;
    float u_xlat43;
    float u_xlat44;
    bool u_xlatb44;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = rsqrt(u_xlat39);
    u_xlat1.xyz = float3(u_xlat39) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + FGlobals._LightPosition.xyz;
    u_xlat40 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat2.xyz = float3(u_xlat40) * u_xlat2.xyz;
    u_xlat40 = dot(u_xlat2.xyz, FGlobals._LightDirection.xyz);
    u_xlat2.x = FGlobals._LightAngle * 0.00872222241;
    u_xlat2.x = cos(u_xlat2.x);
    u_xlat40 = u_xlat40 + (-u_xlat2.x);
    u_xlat40 = u_xlat40 * FGlobals._StrengthScalar;
    u_xlat40 = clamp(u_xlat40, 0.0f, 1.0f);
    u_xlat2 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat3 = u_xlat2 * FGlobals._Color;
    u_xlat4.xyz = u_xlat3.www * u_xlat3.xyz;
    output.SV_Target0.w = u_xlat40 * u_xlat3.w;
    u_xlatb41 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb41 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb41)) ? u_xlat5.xyz : input.TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat41 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat42 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat41, u_xlat42);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat41 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat42 = (-FGlobals._Glossiness) + 1.0;
    u_xlat43 = dot((-u_xlat1.xyz), input.TEXCOORD1.xyz);
    u_xlat43 = u_xlat43 + u_xlat43;
    u_xlat5.xyz = fma(input.TEXCOORD1.xyz, (-float3(u_xlat43)), (-u_xlat1.xyz));
    u_xlat6.xyz = float3(u_xlat41) * FGlobals._LightColor0.xyz;
    u_xlatb41 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = rsqrt(u_xlat41);
        u_xlat7.xyz = float3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-input.TEXCOORD2.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-input.TEXCOORD2.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = (float3(0.0, 0.0, 0.0)<u_xlat7.xyz);
        {
            float3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = input.TEXCOORD2.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = fma(u_xlat7.xyz, float3(u_xlat41), u_xlat8.xyz);
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    }
    u_xlat41 = fma((-u_xlat42), 0.699999988, 1.70000005);
    u_xlat41 = u_xlat41 * u_xlat42;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat7 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat7.xyz, level(u_xlat41));
    u_xlat43 = u_xlat7.w + -1.0;
    u_xlat43 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat43, 1.0);
    u_xlat43 = log2(u_xlat43);
    u_xlat43 = u_xlat43 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat43 = exp2(u_xlat43);
    u_xlat43 = u_xlat43 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat7.xyz * float3(u_xlat43);
    u_xlatb44 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb44){
        u_xlatb44 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb44){
            u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat44 = rsqrt(u_xlat44);
            u_xlat9.xyz = float3(u_xlat44) * u_xlat5.xyz;
            u_xlat10.xyz = (-input.TEXCOORD2.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-input.TEXCOORD2.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat10;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
                u_xlat10 = hlslcc_movcTemp;
            }
            u_xlat44 = min(u_xlat10.y, u_xlat10.x);
            u_xlat44 = min(u_xlat10.z, u_xlat44);
            u_xlat10.xyz = input.TEXCOORD2.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = fma(u_xlat9.xyz, float3(u_xlat44), u_xlat10.xyz);
        }
        u_xlat5 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat5.xyz, level(u_xlat41));
        u_xlat41 = u_xlat5.w + -1.0;
        u_xlat41 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat41, 1.0);
        u_xlat41 = log2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat41 = exp2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat5.xyz * float3(u_xlat41);
        u_xlat7.xyz = fma(float3(u_xlat43), u_xlat7.xyz, (-u_xlat5.xyz));
        u_xlat8.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat7.xyz, u_xlat5.xyz);
    }
    u_xlat41 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat41 = rsqrt(u_xlat41);
    u_xlat5.xyz = float3(u_xlat41) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, FGlobals._Color.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat2.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat41 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat3.xyz = float3(u_xlat41) * u_xlat3.xyz;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat39), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = rsqrt(u_xlat39);
    u_xlat0.xyz = float3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat14 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat14 = clamp(u_xlat14, 0.0f, 1.0f);
    u_xlat0.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = dot(u_xlat13.xx, float2(u_xlat42));
    u_xlat13.x = u_xlat13.x + -0.5;
    u_xlat26 = (-u_xlat1.x) + 1.0;
    u_xlat27 = u_xlat26 * u_xlat26;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat26 = fma(u_xlat13.x, u_xlat26, 1.0);
    u_xlat27 = -abs(u_xlat39) + 1.0;
    u_xlat43 = u_xlat27 * u_xlat27;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat27 = u_xlat27 * u_xlat43;
    u_xlat13.x = fma(u_xlat13.x, u_xlat27, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat26;
    u_xlat26 = u_xlat42 * u_xlat42;
    u_xlat26 = max(u_xlat26, 0.00200000009);
    u_xlat42 = (-u_xlat26) + 1.0;
    u_xlat43 = fma(abs(u_xlat39), u_xlat42, u_xlat26);
    u_xlat42 = fma(u_xlat1.x, u_xlat42, u_xlat26);
    u_xlat39 = abs(u_xlat39) * u_xlat42;
    u_xlat39 = fma(u_xlat1.x, u_xlat43, u_xlat39);
    u_xlat39 = u_xlat39 + 9.99999975e-06;
    u_xlat39 = 0.5 / u_xlat39;
    u_xlat42 = u_xlat26 * u_xlat26;
    u_xlat43 = fma(u_xlat14, u_xlat42, (-u_xlat14));
    u_xlat14 = fma(u_xlat43, u_xlat14, 1.0);
    u_xlat42 = u_xlat42 * 0.318309873;
    u_xlat14 = fma(u_xlat14, u_xlat14, 1.00000001e-07);
    u_xlat14 = u_xlat42 / u_xlat14;
    u_xlat13.z = u_xlat39 * u_xlat14;
    u_xlat13.xz = u_xlat1.xx * u_xlat13.xz;
    u_xlat39 = u_xlat13.z * 3.14159274;
    u_xlat39 = max(u_xlat39, 0.0);
    u_xlat26 = fma(u_xlat26, u_xlat26, 1.0);
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = u_xlat1.x!=0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat39 = u_xlat39 * u_xlat1.x;
    u_xlat1.x = (-u_xlat41) + FGlobals._Glossiness;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat5.xyz = u_xlat13.xxx * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * float3(u_xlat39);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat0.x = u_xlat0.x * u_xlat13.x;
    u_xlat7.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyw = fma(u_xlat7.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat6.xyz;
    u_xlat0.xyw = fma(u_xlat3.xyz, u_xlat5.xyz, u_xlat0.xyw);
    u_xlat3.xyz = u_xlat8.xyz * float3(u_xlat26);
    u_xlat5.xyz = (-u_xlat2.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = fma(float3(u_xlat27), u_xlat5.xyz, u_xlat2.xyz);
    u_xlat0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyw);
    output.SV_Target0.xyz = fma(u_xlat4.xyz, float3(u_xlat40), u_xlat0.xyz);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 64
  Matrix4x4 unity_WorldToObject at 128
  Matrix4x4 unity_MatrixVP at 192
  Vector4 unity_SHBr at 0
  Vector4 unity_SHBg at 16
  Vector4 unity_SHBb at 32
  Vector4 unity_SHC at 48
  Vector4 _MainTex_ST at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = fma(u_xlat0.x, u_xlat0.x, (-u_xlat6));
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(VGlobals.unity_SHBr, u_xlat1);
    u_xlat0.y = dot(VGlobals.unity_SHBg, u_xlat1);
    u_xlat0.z = dot(VGlobals.unity_SHBb, u_xlat1);
    output.TEXCOORD3.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat6), u_xlat0.xyz);
    output.TEXCOORD6 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set CUBE Texture "unity_SpecCube0" to slot 1 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 2 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 1

Constant Buffer "FGlobals" (424 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 240
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_OcclusionMaskSelector at 80
  Vector4 unity_SpecCube0_BoxMax at 96
  Vector4 unity_SpecCube0_BoxMin at 112
  Vector4 unity_SpecCube0_ProbePosition at 128
  Vector4 unity_SpecCube0_HDR at 144
  Vector4 unity_SpecCube1_BoxMax at 160
  Vector4 unity_SpecCube1_BoxMin at 176
  Vector4 unity_SpecCube1_ProbePosition at 192
  Vector4 unity_SpecCube1_HDR at 208
  Vector4 unity_ProbeVolumeParams at 224
  Vector3 unity_ProbeVolumeSizeInv at 304
  Vector3 unity_ProbeVolumeMin at 320
  Vector4 _LightColor0 at 336
  Float _Glossiness at 352
  Float _Metallic at 356
  Vector4 _Color at 368
  Vector4 _LightPosition at 384
  Vector4 _LightDirection at 400
  Float _LightAngle at 416
  Float _StrengthScalar at 420
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float _Glossiness;
    float _Metallic;
    float4 _Color;
    float4 _LightPosition;
    float4 _LightDirection;
    float _LightAngle;
    float _StrengthScalar;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(1) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float3 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float4 u_xlat10;
    float3 u_xlat11;
    bool3 u_xlatb11;
    float3 u_xlat12;
    bool3 u_xlatb13;
    float3 u_xlat14;
    float u_xlat15;
    float u_xlat28;
    float u_xlat29;
    float u_xlat42;
    float u_xlat43;
    float u_xlat44;
    bool u_xlatb44;
    float u_xlat45;
    bool u_xlatb45;
    float u_xlat46;
    float u_xlat47;
    bool u_xlatb47;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = rsqrt(u_xlat42);
    u_xlat1.xyz = float3(u_xlat42) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + FGlobals._LightPosition.xyz;
    u_xlat43 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat43 = rsqrt(u_xlat43);
    u_xlat2.xyz = float3(u_xlat43) * u_xlat2.xyz;
    u_xlat43 = dot(u_xlat2.xyz, FGlobals._LightDirection.xyz);
    u_xlat2.x = FGlobals._LightAngle * 0.00872222241;
    u_xlat2.x = cos(u_xlat2.x);
    u_xlat43 = u_xlat43 + (-u_xlat2.x);
    u_xlat43 = u_xlat43 * FGlobals._StrengthScalar;
    u_xlat43 = clamp(u_xlat43, 0.0f, 1.0f);
    u_xlat2 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat3 = u_xlat2 * FGlobals._Color;
    u_xlat4.xyz = u_xlat3.www * u_xlat3.xyz;
    output.SV_Target0.w = u_xlat43 * u_xlat3.w;
    u_xlatb44 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb44){
        u_xlatb45 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb45)) ? u_xlat5.xyz : input.TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat45 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat46 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat45, u_xlat46);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat45 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat45 = clamp(u_xlat45, 0.0f, 1.0f);
    u_xlat46 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = dot((-u_xlat1.xyz), input.TEXCOORD1.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = fma(input.TEXCOORD1.xyz, (-u_xlat5.xxx), (-u_xlat1.xyz));
    u_xlat6.xyz = float3(u_xlat45) * FGlobals._LightColor0.xyz;
    if(u_xlatb44){
        u_xlatb44 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat7.xyz);
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat7.xyz = (bool(u_xlatb44)) ? u_xlat7.xyz : input.TEXCOORD2.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat7.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat44 = u_xlat7.y * 0.25;
        u_xlat45 = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat47 = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat44 = max(u_xlat44, u_xlat45);
        u_xlat7.x = min(u_xlat47, u_xlat44);
        u_xlat8 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
        u_xlat9.xyz = u_xlat7.xzw + float3(0.25, 0.0, 0.0);
        u_xlat9 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat9.xyz);
        u_xlat7.xyz = u_xlat7.xzw + float3(0.5, 0.0, 0.0);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xyz);
        u_xlat10.xyz = input.TEXCOORD1.xyz;
        u_xlat10.w = 1.0;
        u_xlat8.x = dot(u_xlat8, u_xlat10);
        u_xlat8.y = dot(u_xlat9, u_xlat10);
        u_xlat8.z = dot(u_xlat7, u_xlat10);
    } else {
        u_xlat7.xyz = input.TEXCOORD1.xyz;
        u_xlat7.w = 1.0;
        u_xlat8.x = dot(FGlobals.unity_SHAr, u_xlat7);
        u_xlat8.y = dot(FGlobals.unity_SHAg, u_xlat7);
        u_xlat8.z = dot(FGlobals.unity_SHAb, u_xlat7);
    }
    u_xlat7.xyz = u_xlat8.xyz + input.TEXCOORD3.xyz;
    u_xlat7.xyz = max(u_xlat7.xyz, float3(0.0, 0.0, 0.0));
    u_xlatb44 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb44){
        u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat44 = rsqrt(u_xlat44);
        u_xlat8.xyz = float3(u_xlat44) * u_xlat5.xyz;
        u_xlat9.xyz = (-input.TEXCOORD2.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
        u_xlat10.xyz = (-input.TEXCOORD2.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlatb11.xyz = (float3(0.0, 0.0, 0.0)<u_xlat8.xyz);
        {
            float4 hlslcc_movcTemp = u_xlat9;
            hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat9.x : u_xlat10.x;
            hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat9.y : u_xlat10.y;
            hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat9.z : u_xlat10.z;
            u_xlat9 = hlslcc_movcTemp;
        }
        u_xlat44 = min(u_xlat9.y, u_xlat9.x);
        u_xlat44 = min(u_xlat9.z, u_xlat44);
        u_xlat9.xyz = input.TEXCOORD2.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = fma(u_xlat8.xyz, float3(u_xlat44), u_xlat9.xyz);
    } else {
        u_xlat8.xyz = u_xlat5.xyz;
    }
    u_xlat44 = fma((-u_xlat46), 0.699999988, 1.70000005);
    u_xlat44 = u_xlat44 * u_xlat46;
    u_xlat44 = u_xlat44 * 6.0;
    u_xlat8 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat8.xyz, level(u_xlat44));
    u_xlat45 = u_xlat8.w + -1.0;
    u_xlat45 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat45, 1.0);
    u_xlat45 = log2(u_xlat45);
    u_xlat45 = u_xlat45 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat45 = exp2(u_xlat45);
    u_xlat45 = u_xlat45 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat9.xyz = u_xlat8.xyz * float3(u_xlat45);
    u_xlatb47 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb47){
        u_xlatb47 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat47 = rsqrt(u_xlat47);
            u_xlat10.xyz = float3(u_xlat47) * u_xlat5.xyz;
            u_xlat11.xyz = (-input.TEXCOORD2.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat10.xyz;
            u_xlat12.xyz = (-input.TEXCOORD2.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlatb13.xyz = (float3(0.0, 0.0, 0.0)<u_xlat10.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat11;
                hlslcc_movcTemp.x = (u_xlatb13.x) ? u_xlat11.x : u_xlat12.x;
                hlslcc_movcTemp.y = (u_xlatb13.y) ? u_xlat11.y : u_xlat12.y;
                hlslcc_movcTemp.z = (u_xlatb13.z) ? u_xlat11.z : u_xlat12.z;
                u_xlat11 = hlslcc_movcTemp;
            }
            u_xlat47 = min(u_xlat11.y, u_xlat11.x);
            u_xlat47 = min(u_xlat11.z, u_xlat47);
            u_xlat11.xyz = input.TEXCOORD2.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = fma(u_xlat10.xyz, float3(u_xlat47), u_xlat11.xyz);
        }
        u_xlat5 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat5.xyz, level(u_xlat44));
        u_xlat44 = u_xlat5.w + -1.0;
        u_xlat44 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat44, 1.0);
        u_xlat44 = log2(u_xlat44);
        u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat44 = exp2(u_xlat44);
        u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat5.xyz * float3(u_xlat44);
        u_xlat8.xyz = fma(float3(u_xlat45), u_xlat8.xyz, (-u_xlat5.xyz));
        u_xlat9.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat8.xyz, u_xlat5.xyz);
    }
    u_xlat44 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat44 = rsqrt(u_xlat44);
    u_xlat5.xyz = float3(u_xlat44) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, FGlobals._Color.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat2.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat44 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat3.xyz = float3(u_xlat44) * u_xlat3.xyz;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat42), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = max(u_xlat42, 0.00100000005);
    u_xlat42 = rsqrt(u_xlat42);
    u_xlat0.xyz = float3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat15 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0f, 1.0f);
    u_xlat0.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat14.x = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = dot(u_xlat14.xx, float2(u_xlat46));
    u_xlat14.x = u_xlat14.x + -0.5;
    u_xlat28 = (-u_xlat1.x) + 1.0;
    u_xlat29 = u_xlat28 * u_xlat28;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat29;
    u_xlat28 = fma(u_xlat14.x, u_xlat28, 1.0);
    u_xlat29 = -abs(u_xlat42) + 1.0;
    u_xlat45 = u_xlat29 * u_xlat29;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat29 = u_xlat29 * u_xlat45;
    u_xlat14.x = fma(u_xlat14.x, u_xlat29, 1.0);
    u_xlat14.x = u_xlat14.x * u_xlat28;
    u_xlat28 = u_xlat46 * u_xlat46;
    u_xlat28 = max(u_xlat28, 0.00200000009);
    u_xlat45 = (-u_xlat28) + 1.0;
    u_xlat46 = fma(abs(u_xlat42), u_xlat45, u_xlat28);
    u_xlat45 = fma(u_xlat1.x, u_xlat45, u_xlat28);
    u_xlat42 = abs(u_xlat42) * u_xlat45;
    u_xlat42 = fma(u_xlat1.x, u_xlat46, u_xlat42);
    u_xlat42 = u_xlat42 + 9.99999975e-06;
    u_xlat42 = 0.5 / u_xlat42;
    u_xlat45 = u_xlat28 * u_xlat28;
    u_xlat46 = fma(u_xlat15, u_xlat45, (-u_xlat15));
    u_xlat15 = fma(u_xlat46, u_xlat15, 1.0);
    u_xlat45 = u_xlat45 * 0.318309873;
    u_xlat15 = fma(u_xlat15, u_xlat15, 1.00000001e-07);
    u_xlat15 = u_xlat45 / u_xlat15;
    u_xlat14.z = u_xlat42 * u_xlat15;
    u_xlat14.xz = u_xlat1.xx * u_xlat14.xz;
    u_xlat42 = u_xlat14.z * 3.14159274;
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat28 = fma(u_xlat28, u_xlat28, 1.0);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = u_xlat1.x!=0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat42 = u_xlat42 * u_xlat1.x;
    u_xlat1.x = (-u_xlat44) + FGlobals._Glossiness;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat5.xyz = fma(u_xlat6.xyz, u_xlat14.xxx, u_xlat7.xyz);
    u_xlat6.xyz = u_xlat6.xyz * float3(u_xlat42);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat14.x = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat7.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyw = fma(u_xlat7.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat6.xyz;
    u_xlat0.xyw = fma(u_xlat3.xyz, u_xlat5.xyz, u_xlat0.xyw);
    u_xlat3.xyz = u_xlat9.xyz * float3(u_xlat28);
    u_xlat5.xyz = (-u_xlat2.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = fma(float3(u_xlat29), u_xlat5.xyz, u_xlat2.xyz);
    u_xlat0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyw);
    output.SV_Target0.xyz = fma(u_xlat4.xyz, float3(u_xlat43), u_xlat0.xyz);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (464 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 256
  Matrix4x4 unity_WorldToObject at 320
  Matrix4x4 unity_MatrixVP at 384
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 unity_SHBr at 192
  Vector4 unity_SHBg at 208
  Vector4 unity_SHBb at 224
  Vector4 unity_SHC at 240
  Vector4 _MainTex_ST at 448
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    float4 unity_4LightAtten0;
    float4 unity_LightColor[8];
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float u_xlat15;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = rsqrt(u_xlat15);
    u_xlat1.xyz = float3(u_xlat15) * u_xlat1.xyz;
    output.TEXCOORD1.xyz = u_xlat1.xyz;
    output.TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = fma(u_xlat2, u_xlat2, u_xlat3);
    u_xlat2 = fma(u_xlat2, u_xlat1.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat1.zzzz, u_xlat2);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat3);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, VGlobals.unity_4LightAtten0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * VGlobals.unity_LightColor[1].xyz;
    u_xlat2.xyz = fma(VGlobals.unity_LightColor[0].xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(VGlobals.unity_LightColor[2].xyz, u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(VGlobals.unity_LightColor[3].xyz, u_xlat0.www, u_xlat0.xyz);
    u_xlat15 = u_xlat1.y * u_xlat1.y;
    u_xlat15 = fma(u_xlat1.x, u_xlat1.x, (-u_xlat15));
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(VGlobals.unity_SHBr, u_xlat1);
    u_xlat2.y = dot(VGlobals.unity_SHBg, u_xlat1);
    u_xlat2.z = dot(VGlobals.unity_SHBb, u_xlat1);
    u_xlat1.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat15), u_xlat2.xyz);
    output.TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
    output.TEXCOORD6 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDADD" "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha One
  ColorMask RGB
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: POINT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Matrix4x4 unity_WorldToLight at 192
  Vector4 _MainTex_ST at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat1.xyz;
    output.TEXCOORD2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD3.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (312 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 240
  Float _Metallic at 244
  Vector4 _Color at 256
  Vector4 _LightPosition at 272
  Vector4 _LightDirection at 288
  Float _LightAngle at 304
  Float _StrengthScalar at 308
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
    float4 _LightPosition;
    float4 _LightDirection;
    float _LightAngle;
    float _StrengthScalar;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_LightTexture0 [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float u_xlat8;
    float u_xlat9;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat2.xyz = float3(u_xlat22) * u_xlat2.xyz;
    u_xlat3.xyz = (-input.TEXCOORD2.xyz) + FGlobals._LightPosition.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat3.xyz = float3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, FGlobals._LightDirection.xyz);
    u_xlat23 = FGlobals._LightAngle * 0.00872222241;
    u_xlat23 = cos(u_xlat23);
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 * FGlobals._StrengthScalar;
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat3 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat4 = u_xlat3 * FGlobals._Color;
    output.SV_Target0.w = u_xlat22 * u_xlat4.w;
    u_xlat5.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD2.xxx, u_xlat5.xyz);
    u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD2.zzz, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
        u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
        u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : input.TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat6.yzw = u_xlat6.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat6.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat23 = _LightTexture0.sample(sampler_LightTexture0, float2(u_xlat23)).x;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat5.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat6.xyz = float3(u_xlat22) * input.TEXCOORD1.xyz;
    u_xlat3.xyz = fma(u_xlat3.xyz, FGlobals._Color.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat3.xyz = fma(float3(FGlobals._Metallic), u_xlat3.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat22 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = (-FGlobals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat21), u_xlat2.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat7.x = dot(u_xlat7.xx, float2(u_xlat22));
    u_xlat7.x = u_xlat7.x + -0.5;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat1.x;
    u_xlat14 = fma(u_xlat7.x, u_xlat14, 1.0);
    u_xlat1.x = -abs(u_xlat21) + 1.0;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat7.x = fma(u_xlat7.x, u_xlat1.x, 1.0);
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat1.x = (-u_xlat14) + 1.0;
    u_xlat8 = fma(abs(u_xlat21), u_xlat1.x, u_xlat14);
    u_xlat1.x = fma(u_xlat2.x, u_xlat1.x, u_xlat14);
    u_xlat21 = abs(u_xlat21) * u_xlat1.x;
    u_xlat21 = fma(u_xlat2.x, u_xlat8, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = fma(u_xlat9, u_xlat14, (-u_xlat9));
    u_xlat1.x = fma(u_xlat1.x, u_xlat9, 1.0);
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat14 = u_xlat14 / u_xlat1.x;
    u_xlat7.y = u_xlat14 * u_xlat21;
    u_xlat7.xy = u_xlat2.xx * u_xlat7.xy;
    u_xlat14 = u_xlat7.y * 3.14159274;
    u_xlat14 = max(u_xlat14, 0.0);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb21 = u_xlat21!=0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat14 = u_xlat21 * u_xlat14;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * float3(u_xlat14);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat22 = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat0.x = u_xlat0.x * u_xlat22;
    u_xlat2.xyz = (-u_xlat3.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat3.xyz);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat4.xyz, u_xlat1.xyz, u_xlat0.xyz);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 1 sampler slot 0

Constant Buffer "FGlobals" (248 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 176
  Float _Metallic at 180
  Vector4 _Color at 192
  Vector4 _LightPosition at 208
  Vector4 _LightDirection at 224
  Float _LightAngle at 240
  Float _StrengthScalar at 244
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float _Glossiness;
    float _Metallic;
    float4 _Color;
    float4 _LightPosition;
    float4 _LightDirection;
    float _LightAngle;
    float _StrengthScalar;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float u_xlat7;
    float u_xlat12;
    float u_xlat13;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat19;
    bool u_xlatb19;
    float u_xlat20;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + FGlobals._LightPosition.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, FGlobals._LightDirection.xyz);
    u_xlat2.x = FGlobals._LightAngle * 0.00872222241;
    u_xlat2.x = cos(u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 * FGlobals._StrengthScalar;
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat2 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat3 = u_xlat2 * FGlobals._Color;
    output.SV_Target0.w = u_xlat19 * u_xlat3.w;
    u_xlatb19 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : input.TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat20 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat4.xyz = float3(u_xlat19) * FGlobals._LightColor0.xyz;
    u_xlat19 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat5.xyz = float3(u_xlat19) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, FGlobals._Color.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat2.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat19 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-FGlobals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat0.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0f, 1.0f);
    u_xlat0.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, float2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = fma(u_xlat6.x, u_xlat12, 1.0);
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = fma(u_xlat6.x, u_xlat13, 1.0);
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = fma(abs(u_xlat18), u_xlat13, u_xlat12);
    u_xlat13 = fma(u_xlat1.x, u_xlat13, u_xlat12);
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = fma(u_xlat1.x, u_xlat19, u_xlat18);
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = fma(u_xlat7, u_xlat12, (-u_xlat7));
    u_xlat7 = fma(u_xlat13, u_xlat7, 1.0);
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = fma(u_xlat7, u_xlat7, 1.00000001e-07);
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat6.y = u_xlat12 * u_xlat18;
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat12 = u_xlat6.y * 3.14159274;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat12;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * float3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat4.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyz);
    return output;
}


//////////////////////////////////////////////////////
Keywords: SPOT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Matrix4x4 unity_WorldToLight at 192
  Vector4 _MainTex_ST at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat1.xyz;
    output.TEXCOORD2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2], u_xlat0.zzzz, u_xlat1);
    output.TEXCOORD3 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3], u_xlat0.wwww, u_xlat1);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_LightTexture0" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (312 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 240
  Float _Metallic at 244
  Vector4 _Color at 256
  Vector4 _LightPosition at 272
  Vector4 _LightDirection at 288
  Float _LightAngle at 304
  Float _StrengthScalar at 308
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
    float4 _LightPosition;
    float4 _LightDirection;
    float _LightAngle;
    float _StrengthScalar;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_LightTexture0 [[ sampler (1) ]],
    sampler sampler_LightTextureB0 [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float u_xlat8;
    float u_xlat9;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    bool u_xlatb23;
    float u_xlat24;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat2.xyz = float3(u_xlat22) * u_xlat2.xyz;
    u_xlat3.xyz = (-input.TEXCOORD2.xyz) + FGlobals._LightPosition.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat3.xyz = float3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, FGlobals._LightDirection.xyz);
    u_xlat23 = FGlobals._LightAngle * 0.00872222241;
    u_xlat23 = cos(u_xlat23);
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 * FGlobals._StrengthScalar;
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat3 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat4 = u_xlat3 * FGlobals._Color;
    output.SV_Target0.w = u_xlat22 * u_xlat4.w;
    u_xlat5 = input.TEXCOORD2.yyyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat5 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0], input.TEXCOORD2.xxxx, u_xlat5);
    u_xlat5 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2], input.TEXCOORD2.zzzz, u_xlat5);
    u_xlat5 = u_xlat5 + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
        u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
        u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : input.TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat6.yzw = u_xlat6.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat6.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlatb23 = 0.0<u_xlat5.z;
    u_xlat23 = u_xlatb23 ? 1.0 : float(0.0);
    u_xlat6.xy = u_xlat5.xy / u_xlat5.ww;
    u_xlat6.xy = u_xlat6.xy + float2(0.5, 0.5);
    u_xlat24 = _LightTexture0.sample(sampler_LightTexture0, u_xlat6.xy).w;
    u_xlat23 = u_xlat23 * u_xlat24;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat24)).x;
    u_xlat23 = u_xlat23 * u_xlat24;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat5.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat6.xyz = float3(u_xlat22) * input.TEXCOORD1.xyz;
    u_xlat3.xyz = fma(u_xlat3.xyz, FGlobals._Color.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat3.xyz = fma(float3(FGlobals._Metallic), u_xlat3.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat22 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = (-FGlobals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat21), u_xlat2.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat7.x = dot(u_xlat7.xx, float2(u_xlat22));
    u_xlat7.x = u_xlat7.x + -0.5;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat1.x;
    u_xlat14 = fma(u_xlat7.x, u_xlat14, 1.0);
    u_xlat1.x = -abs(u_xlat21) + 1.0;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat7.x = fma(u_xlat7.x, u_xlat1.x, 1.0);
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat1.x = (-u_xlat14) + 1.0;
    u_xlat8 = fma(abs(u_xlat21), u_xlat1.x, u_xlat14);
    u_xlat1.x = fma(u_xlat2.x, u_xlat1.x, u_xlat14);
    u_xlat21 = abs(u_xlat21) * u_xlat1.x;
    u_xlat21 = fma(u_xlat2.x, u_xlat8, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = fma(u_xlat9, u_xlat14, (-u_xlat9));
    u_xlat1.x = fma(u_xlat1.x, u_xlat9, 1.0);
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat14 = u_xlat14 / u_xlat1.x;
    u_xlat7.y = u_xlat14 * u_xlat21;
    u_xlat7.xy = u_xlat2.xx * u_xlat7.xy;
    u_xlat14 = u_xlat7.y * 3.14159274;
    u_xlat14 = max(u_xlat14, 0.0);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb21 = u_xlat21!=0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat14 = u_xlat21 * u_xlat14;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * float3(u_xlat14);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat22 = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat0.x = u_xlat0.x * u_xlat22;
    u_xlat2.xyz = (-u_xlat3.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat3.xyz);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat4.xyz, u_xlat1.xyz, u_xlat0.xyz);
    return output;
}


//////////////////////////////////////////////////////
Keywords: POINT_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Matrix4x4 unity_WorldToLight at 192
  Vector4 _MainTex_ST at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat1.xyz;
    output.TEXCOORD2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD3.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 2
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (312 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 240
  Float _Metallic at 244
  Vector4 _Color at 256
  Vector4 _LightPosition at 272
  Vector4 _LightDirection at 288
  Float _LightAngle at 304
  Float _StrengthScalar at 308
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
    float4 _LightPosition;
    float4 _LightDirection;
    float _LightAngle;
    float _StrengthScalar;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_LightTexture0 [[ sampler (1) ]],
    sampler sampler_LightTextureB0 [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(1) ]] ,
    texturecube<float, access::sample > _LightTexture0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float u_xlat8;
    float u_xlat9;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    float u_xlat24;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat2.xyz = float3(u_xlat22) * u_xlat2.xyz;
    u_xlat3.xyz = (-input.TEXCOORD2.xyz) + FGlobals._LightPosition.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat3.xyz = float3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, FGlobals._LightDirection.xyz);
    u_xlat23 = FGlobals._LightAngle * 0.00872222241;
    u_xlat23 = cos(u_xlat23);
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 * FGlobals._StrengthScalar;
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat3 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat4 = u_xlat3 * FGlobals._Color;
    output.SV_Target0.w = u_xlat22 * u_xlat4.w;
    u_xlat5.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD2.xxx, u_xlat5.xyz);
    u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD2.zzz, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
        u_xlat6.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
        u_xlat6.xyz = u_xlat6.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : input.TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat6.yzw = u_xlat6.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat6.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat23 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat23)).x;
    u_xlat24 = _LightTexture0.sample(sampler_LightTexture0, u_xlat5.xyz).w;
    u_xlat23 = u_xlat23 * u_xlat24;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat5.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat6.xyz = float3(u_xlat22) * input.TEXCOORD1.xyz;
    u_xlat3.xyz = fma(u_xlat3.xyz, FGlobals._Color.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat3.xyz = fma(float3(FGlobals._Metallic), u_xlat3.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat22 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = (-FGlobals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat21), u_xlat2.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat7.x = dot(u_xlat7.xx, float2(u_xlat22));
    u_xlat7.x = u_xlat7.x + -0.5;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat1.x;
    u_xlat14 = fma(u_xlat7.x, u_xlat14, 1.0);
    u_xlat1.x = -abs(u_xlat21) + 1.0;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat7.x = fma(u_xlat7.x, u_xlat1.x, 1.0);
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat1.x = (-u_xlat14) + 1.0;
    u_xlat8 = fma(abs(u_xlat21), u_xlat1.x, u_xlat14);
    u_xlat1.x = fma(u_xlat2.x, u_xlat1.x, u_xlat14);
    u_xlat21 = abs(u_xlat21) * u_xlat1.x;
    u_xlat21 = fma(u_xlat2.x, u_xlat8, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = fma(u_xlat9, u_xlat14, (-u_xlat9));
    u_xlat1.x = fma(u_xlat1.x, u_xlat9, 1.0);
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat14 = u_xlat14 / u_xlat1.x;
    u_xlat7.y = u_xlat14 * u_xlat21;
    u_xlat7.xy = u_xlat2.xx * u_xlat7.xy;
    u_xlat14 = u_xlat7.y * 3.14159274;
    u_xlat14 = max(u_xlat14, 0.0);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb21 = u_xlat21!=0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat14 = u_xlat21 * u_xlat14;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * float3(u_xlat14);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat22 = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat0.x = u_xlat0.x * u_xlat22;
    u_xlat2.xyz = (-u_xlat3.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat3.xyz);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat4.xyz, u_xlat1.xyz, u_xlat0.xyz);
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Matrix4x4 unity_WorldToLight at 192
  Vector4 _MainTex_ST at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat9;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    output.TEXCOORD2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0.xy = u_xlat1.yy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, u_xlat1.xx, u_xlat0.xy);
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, u_xlat1.zz, u_xlat0.xy);
    output.TEXCOORD3.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy, u_xlat1.ww, u_xlat0.xy);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    output.TEXCOORD1.xyz = float3(u_xlat9) * u_xlat0.xyz;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (312 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 240
  Float _Metallic at 244
  Vector4 _Color at 256
  Vector4 _LightPosition at 272
  Vector4 _LightDirection at 288
  Float _LightAngle at 304
  Float _StrengthScalar at 308
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
    float4 _LightPosition;
    float4 _LightDirection;
    float _LightAngle;
    float _StrengthScalar;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_LightTexture0 [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat7;
    float u_xlat12;
    float u_xlat13;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat19;
    bool u_xlatb19;
    float u_xlat20;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + FGlobals._LightPosition.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, FGlobals._LightDirection.xyz);
    u_xlat2.x = FGlobals._LightAngle * 0.00872222241;
    u_xlat2.x = cos(u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 * FGlobals._StrengthScalar;
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat2 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat3 = u_xlat2 * FGlobals._Color;
    output.SV_Target0.w = u_xlat19 * u_xlat3.w;
    u_xlat4.xy = input.TEXCOORD2.yy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, input.TEXCOORD2.xx, u_xlat4.xy);
    u_xlat4.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, input.TEXCOORD2.zz, u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb19 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD2.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : input.TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat20 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat20 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xy).w;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat4.xyz = float3(u_xlat19) * FGlobals._LightColor0.xyz;
    u_xlat19 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat5.xyz = float3(u_xlat19) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, FGlobals._Color.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat2.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat19 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-FGlobals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat0.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0f, 1.0f);
    u_xlat0.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, float2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = fma(u_xlat6.x, u_xlat12, 1.0);
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = fma(u_xlat6.x, u_xlat13, 1.0);
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = fma(abs(u_xlat18), u_xlat13, u_xlat12);
    u_xlat13 = fma(u_xlat1.x, u_xlat13, u_xlat12);
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = fma(u_xlat1.x, u_xlat19, u_xlat18);
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = fma(u_xlat7, u_xlat12, (-u_xlat7));
    u_xlat7 = fma(u_xlat13, u_xlat7, 1.0);
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = fma(u_xlat7, u_xlat7, 1.00000001e-07);
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat6.y = u_xlat12 * u_xlat18;
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat12 = u_xlat6.y * 3.14159274;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat12;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * float3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat4.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyz);
    return output;
}


 }
}
Fallback "Diffuse"
}