//Spawn Time Script
//If used, enemies will spawn based on a timer.
//Last edited 02-28-2014 @ 11:49am

using UnityEngine;
using System.Collections;

public class SpawnTimeScript : EntityScript {

	public float fInitTimeBetweenEnemies; //The defined amount of time between when the sword enemies are supposed to spawn.
	public float fInitTimeBetweenMonks; //The defined amount of time between when the monks are supposed to spawn.
	public GameObject gPlayer; //Our friend, the player.
	public GameObject gSwordGuy; //The standard sword enemy.
	public GameObject gMonk; //The monk character that runs at you and then jumps.

	float fTimeBetweenEnemies; //The dynamic maximum amount of time between when two sword enemies spawn.
	float fTimeBetweenMonks; //The dynamic maximum amount of time between when two monks spawn.
	float fTimeBetweenEnemiesTimer; //The timer that counts up toward the maximum swordguy time.
	float fTimeBetweenMonksTimer; //The timer that counts up toward the maximum monk time

	// Use this for initialization
	void Start () {
		//Set the max time between enemies to be the pre-defined amount of time.
		fTimeBetweenEnemies = fInitTimeBetweenEnemies;
		fTimeBetweenMonks = fInitTimeBetweenMonks;
		//Set the count-up timers to start at 0.
		fTimeBetweenEnemiesTimer = 0;
		fTimeBetweenMonksTimer = 0;
	}
	
	// Update is called once per frame
	void Update () {
		fTimeBetweenEnemiesTimer += Time.deltaTime; //Add time to the count-up swordguy timer.
		fTimeBetweenMonksTimer += Time.deltaTime; //Add time to the count-up monk timer
		fTimeBetweenEnemies -= Time.deltaTime/200; //Lower the maximum time between enemies by one one-hundredth of a second.
		fTimeBetweenMonks -= Time.deltaTime/500; //Lower the maximum time bewtween monks by one-fifth of a one-hundredth of a second.
		if (fTimeBetweenEnemiesTimer > fTimeBetweenEnemies)
		{
			Instantiate (gSwordGuy, new Vector3(gPlayer.transform.position.x - 20, gPlayer.transform.position.y, vSpawnPoint.z), Quaternion.Euler (0.0f, 90.0f, 0.0f));
			Instantiate (gSwordGuy, new Vector3(gPlayer.transform.position.x + 25, gPlayer.transform.position.y, vSpawnPoint.z), Quaternion.Euler (0.0f, 90.0f, 0.0f));
			fTimeBetweenEnemiesTimer = 0;
		}
		else if (fTimeBetweenMonksTimer > fTimeBetweenMonks)
		{
			Instantiate (gMonk, new Vector3(gPlayer.transform.position.x - 20, gPlayer.transform.position.y + vSpawnPoint.y + 2.5f, vSpawnPoint.z), Quaternion.Euler(0.0f, 90.0f, 0.0f));
			fTimeBetweenMonksTimer = 0;
		}
		
		//The following clamps the minimum amount of time between enemies so that there aren't so many enemies at once it becomes impossible to play.
		if (fTimeBetweenEnemies < fTimeBetweenEnemies / 4) //If the swordguy maximum time is a quarter of the original.
		{
			fTimeBetweenEnemies = fInitTimeBetweenEnemies / 4; //Clamp maximum time between enemies to that amount.
		}
		else if (fTimeBetweenMonks < fInitTimeBetweenMonks / 2) //If the monk maximum time is a half of the original.
		{
			fTimeBetweenMonks = fInitTimeBetweenMonks / 2; //Clamp maximum time between monks to that amount.
		}
	}
}
