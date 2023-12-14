using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public CharacterController controller;
    public float speed = 12f;
    public Inventory inventory;

    [SerializeField]
    private UI_Inventory uiInventory;

    public void Awake()
    {
        inventory = new Inventory(UseItem);
        uiInventory.SetInventory(inventory);
    }


    // Update is called once per frame
    void Update()
    {
        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");

        Vector3 move = transform.right * x + transform.forward * z;

        controller.Move(move * speed * Time.deltaTime);

    }

    private void OnTriggerEnter(Collider other)
    {
        ItemWorld itemWorld = other.GetComponent<ItemWorld>();
        if(itemWorld != null)
        {
            inventory.Additem(itemWorld.GetItem());
            itemWorld.DestroySelf();

        }
    }

    private void UseItem(Item item)
    {
        switch (item.itemType)
        {
            case Item.ItemType.Battery:
                inventory.RemoveItem(new Item { itemType = Item.ItemType.Battery, itemAmount = 1});
                break;

            case Item.ItemType.Shield:
                inventory.RemoveItem(new Item { itemType = Item.ItemType.Shield, itemAmount = 1 });
                break;
        }
    }
}
