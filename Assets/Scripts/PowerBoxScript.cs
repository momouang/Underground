using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PowerBoxScript : MonoBehaviour
{
    public AudioManager audioManager;
    public GameManager gameManager;

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("trigger");
        if(other.CompareTag("Player"))
        {
            Debug.Log("power box");
            gameManager.GameOver();
            audioManager.Play("PowerBoxDead Sound");
        }
    }
}
