using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Slimeball : MonoBehaviour
{
    public GameObject SpawnE;
    private float Stime;
    public int speed;
    private Vector2 screenF;
    private Rigidbody2D rb;
    public float border;
    public float spawn_cord = -2.5f;
    public float min_val = 1.3f;
    public float max_val = 3.0f;
    private SpriteRenderer sr;
    private bool hasAppeared = false;


    // Start is called before the first frame update
    void Start()
    {
        int speed = 5;
        screenF = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));
        rb = this.GetComponent<Rigidbody2D>();
        rb.velocity = new Vector2(speed, 0);
        sr = GetComponent<SpriteRenderer>();
        StartCoroutine(Sball());

    }

    // Update is called once per frame
    void Update()
    {
        if (sr.isVisible)
        {
            hasAppeared = true;
        }
        if (hasAppeared)
        {
            if (!sr.isVisible)
            {
                Destroy(this.gameObject);
            }
        }
        /**if(transform.position.x > border){
            Destroy(this.gameObject);
        }**/
    }
    public void Reflect()
    {
        rb.velocity = new Vector2(-speed, 0);
        gameObject.tag = "Reflect";
    }
    private void SpawnEnemy()
    {
        GameObject a = Instantiate(SpawnE) as GameObject;
        a.transform.position = new Vector2(-5.27f, Random.Range(-2.01f, 3.5f));
    }

    IEnumerator Sball()
    {
        while(true)
        {
            float Stime = Random.Range(min_val, max_val);
            yield return new WaitForSeconds(Stime);
            SpawnEnemy();   
        }
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(gameObject.tag == "Enemy" || gameObject.tag == "Reflect")
        {
            if (collision.gameObject.CompareTag("Attack"))
            {
                rb.velocity = new Vector2(- speed, 0);
                gameObject.tag = "Reflect";
            }
            else if (collision.gameObject.CompareTag("Block") || collision.gameObject.CompareTag("Enemy") || collision.gameObject.CompareTag("Reflect") || collision.gameObject.CompareTag("platform"))
            {
                Destroy(this.gameObject);
            }
        }

        if(gameObject.tag == "Reflect")
        {
            if (collision.gameObject.CompareTag("Boss"))
            {
                Destroy(this.gameObject);
            }
        }
    }
}
