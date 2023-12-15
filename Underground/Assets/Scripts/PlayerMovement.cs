using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public CharacterController controller;
    public float speed = 12f;
    public Inventory inventory;
    public Flashlight flashLight;
    public GameObject flashLightObeject;
    public Transform spawnPoint;

    [SerializeField]
    private UI_Inventory uiInventory;

    public void Awake()
    {
        inventory = new Inventory(UseItem);
        uiInventory.SetInventory(inventory);
    }


    void Update()
    {
        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");

        Vector3 move = transform.right * x + transform.forward * z;

        controller.Move(move * speed * Time.deltaTime);

        if(Input.GetKeyDown(KeyCode.Space))
        {
            inventory.UseItem(new Item { itemType = Item.ItemType.Battery, itemAmount = 1 });
        }

    }

    private void OnTriggerEnter(Collider other)
    {
        ItemWorld itemWorld = other.GetComponent<ItemWorld>();
        if(itemWorld != null && other.CompareTag("Destroyable"))
        {
            inventory.Additem(itemWorld.GetItem());
            itemWorld.DestroySelf();
        }

        if(other.CompareTag("Flashlight"))
        {
            inventory.Additem(itemWorld.GetItem());
            inventory.UseItem(new Item { itemType = Item.ItemType.Flashlight, itemAmount = 1 });
        }
    }

    private void UseItem(Item item)
    {
        switch (item.itemType)
        {
            case Item.ItemType.Flashlight:
                flashLightObeject.transform.position = spawnPoint.position;
                flashLight.PickedUp = true;
                break;

            case Item.ItemType.Battery:
                flashLight.Charging();
                inventory.RemoveItem(new Item { itemType = Item.ItemType.Battery, itemAmount = 1});
                break;

            case Item.ItemType.OysterCard:
                break;

            case Item.ItemType.Shield:
                inventory.RemoveItem(new Item { itemType = Item.ItemType.Shield, itemAmount = 1 });
                break;
        }
    }
}
