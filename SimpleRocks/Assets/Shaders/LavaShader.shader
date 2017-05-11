// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "LavaShader"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_Rocks3_A("Rocks3_A", 2D) = "white" {}
		_Rocks3_MS("Rocks3_MS", 2D) = "white" {}
		_Rocks3_N("Rocks3_N", 2D) = "bump" {}
		_Rocks_AO("Rocks_AO", 2D) = "white" {}
		_MaxEmission("Max Emission", Float) = 5
		_MinEmission("Min Emission", Float) = 0.2
		_SpeedEmission("Speed Emission", Float) = 0
		_Rocks3_E("Rocks3_E", 2D) = "white" {}
		_noise("noise", 2D) = "white" {}
		_NoiseSpeed("Noise Speed", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
			float2 texcoord_0;
		};

		uniform sampler2D _Rocks3_N;
		uniform float4 _Rocks3_N_ST;
		uniform sampler2D _Rocks3_A;
		uniform float4 _Rocks3_A_ST;
		uniform float _MaxEmission;
		uniform float _MinEmission;
		uniform float _SpeedEmission;
		uniform sampler2D _Rocks3_E;
		uniform float4 _Rocks3_E_ST;
		uniform sampler2D _noise;
		uniform float _NoiseSpeed;
		uniform sampler2D _Rocks3_MS;
		uniform float4 _Rocks3_MS_ST;
		uniform sampler2D _Rocks_AO;
		uniform float4 _Rocks_AO_ST;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 temp_cast_0 = 5.0;
			o.texcoord_0.xy = v.texcoord.xy * temp_cast_0 + float2( 0,0 );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Rocks3_N = i.uv_texcoord * _Rocks3_N_ST.xy + _Rocks3_N_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Rocks3_N,uv_Rocks3_N) );
			float2 uv_Rocks3_A = i.uv_texcoord * _Rocks3_A_ST.xy + _Rocks3_A_ST.zw;
			o.Albedo = ( float4(0.1323529,0.1323529,0.1323529,0) * tex2D( _Rocks3_A,uv_Rocks3_A) ).xyz;
			float2 uv_Rocks3_E = i.uv_texcoord * _Rocks3_E_ST.xy + _Rocks3_E_ST.zw;
			o.Emission = ( lerp( _MaxEmission , _MinEmission , sin( ( _SpeedEmission * _Time.y ) ) ) * ( tex2D( _Rocks3_E,uv_Rocks3_E) * tex2D( _noise,(abs( i.texcoord_0+( _Time.y * _NoiseSpeed ) * float2(1,1 )))) ) ).xyz;
			float2 uv_Rocks3_MS = i.uv_texcoord * _Rocks3_MS_ST.xy + _Rocks3_MS_ST.zw;
			float4 tex2DNode3 = tex2D( _Rocks3_MS,uv_Rocks3_MS);
			o.Metallic = tex2DNode3.r;
			o.Smoothness = ( 1.0 - tex2DNode3.g );
			float2 uv_Rocks_AO = i.uv_texcoord * _Rocks_AO_ST.xy + _Rocks_AO_ST.zw;
			o.Occlusion = tex2D( _Rocks_AO,uv_Rocks_AO).x;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=5105
