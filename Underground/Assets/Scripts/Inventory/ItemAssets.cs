using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemAssets : MonoBehaviour
{
   public static ItemAssets Instance { get; private set; }

    private void Awake()
    {
        Instance = this;
    }

    public Sprite batterySprite;
    public Sprite flashlightSprite;
    public Sprite oystercardSprite;
    public Sprite shieldSprite;
}
