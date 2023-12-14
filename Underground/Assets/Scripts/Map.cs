using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class Map : MonoBehaviour
{
    public GameObject[] pinImage;
    GameObject selectedPin;
    public Canvas parentCanvas;
    public bool clicked = false;

    public Transform previewPin;
    public Transform mapBG;

    private void Update()
    {
        previewPin.position = Input.mousePosition;
    }

    public void SelectPin(int select)
    {
        selectedPin = pinImage[select];
    }

    public void spawnImage()
    {
        Instantiate(selectedPin,previewPin.position, Quaternion.identity,parentCanvas.transform);
        clicked = true;
    }

}
