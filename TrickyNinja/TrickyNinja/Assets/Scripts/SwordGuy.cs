using UnityEngine;
using System.Collections;

public class SwordGuy : EnemyScript {

	public float fSpeed; //The speed of the SwordGuy, defined in the inspector interface.
	
	bool bGrounded;
	float fNewPosY;

	GameObject gPlayer;	//The player game object.
	public float fAliveDistance; //How far away from the player the enemy has to be before he is destroyed to free up resources.
	//bool bGoingUp; //Is the swordguy going up?
	//float fKnockBackArc; //The arc by which the sword guy flies through the air when he gets knocked back.
	//float fDeltaKnockBack; //The change in knockback arc.

	// Use this for initialization
	void Start () {
		gPlayer = GameObject.FindGameObjectWithTag("Player"); //The player is any object tagged as the player.
		if (transform.position.x > gPlayer.transform.position.x)
		{
			fSpeed = -fSpeed;
		}
		bGrounded = false;
		//fNewPosY = transform.position.y + 1.0f;
	}
	
	//The Die method, derived from the "EntityScript".
	public override void Die()
	{
		Destroy (gameObject); //Destroy the local object that this script it attached to.
	}
	
	//The method that determines what happens when the player gets hurt.
	public override void Hurt(int aiDamage)
	{
		Die ();
		/*if (bGoingUp == true) //If the swordguy is moving up...
		{
			//He is immune to damage.
		}
		else if (bGoingUp == false) //If the sword guy is moving back down...
		{
			//fKnockBackArc = 1.0f;
			//bGoingUp = true;
			//fHealth -= aiDamage; //Damage the local game object.
		}*/
	}
	
	/*void MoveAwayFromPlayer(Vector3 vMovementRight, Vector3 vMovementLeft)
	{
		//fDeltaKnockBack -= Time.deltaTime*2.0f;
		//fKnockBackArc += fDeltaKnockBack;
		if (transform.position.x > gPlayer.transform.position.x) //If the enemy is to the right of the player
		{
			rigidbody.AddForce (new Vector3(2.0f, 0.0f, 0.0f), ForceMode.Force);
			//transform.Translate (vMovementRight, Space.World); //Move him away from the player a little.
		}
		else if (transform.position.x < gPlayer.transform.position.x) //If the enemy is to the left of the player
		{
			//transform.Translate (vMovementLeft, Space.World); //Move him away from the player a little.
		}
	}
	*/
	//The function that determines how the swordguy should move, derived from the "EntityScript" class.
	public override void Move ()
	{
		/*if (bGoingUp == true) //If the swordguy is moving up...
		{
			//MoveAwayFromPlayer(new Vector3(-transform.right.z*30.0f*Time.deltaTime, 0.0f, 0.0f), new Vector3(transform.right.x*30.0f*Time.deltaTime, 0.0f, 0.0f));
			//transform.position = new Vector3(transform.position.x, transform.position.y, 25.0f); //Set his Z position to stay at 25.
			if (transform.position.y > vSpawnPoint.y+1.75f) //If the swordguy is above his spawn point.
			{
				bGoingUp = false; //He is no longer going up.
			}
		}
		if (transform.position.y > vSpawnPoint.y && bGoingUp == false) //If the swordguy is not going up, but he is still above his spawn point where he started...
		{
			//fDeltaKnockBack -= Time.deltaTime*2.0f;
			//fKnockBackArc += fDeltaKnockBack;
			//MoveAwayFromPlayer(new Vector3(-transform.right.z*30.0f*Time.deltaTime, fKnockBackArc, 0.0f), new Vector3(transform.right.x*30.0f*Time.deltaTime, fKnockBackArc, 0.0f));
			//transform.Translate (0.0f, -fKnockBackArc, 0.0f);
			//transform.Translate (0.0f, -6.0f * Time.deltaTime, 0.0f); //Move him down slightly.
		}
		if (transform.position.y < vSpawnPoint.y + 0.02f && bGoingUp == false) //If the sword guy is not in the air and he is below a spot really close to his spawn point...
		{
			//transform.position = new Vector3(transform.position.x, vSpawnPoint.y, 25.0f);
			//fKnockBackArc = 0.0f;
			//fDeltaKnockBack = 0.0f;
			ChasePlayer (gPlayer, fSpeed); //The swordguy should chase the player.
		}*/
		//transform.Translate (0.0f, Mathf.Sin (-fKnockBackArc), 0.0f);
		transform.Translate (0.0f, 0.0f, fSpeed*Time.deltaTime);
		RaycastHit hit;
		if (Physics.Raycast (transform.position, -transform.up, out hit, 15.0f))
		{
			if (hit.collider.tag == "Ground")
			{
				bGrounded = true;
			}
			else
			{
				bGrounded = false;
			}
		}
		if (bGrounded == true)
		{
			fNewPosY = hit.barycentricCoordinate.y + 1.0f;
			transform.position = new Vector3(transform.position.x, fNewPosY, transform.position.z);
		}
		else if (bGrounded == false)
		{
			transform.Translate (0.0f, -Time.deltaTime, 0.0f);
			//fNewPosY -= 9.8f*Time.deltaTime;
		}
		DistanceKill();
	}
	
	void DistanceKill()
	{
		if (transform.position.x < gPlayer.transform.position.x - fAliveDistance || transform.position.x > gPlayer.transform.position.x + fAliveDistance)
		{
			Destroy (gameObject);
		}
	}
	
	// Update is called once per frame
	void Update () {
		Move (); //Move the sword guy in his own special way.
		if (fHealth < 0) //If the swordguy is dead...
		{
			Die (); //The swordguy should die.
		}
	}
}
