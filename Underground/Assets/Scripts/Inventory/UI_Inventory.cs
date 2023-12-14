using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class UI_Inventory : MonoBehaviour
{
    private Inventory inventory;
    private Transform itemSlotContainer;
    public Transform itemSlotTemplate;

    public Sprite sprite;

    public void Awake()
    {
        itemSlotContainer = transform.Find("itemSlotContainer");
        
    }

    public void SetInventory(Inventory inventory)
    {
        this.inventory = inventory;
        inventory.onItemListChanged += Inventory_OnItemListChanged;
        RefreshInventoryItems();
    }

    private void Inventory_OnItemListChanged(object sender, System.EventArgs e)
    {
        RefreshInventoryItems();
    }

    private void RefreshInventoryItems()
    { 
        foreach(Transform child in itemSlotContainer)
        {
            if (child == itemSlotTemplate) continue;
            {
                Destroy(child.gameObject);
            }
        }

        int x = 0;
        int y = 0;
        float itemSlotCellSize = 200f;

        foreach(Item item in inventory.GetItemList())
        {
            RectTransform itemSlotRectTransform = Instantiate(itemSlotTemplate, itemSlotContainer).GetComponent<RectTransform>();
            itemSlotRectTransform.gameObject.SetActive(true);
            itemSlotRectTransform.anchoredPosition = new Vector2(x * itemSlotCellSize, y * itemSlotCellSize);
            Image image = itemSlotRectTransform.Find("Image").GetComponent<Image>();
            image.sprite = item.GetSprite();
            TextMeshProUGUI uiText = itemSlotRectTransform.Find("text").GetComponent<TextMeshProUGUI>();
            Debug.Log(item.itemAmount);
            if(item.itemAmount > 1)
            {
                uiText.text = item.itemAmount.ToString();
            }
            else
            {
                uiText.text = " ";
            }

            x++;
            if(x > 1)
            {
                x = 0;
                y--;
            }
        }
    }
}
