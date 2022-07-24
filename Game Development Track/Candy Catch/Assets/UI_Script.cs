using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;


public class UI_Script : MonoBehaviour
{
    [SerializeField]
    public Text scoreText;
    public Player ps;
    public GameObject panel;

    public Text Highscore;

    public Text score;

    // Start is called before the first frame update
    void Start()
    {
        
       
    }

    // Update is called once per frame
    void Update()
    {
        if(ps.score < 0){
        panel.SetActive(true);
        }
        scoreText.text ="Score :" + ps.score.ToString();
        Highscore.text ="HighScore :" + PlayerPrefs.GetInt("HighScore").ToString();
        score.text ="Score :" + ps.CurrentHighScore.ToString();
        if(Input.GetKey(KeyCode.Space)){
         SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        }

    }
}
