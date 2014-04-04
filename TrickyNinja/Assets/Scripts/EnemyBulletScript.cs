//Enemy Bullet Script
//Last edited by Jason Ege on 02/20/2014
//Handles the enemies' bullets

using UnityEngine;
using System.Collections;

public class EnemyBulletScript : BulletScript {

	public float fSpeed; //Speed of the bullet
	public float fAliveTime;	//The max amount of time the bullet stays alive before it automatically dies.
								//This prevents bullets from staying alive infinitely which will result in the
								//game slowing down over time as it gets bogged down with the hundreds of
								//bullets that have been spawned and are now at various x-positions ranging in the thousands.

	float fKillTimer; //The timer that counts up to the "fAliveTime". When the two numbers are equal, the bullet is destroyed.

	// Use this for initialization
	void Start () {
	
	}
	
	//This function tests to see if the bullet has been alive for a enough time that it is probably not worth the resources to update anymore.
	//If the bullet has been alive for the specified maximum amount of time, it gets destroyed.
	void BulletCantLastForever()
	{
		fKillTimer += Time.deltaTime; //Add time to the kill timer.
		if (fKillTimer > fAliveTime) //If the kill timer has reached the maximum allowed...
		{
			KillBullet (this.gameObject); //Destroy the bullet so it no longer takes up valuable resources.
		}
	}
	
	//OnTriggerEnter handles when the bullet collides with a collider labeled as a trigger collider.
	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Player") //If the trigger that the bullet collided with is tagged as a Player...
		{
			if(c.gameObject.GetComponent<EntityScript>().bIncorporeal == false)
			{
				if (!bIncorporeal)
				{
					c.gameObject.SendMessage("Hurt", 25);//Hurt (100);
				}
				Destroy (gameObject); //Destroy the bullet object
			}
			//c.gameObject.renderer.enabled = false; //Disable the player's renderer
		}
	}
	
	// Update is called once per frame
	void Update () {
		transform.Translate (transform.right*Time.deltaTime*fSpeed,Space.Self); //Make sure to move the bullet forward - this makes the game a lot more fun.
		BulletCantLastForever (); //No, it can't.
	}
}
