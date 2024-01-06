using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public AudioManager audioManager;
    public GameObject startOverlay;
    public bool gameStart = false;

    public Animator transAnim;
    public bool isStarting = false;

    public GameObject Map;
    private bool toggleMap;

    public GameObject gameoverOverlay;

    private void Start()
    {
        audioManager.Play("BG Sound");
    }

    void Update()
    {
        if(!isStarting && Input.GetKeyDown(KeyCode.Return))
        {
            isStarting = true;
            transAnim.Play("Transitions");

            StartCoroutine(StartGame());
        }

        if(Input.GetKeyDown(KeyCode.M))
        {
            audioManager.Play("OpenMap Sound");
            toggleMap = !toggleMap;

            Map.SetActive(toggleMap);
            Cursor.lockState = CursorLockMode.None;
        }
    }

    public void CallTransition()
    {
        transAnim.Play("Transitions");
    }


    public void GameOver()
    {
        gameStart = false;
        gameoverOverlay.SetActive(true);
        Cursor.lockState = CursorLockMode.None;
    }

    IEnumerator StartGame()
    {
        StartCoroutine(CloseOverlay());
        yield return new WaitForSeconds(3);
    }

    IEnumerator CloseOverlay()
    {
        if (isStarting)
        {
            yield return new WaitForSeconds(1);
            startOverlay.SetActive(false);
            gameStart = true;
        }
    }
}
