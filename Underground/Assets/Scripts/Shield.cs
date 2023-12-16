using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shield : MonoBehaviour
{
    public int protection = 1;
    public PlayerMovement player;
    public bool ShieldEquiped = false;


    void Update()
    {
        if (ShieldEquiped)
        {
            if (player.attacked)
            {
                protection--;
            }

            if (player.attacked && protection <= 0)
            {
                ShieldEquiped = false;
            }
        }
    }

}
