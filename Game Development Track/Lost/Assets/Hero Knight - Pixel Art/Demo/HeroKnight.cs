using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System;
using UnityEngine.UIElements;

public class HeroKnight : MonoBehaviour {

    [SerializeField] float      m_speed = 4.0f;
    [SerializeField] float      m_jumpForce = 7.5f;
    [SerializeField] float      m_rollForce = 6.0f;
    [SerializeField] bool       m_noBlood = false;
    [SerializeField] bool isAlive = true;
    [SerializeField] int damage = 1;
    [SerializeField] GameObject m_slideDust;
    [SerializeField] LayerMask enemyLayers;
    [SerializeField] LayerMask slimeLayers;
    [SerializeField] GameObject gameoverScreen;
    [SerializeField] LevelLoader levelLoader;



    [SerializeField] private AudioSource deathSoundEffect;
    [SerializeField] private AudioSource jumpSoundEffect;
    [SerializeField] private AudioSource landingSoundEffect;
    [SerializeField] private AudioSource attackSoundEffect;
    [SerializeField] private AudioSource walkingSoundEffect;
    [SerializeField] private AudioSource blockSoundEffect;

    public string P_state = "Alive";
    public float Spawn_X_Cordinate = 7;
    public float Spawn_Y_Cordinate = 7;
    public Transform attackPoint;
    public float attackRange = 0.05f;

    private Animator            m_animator;
    private Rigidbody2D         m_body2d;
    private Sensor_HeroKnight   m_groundSensor;
    private Sensor_HeroKnight   m_wallSensorR1;
    private Sensor_HeroKnight   m_wallSensorR2;
    private Sensor_HeroKnight   m_wallSensorL1;
    private Sensor_HeroKnight   m_wallSensorL2;
    private bool                m_grounded = false;
    private bool                m_rolling = false;
    private bool                isMoving = false;
    private int                 m_facingDirection = 1;
    private int                 m_currentAttack = 0;
    private float               m_timeSinceAttack = 0.0f;
    private float               m_delayToIdle = 0.0f;


    // Use this for initialization
    void Start ()
    {
        m_animator = GetComponent<Animator>();
        m_body2d = GetComponent<Rigidbody2D>();
        m_groundSensor = transform.Find("GroundSensor").GetComponent<Sensor_HeroKnight>();
        m_wallSensorR1 = transform.Find("WallSensor_R1").GetComponent<Sensor_HeroKnight>();
        m_wallSensorR2 = transform.Find("WallSensor_R2").GetComponent<Sensor_HeroKnight>();
        m_wallSensorL1 = transform.Find("WallSensor_L1").GetComponent<Sensor_HeroKnight>();
        m_wallSensorL2 = transform.Find("WallSensor_L2").GetComponent<Sensor_HeroKnight>();
        gameObject.tag = "Player";
        
    }

   

    // Update is called once per frame
    void Update ()
    {
        // Increase timer that controls attack combo
        m_timeSinceAttack += Time.deltaTime;

        //Check if character just landed on the ground
        if (!m_grounded && m_groundSensor.State())
        {
            m_grounded = true;
            m_animator.SetBool("Grounded", m_grounded);
        }

        //Check if character just started falling
        if (m_grounded && !m_groundSensor.State())
        {
            m_grounded = false;
            m_animator.SetBool("Grounded", m_grounded);
        }

        // -- Handle input and movement --
        float inputX = Input.GetAxis("Horizontal");

        // Swap direction of sprite depending on walk direction
        if (inputX > 0 && isAlive == true)
        {
            transform.localScale = new Vector3(2.5f, 2.5f, 0);
            m_facingDirection = 1;
        }
            
        else if (inputX < 0 && isAlive == true)
        {
            transform.localScale = new Vector3(-2.5f, 2.5f, 0);
            m_facingDirection = -1;
        }

        // Move
        if (!m_rolling && isAlive == true )
            m_body2d.velocity = new Vector2(inputX * m_speed, m_body2d.velocity.y);

        //Set AirSpeed in animator
        m_animator.SetFloat("AirSpeedY", m_body2d.velocity.y);

        // -- Handle Animations --
        //Wall Slide
        //m_animator.SetBool("WallSlide", (m_wallSensorR1.State() && m_wallSensorR2.State()) || (m_wallSensorL1.State() && m_wallSensorL2.State()));

        //Death
        if (transform.position.y < -6 && !m_rolling)
        {
            gameObject.tag = "Dead";
        }

        //Hurt
        //else if (Input.GetKeyDown("q") && !m_rolling)
        //    m_animator.SetTrigger("Hurt");

        //Attack
        else if (Input.GetMouseButtonDown(0) && m_timeSinceAttack > 0.25f && !m_rolling && isAlive == true)
        {

            StartCoroutine(Attack_Cooldown());
            Attack();
            
        }

        

        // Block
        else if (Input.GetMouseButtonDown(1) && !m_rolling && isAlive == true)
        {
            m_animator.SetTrigger("Block");
            string P_state = "Block";
            gameObject.tag = "Block";
            Debug.Log(P_state);
            m_animator.SetBool("IdleBlock", true);
            blockSoundEffect.Play();
        }

        else if (Input.GetMouseButtonUp(1) && isAlive == true)
        {
            m_animator.SetBool("IdleBlock", false);
            gameObject.tag = "Player";
        }

        // Roll
        else if (Input.GetKeyDown("left shift") && !m_rolling && isAlive == true)
        {
            m_rolling = true;
            m_animator.SetTrigger("Roll");
            m_body2d.velocity = new Vector2(m_facingDirection * m_rollForce, m_body2d.velocity.y);
        }


        //Jump
        else if (Input.GetKeyDown("space") && m_grounded && !m_rolling && isAlive == true)
        {
            m_animator.SetTrigger("Jump");
            m_grounded = false;
            m_animator.SetBool("Grounded", m_grounded);
            m_body2d.velocity = new Vector2(m_body2d.velocity.x, m_jumpForce);
            m_groundSensor.Disable(0.2f);
            jumpSoundEffect.Play();
        }

        //Run
        else if (Mathf.Abs(inputX) > Mathf.Epsilon && isAlive == true)
        {
            // Reset timer
            m_delayToIdle = 0.05f;
            m_animator.SetInteger("AnimState", 1);
            isMoving = true;
            
            
        }

        else if (Input.GetKeyDown("r") && isAlive == true)
        {
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        }

        //Idle
        else
        {
            // Prevents flickering transitions to idle
            m_delayToIdle -= Time.deltaTime;
            if (m_delayToIdle < 0)
                m_animator.SetInteger("AnimState", 0);
            isMoving = false;
        }

        if (isMoving == true)
        {
            if (!walkingSoundEffect.isPlaying)
            {
                walkingSoundEffect.Play();
            }
        } else
        {
            walkingSoundEffect.Stop();
        }
    }

