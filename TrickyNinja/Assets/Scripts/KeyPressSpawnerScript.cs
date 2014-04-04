//Key Press spawner script
//By Steven Hoover, based by Jason Ege's Script


using UnityEngine;
using System.Collections;

public class KeyPressSpawnerScript : MonoBehaviour {

	public Vector3 vOffset;
	public Vector3 vRotateOffset;
	public int iEnemiesSpawnedPerPress;
	public KeyCode kActivationKey;
	//public float fTimeBetweenEnemies;
	public GameObject gEnemyToSpawn;
	
	GameObject gPlayer;		//The active player object.

	// Use this for initialization
	void Start () 
	{
		//gameManager = GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
	}

	// Update is called once per frame
	void Update ()
	{
		if( Input.GetKeyDown( kActivationKey ) )
			Instantiate (gEnemyToSpawn, transform.position + vOffset, Quaternion.Euler (vRotateOffset));
	}
}
