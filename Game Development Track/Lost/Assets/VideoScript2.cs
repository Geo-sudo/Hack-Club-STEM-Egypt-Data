using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.Video;

public class VideoScript2 : MonoBehaviour
{
    public float DesiredVideoTime = 187;
    private float videoTime;
    public VideoPlayer videoPlayer;
    public LevelLoader levelLoader;
    // Start is called before the first frame update
    void Start()
    {
        videoTime = DesiredVideoTime;
        StartCoroutine(Video_Time());
    }

    public void SkipCutscene()
    {
        videoTime = 1;
        StartCoroutine(Video_Time());
    }

    IEnumerator Video_Time()
    {
        yield return new WaitForSeconds(videoTime);
        levelLoader.LoadNextLevel();
    }
}
