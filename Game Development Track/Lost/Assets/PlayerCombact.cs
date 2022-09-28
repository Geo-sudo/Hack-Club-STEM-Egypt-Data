using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerCombact : MonoBehaviour
{
    public Animator animator;

    public Transform attackPoint;
    public float attackRange = 0.05f;
 

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Attack();
        }
    }

    private void Attack()
    {
        
    }
}
