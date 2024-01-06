using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public static event System.Action RestoreAllItem;

    [Header("Main")]
    public AudioManager audioManager;
    public CharacterController controller;
    public bool isMoving = false;
    public float speed = 12f;   
    public Transform spawnPoint;
    public Transform respawnPoint;
    public float gravity = -9.81f;
    Vector3 velocity;
    public Transform groundCheck;
    public float groundDistance = 0.4f;
    public LayerMask groundMask;
    bool isGrounded;

    [Header("Inventory")]
    public Inventory inventory;
    public Flashlight flashLight;
    public bool isShielded = false;
    public GameObject flashLightObeject;

    [Header("Use OysterCard")]
    public bool gateOpened = false;
    public bool isUsingCard = false;
    public bool getOyster = false;
    public GameObject oysterCard;

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
        oysterCard.SetActive(false);
    }


    void Update()
    {
        isGrounded = Physics.CheckSphere(groundCheck.position,groundDistance,groundMask);
        if(isGrounded && velocity.y <0)
        {
            velocity.y = -2f;
        }

        if (gameManager.gameStart)
        {
            Move();
        }

        velocity.y += gravity * Time.deltaTime;
        controller.Move(velocity * Time.deltaTime);

        if (inventory.oysterCardAmount > 0)
        {
            if (Input.GetKeyDown(KeyCode.Space) && getOyster)
            {
                audioManager.Play("TakeOutCard Sound");
                isUsingCard = !isUsingCard;

                if (isUsingCard)
                {
                    oysterCard.SetActive(true);
                }
                else
                {
                    oysterCard.SetActive(false);
                }
            }
        }

        if(Input.GetKeyDown(KeyCode.B))
        {
            UseItem(new Item { itemType = Item.ItemType.Battery, itemAmount = 1 });
            flashLight.Charging();
            audioManager.Play("Charge Sound");
        }
    }

    public void Move()
    {
        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");
        Vector3 move = transform.right * x + transform.forward * z;
        controller.Move(move * speed * Time.deltaTime);

        if (move.magnitude > 0.1f && !isMoving)
        {
            isMoving = true;
            audioManager.Play("PlayerFootstep Sound");
        }
        else if(move.magnitude < 0.1f && isMoving)
        {
            isMoving = false;
            audioManager.Stop("PlayerFootstep Sound");
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
            isMoving = false;
            audioManager.Play("Death Sound");
        }
    }

    public void PlayerDead()
    {
        gameManager.gameStart = true;
        getOyster = false;
        inventory.oysterCardAmount = 0;
        isUsingCard = false;
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
            audioManager.Play("Charge Sound");
        }

        if(other.CompareTag("OysterCard"))
        {
            getOyster = true;
            audioManager.Play("ItemPickup Sound");
            inventory.Additem(itemWorld.GetItem());
            itemWorld.DestroySelf();
        }

        if(other.CompareTag("Gate"))
        {
            if (isUsingCard)
            {
                gateOpened = true;
                audioManager.Play("OysterCard Sound");
                UseItem(new Item { itemType = Item.ItemType.OysterCard, itemAmount = 3 });
            }
        }


        if(other.CompareTag("Shield"))
        {
            audioManager.Play("ItemPickup Sound");
            isShielded = true;
            inventory.Additem(itemWorld.GetItem());
            itemWorld.DestroySelf();
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if(other.CompareTag("Gate"))
        {
            gateOpened = false;
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
