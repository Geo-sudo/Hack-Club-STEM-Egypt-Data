using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class WizardAnimation : MonoBehaviour
{
    public int maxHealth = 3;
    private int currentHealth;
    public Animator animator;
    public float speed = 3;
    Vector3 lastPosition = Vector3.zero;
    // Start is called before the first frame update
    void Start()
    {
        currentHealth = maxHealth;
    }

    // Update is called once per frame
    void Update()
    {
        speed = (transform.position - lastPosition).magnitude;
        lastPosition = transform.position;
        if(speed > 0)
        {
            animator.SetFloat("Speed", speed);
        }
    }
    public void TakeDamage(int damage)
    {
        currentHealth -= damage;

        if (currentHealth <= 0)
        {
            Die();
        }
    }
    private void Die()
    {
        animator.SetTrigger("Death");
        StartCoroutine(WaitAfterDeath());

    }
    IEnumerator WaitAfterDeath()
    {
        yield return new WaitForSeconds(.40f);
        Destroy(gameObject);
    }
    
}
