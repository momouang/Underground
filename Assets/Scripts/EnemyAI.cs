using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyAI : MonoBehaviour
{
    public AudioManager audioManager;

    [Header("Main")]
    public NavMeshAgent agent;
    Animator anim;
    public PlayerMovement playerScript;
    public Transform player;

    public EnemyState enemyState;
    public bool beAttacked = false;

    public Transform[] wayPoints;
    int wayPointIndex = 0;
    Vector3 target;
    public float chaseTimer = 10f;

    [Header("Flashlight Attack")]
    public Flashlight flashlight;
    public bool ishitbyFlashlight = false;


    private void Start()
    {
        target = wayPoints[wayPointIndex].position;
        agent = gameObject.GetComponent<NavMeshAgent>();
        anim = gameObject.GetComponent<Animator>();
        Patrol();
    }

    public enum EnemyState
    {
        Patrol,
        Chase,
        Attack,
    }

    public void Update()
    {
        Vector3 targetPosition = new Vector3(player.position.x, transform.position.y,player.position.z);
        gameObject.transform.LookAt(targetPosition);
        float distance = Vector3.Distance(player.transform.position,gameObject.transform.position);

        if (Vector3.Distance(transform.position, target) < 1f)
        {
            IterateWayPointIndex();
        }
                
        if (distance <= 10 && chaseTimer > 5f )
        {
            UpdateBehaviour(EnemyState.Chase);

            
            if(distance <= 1)
            {
                UpdateBehaviour(EnemyState.Attack);

                if(playerScript.attacked)
                {
                    chaseTimer += Time.deltaTime;
                    UpdateBehaviour(EnemyState.Patrol);
                }
            }
        }
        else
        {
            UpdateBehaviour(EnemyState.Patrol);
        }

        if(ishitbyFlashlight)
        {
            audioManager.Play("EnemyScream Sound");
            anim.SetBool("isShocked", true);
            agent.speed--;
            StartCoroutine(CoolDown());
        }
        else
        {
            agent.speed = 5;
        }

    }

    private void UpdateBehaviour(EnemyState state)
    {
        enemyState = state;
        switch(state)
        {
            case EnemyState.Patrol:
                Patrol();
                break;
            case EnemyState.Chase:
                Chase();
                break;
            case EnemyState.Attack:
                Attack();
                break;
        }
    }

    private void Patrol()
    {
        target = wayPoints[wayPointIndex].position;
        agent.SetDestination(target);
    }

    void IterateWayPointIndex()
    {
        wayPointIndex++;
        if(wayPointIndex == wayPoints.Length)
        {
            wayPointIndex = 0;
        }
    }

    private void Chase()
    {
        agent.SetDestination(player.transform.position);
    }

    private void Attack()
    {
        audioManager.Play("EnemyLaugh Sound");
        //play attacking animation
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Player") && !beAttacked)
        {
            playerScript.BeAttacked();
            beAttacked = true;
            chaseTimer = 0;
        }
    }


    IEnumerator CoolDown()
    {
        yield return new WaitForSeconds(5);
        ishitbyFlashlight = false;
        anim.SetBool("isShocked", false);
    }

}
