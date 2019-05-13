// Pix2Pix post-processing effect
// https://github.com/keijiro/Pix2Pix

Shader "Hidden/Pix2Pix/PostProcessing2"
{
    HLSLINCLUDE

    #include "Packages/com.unity.postprocessing/PostProcessing/Shaders/StdLib.hlsl"
    

    TEXTURE2D_SAMPLER2D(_MainTex, sampler_MainTex);

    half4 FragComposite(VaryingsDefault i) : SV_Target
    {
        half4 c = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.texcoord);
        return c;
    }

    ENDHLSL

    SubShader
    {
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            HLSLPROGRAM
            #pragma vertex VertDefault
            #pragma fragment FragComposite
            ENDHLSL
        }
    }
}
