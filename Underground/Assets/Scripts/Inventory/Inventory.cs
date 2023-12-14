using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Inventory 
{
    public event EventHandler onItemListChanged;

    private List<Item> itemlist;
    private Action<Item> useItemAction;

    public Inventory(Action<Item> useItemAction)
    {
        this.useItemAction = useItemAction;
        itemlist = new List<Item>();

        //Additem(new Item { itemType = Item.ItemType.Battery, itemAmount = 1 });
        //Additem(new Item { itemType = Item.ItemType.Flashlight, itemAmount = 1 });
        //Additem(new Item { itemType = Item.ItemType.OysterCard, itemAmount = 1 });
        //Additem(new Item { itemType = Item.ItemType.Shield, itemAmount = 1 });
    }

    public void Additem(Item item)
    {
        if (item.IsStackable())
        {
            bool itemAlreadyInInventory = false;
            foreach (Item inventoryItem in itemlist)
            {
                if (inventoryItem.itemType == item.itemType)
                {
                    inventoryItem.itemAmount += item.itemAmount;
                    itemAlreadyInInventory = true;
                }
            }
            if (!itemAlreadyInInventory)
            {
                itemlist.Add(item);
            }
        }
        else
        {
            itemlist.Add(item);
        }
        onItemListChanged?.Invoke(this, EventArgs.Empty);
    }

    internal void UseItem(object item)
    {
        throw new NotImplementedException();
    }

    public void RemoveItem(Item item)
    {
        if(item.IsStackable())
        {
            Item itemInInventory = null;
            foreach(Item inventoryItem in itemlist)
            {
                if(inventoryItem.itemType == item.itemType)
                {
                    inventoryItem.itemAmount -= item.itemAmount;
                    itemInInventory = inventoryItem;
                }
            }
            if(itemInInventory != null && itemInInventory.itemAmount <= 0)
            {
                itemlist.Remove(itemInInventory);
            }
        }
        else
        {
            itemlist.Remove(item);
        }
        onItemListChanged?.Invoke(this, EventArgs.Empty);
    }

    public void UseItem(Item item)
    {
        useItemAction(item);
    }

    public List<Item> GetItemList()
    {
        return itemlist;
    }
}
