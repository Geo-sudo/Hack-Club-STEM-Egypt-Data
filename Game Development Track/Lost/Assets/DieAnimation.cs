using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Tilemaps;
using UnityEngine.UIElements;

public class DieAnimation : MonoBehaviour
{
    public int maxHealth = 3;
    private int currentHealth;
    private float speed;
    

    
    private Material matWhite;
    private Material matDefault;
    private UnityEngine.Object explosionRef;
    private SpriteRenderer sr;
    public Animator animator;
    public LayerMask playerLayer;
    Vector3 lastPosition = Vector3.zero;
    // Start is called before the first frame update
    void Start()
    {
        currentHealth = maxHealth;
        sr = GetComponent<SpriteRenderer>();
        matWhite = Resources.Load("WhiteFlash", typeof(Material)) as Material;
        matDefault = sr.material;
        explosionRef = Resources.Load("Explosion");
    }


    private void FixedUpdate()
    {
        speed = (transform.position - lastPosition).magnitude;
        lastPosition = transform.position;
        if(speed > 0)
        {
            animator.SetFloat("Speed",speed);
        }
    }
    public void TakeDamage(int damage)
    {
        currentHealth -= damage;
        sr.material = matWhite;
        animator.SetTrigger("Hit");
        gameObject.tag = "Enemy";

        if (currentHealth <= 0)
        {
            Die();
        }
        else
        {
            Invoke("ResetMaterial", .25f);
        }
    }
    void ResetMaterial()
    {
        sr.material = matDefault;
    }

    private void Die()
    {
        animator.SetTrigger("Death");
        gameObject.tag = "Dead";
        StartCoroutine(WaitAfterDeath());
        
    }
    IEnumerator WaitAfterDeath()
    {
        yield return new WaitForSeconds(.40f);
        Destroy(gameObject);
    }
}
