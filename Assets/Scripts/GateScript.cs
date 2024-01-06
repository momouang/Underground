using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GateScript : MonoBehaviour
{
    public AudioManager audioManager;
    Animator anim;
    public PlayerMovement player;

    private void Start()
    {
        anim = gameObject.GetComponent<Animator>();
    }

    private void Update()
    {
        if(player.gateOpened)
        { 
            anim.SetBool("isOpened", true);
            audioManager.Play("GateOpen Sound");
        }
        else
        {
            anim.SetBool("isOpened", false);
            audioManager.Play("GateClose Sound");
        }
    }

}
