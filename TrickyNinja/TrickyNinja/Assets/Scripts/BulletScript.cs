//Bullet Script
//Last edited by Jason Ege on 02/20/2014 at 9:23am
//Abstract class that handles bullet activities.
//Both player and enemy bullets derive from this class, which means all the
//  functions you see in this script are accessable by both enemy bullets and player bullets.

using UnityEngine;
using System.Collections;

public class BulletScript : EntityScript {

	// Use this for initialization
	void Start () {
	
	}
	
	//The function that, when called, destroys the bullet.
	public void KillBullet(GameObject bullettokill)
	{
		Destroy (bullettokill); //Bullet should no longer exist.
								//This typically happens when a bullet hits a player or an enemy.
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
