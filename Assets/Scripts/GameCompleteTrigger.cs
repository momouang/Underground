using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameCompleteTrigger : MonoBehaviour
{
    public bool gameCompleted = false;
    public GameObject gameCompletedOverlay;


    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Player"))
        {
            gameCompleted = true;
            gameCompletedOverlay.SetActive(true);

            Cursor.lockState = CursorLockMode.None;
        }
    }

    public void CloseOverlay()
    {
        gameCompletedOverlay.SetActive(false);
    }

}
