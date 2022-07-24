using System;
using System.Collections;
using System.Collections.Generic;
using Unity.Mathematics;
using UnityEngine;
using System.Linq;
using Random = UnityEngine.Random;

public class Player : MonoBehaviour
{
    //[SerializeField] private float moveSpeed = 0f;
    internal static Player instance = null; 
    internal static Direction direction = Direction.None;
    internal bool isGameOver;
    internal bool isGameStarted;
    [SerializeField] private float moveSpeed = 0f;
    [SerializeField] internal SkinnedMeshRenderer playerMeshRenderer = null;
    [SerializeField] internal Animator animator = null;
    [SerializeField] internal TrackManager activeTrackManager = null;
    private MeshRenderer activeGate = null;

    //[SerializeField] private TrackManager track;
    // Start is called before the first frame update
    void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else if( instance != this)
        {
            Destroy(gameObject);
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (isGameStarted)
        {
            
        }
        if (direction == Direction.Left)
        {
            transform.Translate(Vector3.left*Time.deltaTime*moveSpeed);
        }
        else if (direction == Direction.Right)
        {
            transform.Translate(Vector3.right*Time.deltaTime*moveSpeed);
        }
        this.gameObject.transform.rotation =  quaternion.identity;
        //  transform.Translate(Vector3.forward*moveSpeed*Time.deltaTime);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Gate")
        {
            other.gameObject.transform.parent.transform.parent.gameObject.GetComponent<TrackManager>().BurstGate(other.gameObject.transform.position,other.gameObject.GetComponent<MeshRenderer>().material);
          //  Destroy(other.gameObject);
            activeGate = other.gameObject.GetComponent<MeshRenderer>();
            activeGate.enabled = false;
            UIManager.instance.gameScore++;
        }
        else if (other.gameObject.tag == "Track")
        {
            activeTrackManager = other.gameObject.GetComponent<TrackManager>();
            activeTrackManager.colorChanger();
        }
        else if (other.gameObject.tag == "Border" || other.gameObject.tag == "Wall")
        {
          //  int val = ;
            int val = Random.Range(1,3);
           // print(val);
            animator.SetInteger("Die#",val);
            moveSpeed = 0;
            isGameOver = true;
            UIManager.instance.GameOver();
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Track")
        {
            activeGate.enabled = true;
        }
    }
}
