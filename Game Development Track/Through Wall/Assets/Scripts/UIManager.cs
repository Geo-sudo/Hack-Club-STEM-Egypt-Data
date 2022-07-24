using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.SocialPlatforms.Impl;

public class UIManager : MonoBehaviour
{
  internal static UIManager instance = null;
  [SerializeField] private TextMeshProUGUI ScoreMeshProUGUI;
  [SerializeField] private GameObject gamePlayUI;
  [SerializeField] private GameObject gameMainMenuUI;
  [SerializeField] private GameObject gameOverUI;
  [SerializeField] private TextMeshProUGUI highScoreTextMeshProUGUI;
  [SerializeField] private AudioSource audioSource;
  [SerializeField] private TextMeshProUGUI MusciMeshProUGUI;
  internal int gameScore = 0;

  private void Awake()
  {
    instance = this;
    if (instance == null)
    {
      instance = this;
    }
    else if (instance != this)
    {
      Destroy(gameObject);
    }

    if (!PlayerPrefs.HasKey("HighScore"))
    {
      PlayerPrefs.SetInt("Music",1);
      PlayerPrefs.SetInt("HighScore",0);
    }  
  }

  private void Start()
  {
    if (PlayerPrefs.GetInt("Music") == 1)
    {
      MusciMeshProUGUI.SetText("Music-On");
      audioSource.enabled = true;
    }
    else if(PlayerPrefs.GetInt("Music") == 0)
    {
      MusciMeshProUGUI.SetText("Music-Off");
      audioSource.enabled = false;
    }
    highScoreTextMeshProUGUI.SetText("HighScore:"+PlayerPrefs.GetInt("HighScore").ToString());

  }

  private void Update()
  {
   // print(PlayerPrefs.GetInt("Music"));
    ScoreMeshProUGUI.SetText(gameScore.ToString());
  }

  public void PlayBtn()
  {
    Player.instance.animator.SetTrigger("Play");
    gamePlayUI.SetActive(true);
    gameMainMenuUI.SetActive(false);
    Player.instance.isGameStarted = true;
  }

  public void RetryBtn()
  {
    SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
  }

  internal void GameOver()
  {
    gamePlayUI.SetActive(false);
    gameOverUI.SetActive(true);
    if (gameScore > PlayerPrefs.GetInt("HighScore"))
    {
      PlayerPrefs.SetInt("HighScore",gameScore);
    }
  }

  public void MusicOnOffBtn(TextMeshProUGUI txt)
  {
    //print("turnon/off");
    if (PlayerPrefs.GetInt("Music") == 1)
    {
      PlayerPrefs.SetInt("Music",0);
      txt.SetText("Music-Off");
      audioSource.enabled = false;
    }
    else if (PlayerPrefs.GetInt("Music") == 0)
    {
      txt.SetText("Music-On");
      PlayerPrefs.SetInt("Music",1);
      audioSource.enabled = true;
    }
  } 
}
