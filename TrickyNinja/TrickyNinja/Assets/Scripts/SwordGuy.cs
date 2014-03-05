using UnityEngine;
using System.Collections;

public class SwordGuy : EnemyScript {

	public float fSpeed; //The speed of the SwordGuy, defined in the inspector interface.

	GameObject gPlayer;	//The player game object.
	bool bGoingUp; //Is the swordguy going up?
	float fKnockBackArc; //The arc by which the sword guy flies through the air when he gets knocked back.
	float fDeltaKnockBack; //The change in knockback arc.

	// Use this for initialization
	void Start () {
		gPlayer = GameObject.FindGameObjectWithTag("Player"); //The player is any object tagged as the player.
	}
	
	//The Die method, derived from the "EntityScript".
	public override void Die()
	{
		Destroy (gameObject); //Destroy the local object that this script it attached to.
	}
	
	//The method that determines what happens when the player gets hurt.
	public override void Hurt(int aiDamage)
	{
		if (bGoingUp == true) //If the swordguy is moving up...
		{
			//He is immune to damage.
		}
		else if (bGoingUp == false) //If the sword guy is moving back down...
		{
			bGoingUp = true;
			fHealth -= aiDamage; //Damage the local game object.
		}
	}
	
	//The function that determines how the swordguy should move, derived from the "EntityScript" class.
	public override void Move ()
	{
		if (bGoingUp == true) //If the swordguy is moving up...
		{
			fDeltaKnockBack += Time.deltaTime*20.0f;
			fKnockBackArc = 120*fDeltaKnockBack;
			if (transform.position.x > gPlayer.transform.position.x) //If the enemy is to the right of the player
			{
				transform.Translate (-transform.right.z*30.0f*Time.deltaTime, fKnockBackArc, 0.0f, Space.World); //Move him away from the player a little.
			}
			else if (transform.position.x < gPlayer.transform.position.x) //If the enemy is to the left of the player
			{
				transform.Translate (transform.right.x*30.0f*Time.deltaTime, fKnockBackArc, 0.0f, Space.World); //Move him away from the player a little.
			}
			//transform.position = new Vector3(transform.position.x, transform.position.y, 25.0f); //Set his Z position to stay at 25.
			if (transform.position.y > vSpawnPoint.y+1.75f) //If the swordguy is above his spawn point.
			{
				bGoingUp = false; //He is no longer going up.
			}
		}
		if (transform.position.y > vSpawnPoint.y && bGoingUp == false) //If the swordguy is not going up, but he is still above his spawn point where he started...
		{
			transform.Translate (0.0f, -fKnockBackArc, 0.0f);
			//transform.Translate (0.0f, -6.0f * Time.deltaTime, 0.0f); //Move him down slightly.
		}
		else if (transform.position.y > vSpawnPoint.y && bGoingUp == true)
		{
			fKnockBackArc = -100;
			fDeltaKnockBack = 20;
		}
		if (transform.position.y < vSpawnPoint.y + 0.02f && bGoingUp == false) //If the sword guy is not in the air and he is below a spot really close to his spawn point...
		{
			ChasePlayer (gPlayer, fSpeed); //The swordguy should chase the player.
		}
		//transform.Translate (0.0f, Mathf.Sin (-fKnockBackArc), 0.0f);
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
