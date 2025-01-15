Shader "Custom/RevealByProgress"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0

		_HiddenColor ("Hidden Color", Color) = (0.15,0.15,0.15,1)
		_BoundaryColor ("Boundary Color", Color) = (1,1,0,1)
		_BoundaryThickness ("Boundary Thickness", Float) = 0.01
        _RevealProgress ("Reveal Progress", Range(0,1)) = 1.0
        [HideInInspector] _BoundsMinY ("Bounds Min Y", Float) = -0.5
        [HideInInspector] _BoundsMaxY ("Bounds Max Y", Float) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float3 worldPos;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

	    half _RevealProgress;
	    half4 _HiddenColor;
	    half4 _BoundaryColor;
	    half _BoundaryThickness;
	    half _BoundsMinY;
	    half _BoundsMaxY;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 color;
            half hidden = 0;

	        if (_RevealProgress == 0)
    	    {
		        color = _HiddenColor;
                hidden = 1;
    	    }
            else
	        {
		        float normalizedY = (IN.worldPos.y - _BoundsMinY) / (_BoundsMaxY - _BoundsMinY);
		
		        if (_RevealProgress < 1 && normalizedY > _RevealProgress)
		        {
			        if (normalizedY > _RevealProgress + _BoundaryThickness)
			        {
				        color = _HiddenColor;
                        hidden = 1;
			        }
			        else
			        {
				        color = _BoundaryColor;
                        hidden = 1;
			        }
		        }
                else
                {
                    color = tex2D(_MainTex, IN.uv_MainTex) * _Color;
                    hidden = 0;
                }
	        }

            o.Albedo = color.rgb;
            o.Metallic = hidden > 0 ? 0 : _Metallic;
            o.Smoothness = hidden > 0 ? 0 : _Glossiness;
            o.Alpha = color.a;
        }

        ENDCG
    }
    FallBack "Diffuse"
}