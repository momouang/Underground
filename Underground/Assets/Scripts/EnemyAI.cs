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

    public Transform[] wayPoints;
    int wayPointIndex = 0;
    Vector3 target;


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
        gameObject.transform.LookAt(player);
        float distance = Vector3.Distance(player.transform.position,gameObject.transform.position);

        
        if (Vector3.Distance(transform.position, target) < 1f)
        {
            IterateWayPointIndex();
        }
                
        if (distance <= 10)
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
        if(other.CompareTag("Player"))
        {
            Debug.Log("Attacked");
            playerScript.attacked = true;

            if(!playerScript.isShielded)
            {
                playerScript.PlayerDead();
            }
        }
    }

}
