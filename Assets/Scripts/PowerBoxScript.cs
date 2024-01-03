using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PowerBoxScript : MonoBehaviour
{
    public AudioManager audioManager;
    public GameManager gameManager;

    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Player"))
        {
            gameManager.GameOver();
            audioManager.Play("PowerBoxDead Sound");
        }
    }
}
