//Shady
using UnityEngine;

[ExecuteInEditMode]
public class Reveal : MonoBehaviour
{
    [SerializeField] Material Mat;
    [SerializeField] Material Mat2;
    [SerializeField] Material Mat3;
    [SerializeField] Light SpotLight;
	
	void Update ()
    {
        Mat.SetVector("_LightPosition", SpotLight.transform.position);
        Mat.SetVector("_LightDirection", -SpotLight.transform.forward);
        Mat.SetFloat("_LightAngle", SpotLight.spotAngle);

        Mat2.SetVector("_LightPosition", SpotLight.transform.position);
        Mat2.SetVector("_LightDirection", -SpotLight.transform.forward);
        Mat2.SetFloat("_LightAngle", SpotLight.spotAngle);

        Mat3.SetVector("_LightPosition", SpotLight.transform.position);
        Mat3.SetVector("_LightDirection", -SpotLight.transform.forward);
        Mat3.SetFloat("_LightAngle", SpotLight.spotAngle);

    }
}