    private void Attack()
    {
        m_currentAttack++;
        

        // Loop back to one after third attack
        if (m_currentAttack > 3)
            m_currentAttack = 1;

        // Reset Attack combo if time since last attack is too large
        if (m_timeSinceAttack > 1.0f)
            m_currentAttack = 1;

        // Call one of three attack animations "Attack1", "Attack2", "Attack3"
        m_animator.SetTrigger("Attack" + m_currentAttack);
        attackSoundEffect.Play();

        // Reset timer
        m_timeSinceAttack = 0.0f;
        Collider2D[] hitEnemies = Physics2D.OverlapCircleAll(attackPoint.position, attackRange, enemyLayers);
        foreach (Collider2D enemy in hitEnemies)
        {
            enemy.GetComponent<DieAnimation>().TakeDamage(damage);
        }
        Collider2D[] hitSlime = Physics2D.OverlapCircleAll(attackPoint.position, attackRange, slimeLayers);
        foreach (Collider2D slime in hitSlime)
        {
            slime.GetComponent<Slimeball>().Reflect();
        }
        
        
    }

    private void OnDrawGizmos()
    {
        if(attackPoint == null)
        {
            return;
        }
        Gizmos.DrawWireSphere(attackPoint.position, attackRange);
    }

    // Animation Events
    // Called in end of roll animation.
    void AE_ResetRoll()
    {
        m_rolling = false;
    }

    // Called in slide animation.
    void AE_SlideDust()
    {
        Vector3 spawnPosition;

        if (m_facingDirection == 1)
            spawnPosition = m_wallSensorR2.transform.position;
        else
            spawnPosition = m_wallSensorL2.transform.position;

        if (m_slideDust != null)
        {
            // Set correct arrow spawn position
            GameObject dust = Instantiate(m_slideDust, spawnPosition, gameObject.transform.localRotation) as GameObject;
            // Turn arrow in correct direction
            dust.transform.localScale = new Vector3(m_facingDirection, 1, 1);
        }

        

    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(gameObject.tag == "Player")
        {
            if (collision.gameObject.CompareTag("Enemy") || collision.gameObject.CompareTag("Reflect"))
            {
                gameObject.tag = "Dead";
                m_animator.SetBool("noBlood", m_noBlood);
                m_animator.SetTrigger("Death");
                deathSoundEffect.Play();
                isAlive = false;
                StartCoroutine(Wait_After_Death());
            }
        }
        if (collision.gameObject.CompareTag("Spikes") || collision.gameObject.CompareTag("Boss"))
        {
            gameObject.tag = "Dead";
            m_animator.SetBool("noBlood", m_noBlood);
            m_animator.SetTrigger("Death");
            isAlive = false;
            deathSoundEffect.Play();
            StartCoroutine(Wait_After_Death());
        }
        if (collision.gameObject.CompareTag("FinishLine"))
        {
            levelLoader.LoadNextLevel();
        }
        if (collision.gameObject.CompareTag("Border"))
        {
            gameObject.tag = "Dead";
            m_animator.SetBool("noBlood", m_noBlood);
            m_animator.SetTrigger("Death");
            isAlive = false;
            deathSoundEffect.Play();
            StartCoroutine(Wait_After_Death());
        }
        if (collision.gameObject.CompareTag("Ground") || collision.gameObject.CompareTag("Platform"))
        {
            landingSoundEffect.Play();
        }

        if (collision.gameObject.CompareTag("River"))
        {
            gameObject.tag = "Dead";
            m_animator.SetBool("noBlood", m_noBlood);
            m_animator.SetTrigger("Death");
            isAlive = false;
            deathSoundEffect.Play();
            StartCoroutine(Wait_After_Death());
        }

    }

    

    IEnumerator Attack_Cooldown()
    {
        yield return new WaitForSeconds(0.3f);
        gameObject.tag = "Player";
    }

    IEnumerator Wait_After_Death()
    {
        yield return new WaitForSeconds(1f);
        gameoverScreen.SetActive(true);
    }

    IEnumerator Wait_For_Sound()
    {
        yield return new WaitForSeconds(1f);
    }
}
