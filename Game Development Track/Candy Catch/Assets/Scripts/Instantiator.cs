using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Instantiator : MonoBehaviour
{
    public GameObject[] candy;
    public GameObject[] RotCandy;
    public Player Ps;
    //Vector2 screenBounds = Camera.main.WorldToScreenPoint(new Vector3(Screen.width,Screen.height,Camera.main.transform.position.z));
    void Start()
    {
        
        StartCoroutine(spawn());
        
    }
    void Update()
    {
              
    }
    IEnumerator spawn(){
    while(Ps.score >=0){
     Vector3 pos = transform.position ;
     pos.x = Random.Range(Camera.main.ViewportToWorldPoint(new Vector3(1f, 0f, 0f)).x,Camera.main.ViewportToWorldPoint(new Vector3(0f, 0f, 0f)).x);
     Debug.Log("Screen Width : " + Screen.width);
     float PoRotCandy = Random.Range(0,10);
     transform.position = pos;
     GameObject newObject;
     //Debug.Log(PoRotCandy);
     if(PoRotCandy < 6){
      newObject = Instantiate(candy[Random.Range(0,candy.Length)],transform.position, Quaternion.identity);    
     }
     else{
      newObject = Instantiate(RotCandy[Random.Range(0,RotCandy.Length)],transform.position, Quaternion.identity);
     }
     newObject.transform.localScale = new Vector3(0.375f, 0.375f, newObject.transform.localScale.z); 
     newObject.AddComponent<Rigidbody2D>();
     newObject.AddComponent<CircleCollider2D>();
     if(PoRotCandy < 6){
     newObject.tag ="Candy";
     }
     else{
         newObject.tag ="RotCandy";
     }
     float wait = Random.Range(1.5f,3.5f);
     yield return new WaitForSeconds(wait);
     if(newObject !=  null){
         Destroy(newObject);
     }
    }
}
}