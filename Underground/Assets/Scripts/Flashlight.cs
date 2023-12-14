using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Flashlight : MonoBehaviour
{
    public Light spotLight;
    public float lightAngle = 30f;
    public bool switchOn = false;

    [Header("Battery")]
    public Slider batterySlider;
    public float powerTime = 180f;

    private void Start()
    {
        batterySlider.maxValue = powerTime;
    }
    private void Update()
    {
        if(Input.GetKeyDown(KeyCode.C))
        {
            switchOn = !switchOn;

            if(switchOn)
            {
                TurnOnLight();
            }
            else
            {
                TurnOffLight();
            }          
        }

        if(switchOn)
        {
            powerTime -= Time.deltaTime;
            batterySlider.value -= Time.deltaTime;
        }

        if(powerTime <= 0)
        {
            TurnOffLight();
            //Debug.Log("no battery");
            batterySlider.value = 0;
        }
    }

    public void TurnOnLight()
    {
        spotLight.spotAngle = lightAngle;

    }

    public void TurnOffLight()
    {
        spotLight.spotAngle = 0;
    }
}
