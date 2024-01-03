using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyAI : MonoBehaviour
{
    [Header("Main")]
    private NavMeshAgent agent;
    public PlayerMovement playerScript;
    public Transform player;

    public EnemyState enemyState;
    public bool beAttacked = false;

    public Transform[] wayPoints;
    int wayPointIndex = 0;
    Vector3 target;
    public float chaseTimer = 10f;


    private void Start()
    {
        target = wayPoints[wayPointIndex].position;
        agent = GetComponent<NavMeshAgent>();
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
                    UpdateBehaviour(EnemyState.Patrol);
                }
            }
        }
        else
        {
            UpdateBehaviour(EnemyState.Patrol);
        }


        if (beAttacked)
        {
            chaseTimer += Time.deltaTime;
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
       
        //play attacking animation
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Player") && !beAttacked)
        {
            playerScript.BeAttacked();
            beAttacked = true;
            chaseTimer = 0;
            //chaseTimer += Time.deltaTime;
        }
    }

}
