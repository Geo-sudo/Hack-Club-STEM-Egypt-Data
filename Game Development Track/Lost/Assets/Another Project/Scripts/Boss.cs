using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;

public class Boss : MonoBehaviour
{

    public int Max_Health = 100;
    public int health;
    public int Damage = 10;
    public Health_Bar health_bar;
    private Material matWhite;
    private Material matDefault;
    private UnityEngine.Object explosionRef;
    private SpriteRenderer sr;
    [SerializeField] LevelLoader LevelLoader;
    //public float speed = 2;

    // Start is called before the first frame update
    void Start()
    {
        health = Max_Health;
        health_bar.Set_Max_Health(Max_Health);
        sr = GetComponent<SpriteRenderer>();
        matWhite = Resources.Load("WhiteFlash", typeof(Material)) as Material;
        matDefault = sr.material;
        explosionRef = Resources.Load("Explosion");
    }

    // Update is called once per frame

    void Update()
    {
        if(health <= 0)
        {
            StartCoroutine(Wait_After_Death());
        }
        
    }

    

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(gameObject.tag == "Boss")
        {
            if (collision.gameObject.CompareTag("Reflect"))
            {
                health -= Damage;
                health_bar.Set_Health(health);
                Debug.Log("The boss health is " + health);
            }
        }
        
        
    }
    IEnumerator Wait_After_Death()
    {
        yield return new WaitForSeconds(.40f);
        LevelLoader.LoadNextLevel();
    }

}
