using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class Player : MonoBehaviour
{
    
    float maxSpeed = 20f;
    float HAccelration = 30;
    public int score;
    int Rise = 0;
    int decrease = 1;
    public int CurrentHighScore;
    void Start()
    {
    }
    void Update()
    {
        
        //Debug.Log("Rise = " + Rise);
        //Debug.Log("Decrease = " +decrease);
        if(score >= 0){
        Vector3 pos = transform.position;
        float Hvalue = Input.GetAxis("Horizontal");
        float velocity = (Hvalue*HAccelration*Time.deltaTime);
        if(Hvalue == 0){
            velocity = Mathf.Lerp(velocity,0,0.1f);
        }
        transform.Translate(velocity,0,0);
        pos.x = Mathf.Clamp(Camera.main.ViewportToWorldPoint(new Vector3(0f, 0f, 0f)).x,transform.position.x,Camera.main.ViewportToWorldPoint(new Vector3(1f, 0f, 0f)).x);
        transform.position = pos;
        }//
    }
    private void OnCollisionEnter2D(Collision2D other) {
        
        if(other.gameObject.tag == "Candy"){
            Destroy(other.gameObject);
            score++;
            if(score > Rise && score % 5 == 0){
            Rise = score;
            decrease++;
           if(score > PlayerPrefs.GetInt("HighScore")){
            PlayerPrefs.SetInt("HighScore",score);
        }
            if(score > CurrentHighScore){
            CurrentHighScore =  score;
        }
        }
         //   Debug.Log(score);
        }
        if(other.gameObject.tag == "RotCandy"){
            Destroy(other.gameObject);
            score=score-decrease;
        }
    }
}
