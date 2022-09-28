using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.Video;

public class VideoScript : MonoBehaviour
{
    public float desiredTimeVideo = 89;
    private float timeVideo;
    public VideoPlayer videoPlayer;
    public LevelLoader levelLoader;
    // Start is called before the first frame update
    void Start()
    { 
        timeVideo = desiredTimeVideo;
        StartCoroutine(Video_Time());
    }

    public void SkipCutscene()
    {
        timeVideo = 1;
        StartCoroutine(Video_Time());
    }

    IEnumerator Video_Time()
    {
        yield return new WaitForSeconds(timeVideo);
        levelLoader.LoadNextLevel();
    }
    
}
