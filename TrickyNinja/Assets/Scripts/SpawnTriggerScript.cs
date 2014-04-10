//Spawn Trigger Script
//Detects when the player enters the bounds of the Spawn Trigger and then spawns
//the enemy specified
//Last edited by Jason Ege on 02-28-2014 @ 11:50am

using UnityEngine;
using System.Collections;

public class SpawnTriggerScript : EntityScript {

	public GameObject gEnemyToSpawn; //The enemy to be spawned - defined by the inspector interface.
	public Vector3[] vOffset; //Each enemy's spawn offset from the trigger's position.
	public bool bDestroyOnTriggered; //The bool that tells the trigger box whether it should destroy itself or not upon being triggered.

	// Use this for initialization
	void Start () {
	
	}
	
	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Player") //If the trigger collider has collided with the Player.
		{
			for (int i = 0; i < vOffset.Length; i++) //Use the number of spawn offsets to specify how many cycles to go through.
													 //because that is the exact number of enemies that will be spawned.
			{
				Instantiate (gEnemyToSpawn, vSpawnPoint + vOffset[i], Quaternion.Euler (0.0f,0.0f,0.0f)); //Create a new instance of whatever enemy is
																										   //supposed to be spawned by the spawner.
			}
			if (bDestroyOnTriggered == true) //If the trigger was set to destroy on completing its life purpose...
			{
				Destroy (gameObject); //Destroy the trigger upon completion of its life purpose.
			}
		}
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
