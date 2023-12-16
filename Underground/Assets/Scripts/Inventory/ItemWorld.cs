using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemWorld : MonoBehaviour
{
    [SerializeField]
    private Item item;
    private SpriteRenderer spriteRenderer;

    [SerializeField]
    GameObject visual;

    private void OnEnable()
    {
        PlayerMovement.RestoreAllItem += RestoreItem;
    }

    private void OnDisable()
    {
        PlayerMovement.RestoreAllItem -= RestoreItem;
    }

    public void SetItem(Item item)
    {
        this.item = item;
        //spriteRenderer.sprite = item.GetSprite();
    }

    public Item GetItem()
    {
        return item;
    }

    public void DestroySelf()
    {
        //Destroy(gameObject);
        visual.SetActive(false);
        gameObject.GetComponent<Collider>().enabled = false;
    }

    public void RestoreItem()
    {
        visual.SetActive(true);
        gameObject.GetComponent<Collider>().enabled = true;
    }
}
