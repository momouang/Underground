using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public AudioManager audioManager;
    public GameObject Map;
    private bool toggleMap;

    public GameObject gameoverOverlay;

    void Update()
    {
        if(Input.GetKeyDown(KeyCode.M))
        {
            audioManager.Play("OpenMap Sound");
            toggleMap = !toggleMap;

            Map.SetActive(toggleMap);
            Cursor.lockState = CursorLockMode.None;
        }
    }


    public void GameOver()
    {
        gameoverOverlay.SetActive(true);
        Cursor.lockState = CursorLockMode.None;
    }
}
