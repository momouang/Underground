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

    public Item()
    {
        itemType = ItemType.Flashlight;
        itemAmount = 1;
    }

    public Item(Item item)
    {
        itemType = item.itemType;
        itemAmount = item.itemAmount;
    }

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
            case ItemType.Shield:
            case ItemType.OysterCard:
                return true;
            case ItemType.Flashlight:
                return false;

        }
    }
}
