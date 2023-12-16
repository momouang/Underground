using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Flashlight : MonoBehaviour
{
    [Header("Main")]
    public PlayerMovement player;
    public Light spotLight;
    public float lightAngle = 30f;
    public bool switchOn = false;
    public bool PickedUp = false;
    public Transform flashLightSpawnPoint;

    [Header("Battery")]
    public GameObject batterySliderUI;
    public Slider batterySlider;
    public float maxValue = 180f;
    public bool noBattery = false;

    private void Start()
    {
        batterySliderUI.SetActive(false);
        batterySlider.maxValue = maxValue;
        spotLight.spotAngle = 0;
    }

    private void Update()
    {
        if(PickedUp)
        {
            batterySliderUI.SetActive(true);
            gameObject.transform.position = player.spawnPoint.position;
            gameObject.transform.rotation= player.spawnPoint.rotation;
            gameObject.transform.SetParent(player.spawnPoint);
            UseFlashLight();
        }
        else
        {
            batterySliderUI.SetActive(false);
            gameObject.transform.position = flashLightSpawnPoint.position;
            gameObject.transform.rotation = flashLightSpawnPoint.rotation;
            TurnOffLight();
        }

        if(switchOn)
        {
            batterySlider.value -= Time.deltaTime;
        }

        if(batterySlider.value <= 0)
        {
            TurnOffLight();
            batterySlider.value = 0;
            noBattery = true;
        }
    }

    public void UseFlashLight()
    {
        if (Input.GetKeyDown(KeyCode.C))
        {
            switchOn = !switchOn;

            if (switchOn)
            {
                TurnOnLight();
            }
            else
            {
                TurnOffLight();
            }
        }
    }

    public void TurnOnLight()
    {
        if(!noBattery)
        {
            spotLight.spotAngle = lightAngle;
        }
    }

    public void TurnOffLight()
    {
        spotLight.spotAngle = 0;
    }

    public void Charging()
    {
        batterySlider.value = maxValue;
        noBattery = false;
    }
}