803;92;691;655;2161.641;617.8501;1.9;False;False
Node;AmplifyShaderEditor.SamplerNode;5;-467.2002,-183.2;Float;True;Property;_Rocks3_N;Rocks3_N;2;0;Assets/Env Mountains/Rocks3_N.tga;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False
Node;AmplifyShaderEditor.SamplerNode;3;-734.8999,224.7999;Float;True;Property;_Rocks3_MS;Rocks3_MS;1;0;Assets/Env Mountains/Rocks3_MS.tga;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False
Node;AmplifyShaderEditor.OneMinusNode;7;-305.2003,269.1003;Float;False;0;FLOAT;0.0;False
Node;AmplifyShaderEditor.SamplerNode;4;-433.2,382.1001;Float;True;Property;_Rocks_AO;Rocks_AO;3;0;Assets/Env Mountains/Rocks_AO.tga;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-92.89971,-355.5002;Float;False;0;COLOR;0.0;False;1;FLOAT4;0.0,0,0,0;False
Node;AmplifyShaderEditor.ColorNode;10;-712.999,-595.8005;Float;False;Constant;_Color0;Color 0;5;0;0.1323529,0.1323529,0.1323529,0
Node;AmplifyShaderEditor.SamplerNode;1;-684.6,-386.3998;Float;True;Property;_Rocks3_A;Rocks3_A;0;0;Assets/Env Mountains/Rocks3_A.tga;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False
Node;AmplifyShaderEditor.LerpOp;17;-908.7988,-198.5;Float;False;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False
Node;AmplifyShaderEditor.RangedFloatNode;18;-1105.599,-443.3;Float;False;Property;_MaxEmission;Max Emission;4;0;5;0;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-1129.399,-326.0003;Float;False;Property;_MinEmission;Min Emission;5;0;0.2;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-1225.397,-183.5002;Float;False;0;FLOAT;0.0;False;1;FLOAT;0.0;False
Node;AmplifyShaderEditor.SinOpNode;23;-1072.197,-183.5004;Float;False;0;FLOAT;0.0;False
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-43.5,-56.09995;Float;False;True;2;Float;ASEMaterialInspector;Standard;LavaShader;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;13;OBJECT;0.0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False
Node;AmplifyShaderEditor.RangedFloatNode;22;-1431.197,-184.5004;Float;False;Property;_SpeedEmission;Speed Emission;6;0;0;0;0
Node;AmplifyShaderEditor.PannerNode;27;-1673.295,147.9991;Float;False;1;1;0;FLOAT2;0,0;False;1;FLOAT;0.0;False
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-1861.995,127.099;Float;False;0;FLOAT;0.0;False;1;FLOAT;0.0;False
Node;AmplifyShaderEditor.TimeNode;21;-2145.997,-139.9004;Float;False
Node;AmplifyShaderEditor.RangedFloatNode;29;-2116.049,135.9499;Float;False;Property;_NoiseSpeed;Noise Speed;9;0;1;0;0
Node;AmplifyShaderEditor.SamplerNode;26;-1449.195,209.7992;Float;True;Property;_noise;noise;8;0;Assets/Env Mountains/noise.png;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False
Node;AmplifyShaderEditor.SamplerNode;2;-1441.5,-36.50006;Float;True;Property;_Rocks3_E;Rocks3_E;7;0;Assets/Env Mountains/Rocks3_E.tga;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-731.4001,-46.59996;Float;False;0;FLOAT;0.0,0,0,0;False;1;FLOAT4;0.0;False
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-1037.949,68.04978;Float;False;0;FLOAT4;0.0;False;1;FLOAT4;0.0,0,0,0;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;32;-1737.247,-22.35002;Float;False;0;-1;2;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False
Node;AmplifyShaderEditor.RangedFloatNode;33;-1896.143,-22.45017;Float;False;Constant;_Float0;Float 0;10;0;5;0;0
WireConnection;7;0;3;2
WireConnection;11;0;10;0
WireConnection;11;1;1;0
WireConnection;17;0;18;0
WireConnection;17;1;19;0
WireConnection;17;2;23;0
WireConnection;20;0;22;0
WireConnection;20;1;21;2
WireConnection;23;0;20;0
WireConnection;0;0;11;0
WireConnection;0;1;5;0
WireConnection;0;2;13;0
WireConnection;0;3;3;1
WireConnection;0;4;7;0
WireConnection;0;5;4;0
WireConnection;27;0;32;0
WireConnection;27;1;28;0
WireConnection;28;0;21;2
WireConnection;28;1;29;0
WireConnection;26;1;27;0
WireConnection;13;0;17;0
WireConnection;13;1;31;0
WireConnection;31;0;2;0
WireConnection;31;1;26;0
WireConnection;32;0;33;0
ASEEND*/
//CHKSM=4C401131AEA69DE734245AD887822A5CF1EDCA04