using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public static event System.Action RestoreAllItem;

    [Header("Main")]
    public CharacterController controller;
    public float speed = 12f;   
    public Transform spawnPoint;
    public Transform respawnPoint;

    [Header("Inventory")]
    public Inventory inventory;
    public Flashlight flashLight;
    public bool isShielded = false;
    public GameObject flashLightObeject;

    [Header("Enemy Attack")]
    public bool attacked = false;

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
            UseItem(new Item { itemType = Item.ItemType.OysterCard, itemAmount = 3 });
        }

        if (Input.GetKeyDown(KeyCode.Z))
        {
            PlayerDead();
        }

    }

    public void BeAttacked()
    {
        if(isShielded)
        {
            UseItem(new Item { itemType = Item.ItemType.Shield, itemAmount = 1 });
            //play animation
        }
        else
        {
            PlayerDead();
        }
    }

    public void PlayerDead()
    {
        flashLight.PickedUp = false;
        isShielded = false;
        ItemWorld itemWorld = GetComponent<ItemWorld>();
        RestoreAllItem?.Invoke();
        inventory.ClearItem();
        gameObject.transform.position = respawnPoint.transform.position;
        gameObject.transform.rotation = respawnPoint.transform.rotation;

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
            flashLightObeject.GetComponent<Collider>().enabled = false;
            inventory.Additem(itemWorld.GetItem());
            UseItem(new Item { itemType = Item.ItemType.Flashlight, itemAmount = 1 });
        }

        if(other.CompareTag("Shield"))
        {
            isShielded = true;
            inventory.Additem(itemWorld.GetItem());
            itemWorld.DestroySelf();
        }
    }

    public void UseItem(Item item)
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
                inventory.RemoveItem(new Item { itemType = Item.ItemType.OysterCard, itemAmount = 3 });
                break;

            case Item.ItemType.Shield:
                isShielded = false;
                inventory.RemoveItem(new Item { itemType = Item.ItemType.Shield, itemAmount = 1 });
                break;
        }
    }
}
