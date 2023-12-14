using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Battery : MonoBehaviour
{
    public float batteryCount;

    private void OnTriggerStay(Collider other)
    {
        if(other.CompareTag("Player"))
        {
            batteryCount += 1;
            Destroy(gameObject);
        }
    }
}
