using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameCompleteTrigger : MonoBehaviour
{
    public bool gameCompleted = false;
    public GameObject gameCompletedOverlay;
    public GameManager gameManager;

    private void OnTriggerStay(Collider other)
    {
        if(other.CompareTag("Player"))
        {
            gameCompleted = true;
            gameCompletedOverlay.SetActive(true);
        }
    }

    public void CloseOverlay()
    {
        gameCompletedOverlay.SetActive(false);
    }

}
