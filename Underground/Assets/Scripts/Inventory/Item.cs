using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Item 
{
    public enum ItemType
    {
        Flashlight,
        Battery,
        OysterCard,
        Shield,
    }

    public ItemType itemType;
    public int itemAmount;

    public Sprite GetSprite()
    {
        switch (itemType)
        {
            default:
            case ItemType.Battery: return ItemAssets.Instance.batterySprite;
            case ItemType.Flashlight: return ItemAssets.Instance.flashlightSprite;
            case ItemType.OysterCard: return ItemAssets.Instance.oystercardSprite;
            case ItemType.Shield: return ItemAssets.Instance.shieldSprite;
        }
    }

    public bool IsStackable()
    {
        switch(itemType)
        {
            default:
            case ItemType.Battery:
                return true;
            case ItemType.Flashlight:
            case ItemType.OysterCard:
            case ItemType.Shield:
                return false;

        }
    }
}
