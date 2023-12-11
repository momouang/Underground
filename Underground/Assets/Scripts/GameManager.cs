using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public GameObject Map;
    private bool toggleMap;

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.M))
        {
            toggleMap = !toggleMap;

            Map.SetActive(toggleMap);
        }
    }
}
