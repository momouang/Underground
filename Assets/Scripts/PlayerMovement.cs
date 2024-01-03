using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public static event System.Action RestoreAllItem;

    [Header("Main")]
    public AudioManager audioManager;
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
    public ParticleSystem shieldParticle;
    public GameManager gameManager;

    [SerializeField]
    private UI_Inventory uiInventory;

    public void Awake()
    {
        shieldParticle.Stop();
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
            shieldParticle.Play();
            audioManager.Play("Shield Sound");
        }
        else
        {
            gameManager.GameOver();
            audioManager.Play("Death Sound");
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
        gameManager.gameoverOverlay.SetActive(false);
        Cursor.lockState = CursorLockMode.Locked;

    }

    private void OnTriggerEnter(Collider other)
    {
        ItemWorld itemWorld = other.GetComponent<ItemWorld>();
        if(itemWorld != null && other.CompareTag("Destroyable"))
        {
            audioManager.Play("ItemPickup Sound");
            inventory.Additem(itemWorld.GetItem());
            itemWorld.DestroySelf();
        }

        if(other.CompareTag("Flashlight"))
        {
            audioManager.Play("ItemPickup Sound");
            flashLightObeject.GetComponent<Collider>().enabled = false;
            inventory.Additem(itemWorld.GetItem());
            UseItem(new Item { itemType = Item.ItemType.Flashlight, itemAmount = 1 });
        }

        if(other.CompareTag("Shield"))
        {
            audioManager.Play("ItemPickup Sound");
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
                audioManager.Play("OysterCard Sound");
                inventory.RemoveItem(new Item { itemType = Item.ItemType.OysterCard, itemAmount = 3 });
                break;

            case Item.ItemType.Shield:
                isShielded = false;
                inventory.RemoveItem(new Item { itemType = Item.ItemType.Shield, itemAmount = 1 });
                break;
        }
    }
}
