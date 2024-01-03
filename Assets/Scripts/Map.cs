using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class Map : MonoBehaviour
{
    public AudioManager audioManager;
    public GameObject[] pinImage;
    public GameObject[] selectedFrame;

    GameObject selectedPin;
    public GameObject parentCanvas;
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

    public void SelectFrame(int selectFrame)
    {
        selectedFrame[selectFrame].SetActive(true);
    }

    public void SpawnImage()
    {
        audioManager.Play("Marking Sound");
        Instantiate(selectedPin,previewPin.position, Quaternion.identity,parentCanvas.transform);
        clicked = true;
    }

}
