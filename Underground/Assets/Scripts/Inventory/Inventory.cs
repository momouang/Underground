using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

[Serializable]
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
        Item temp = new Item(item);
        if (item.IsStackable())
        {
            bool itemAlreadyInInventory = false;           
            foreach (Item inventoryItem in itemlist)
            {
                if (inventoryItem.itemType == temp.itemType)
                {
                    inventoryItem.itemAmount += temp.itemAmount;
                    itemAlreadyInInventory = true;
                }
            }
            if (!itemAlreadyInInventory)
            {
                itemlist.Add(temp);
            }
        }
        else
        {
            itemlist.Add(temp);
        }
        onItemListChanged?.Invoke(this, EventArgs.Empty);
    }

    internal void UseItem()
    {
        throw new NotImplementedException();
    }

    internal void UseItem(object item)
    {
        throw new NotImplementedException();
    }

    public void RemoveItem(Item item)
    {
        //Debug.Log("Remove type:" + item.itemType + "," + item.itemAmount );
        if(item.IsStackable())
        {
            Item itemInInventory = null;
            foreach(Item inventoryItem in itemlist)
            {
                if(inventoryItem.itemType == item.itemType)
                {
                    //Debug.Log("inventory item amount found:" + inventoryItem.itemAmount);
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

    public void ClearItem()
    {
        itemlist = new List<Item>();
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
