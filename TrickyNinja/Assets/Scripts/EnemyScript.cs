//Enemy Script
/// Last Edit - 3-28-2014 10:48 Deven - Moved variable gPow into the Entity Class
//Handles things that all enemies do. All enemies derive from this class, and this class
//derives from the Entity Class.

using UnityEngine;
using System.Collections;

public class EnemyScript : EntityScript {

	public GameObject gCharacter;
	public GameObject gRagdoll;
	
	public bool bGoingLeft;
	public bool bGrounded;
	public bool bAttacking;
	public bool bJumping;
	public bool bInjured; //Knockback
	public bool bDie;
	public bool bFacingUp;
	public bool bIsSwordGuy;
	public bool bIsMonk;
	public bool bIsNinja;
	public bool bLeapIn;

	// Use this for initialization
	void Start () {
		gCharacter.animation.Play("Idle");
	}

	//The method that detects if the enemy is to the left or right of the player.
	//Returns true if the player is to the right, left is the player is left.
	public bool EnemyIsRightOfPlayer(GameObject gPlayer)
	{
		if (transform.position.x > gPlayer.transform.position.x)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	//The method that tells the enemy how to chase the playerl, if an enemy should have to do so (which most do).
	public void ChasePlayer(GameObject gPlayer, float fChaseSpeed)
	{
		if (gPlayer.transform.position.x < transform.position.x) //If the player is to the left of the enemy...
		{
			transform.rotation = Quaternion.Euler (0.0f, 90.0f, 0.0f); //Enemy should rotate so it will go left.
		}
		else if (gPlayer.transform.position.x > transform.position.x) //If the player is to the right of the enemy...
		{
			transform.rotation = Quaternion.Euler(0.0f,180.0f,0.0f); //Enemy should rotate so it will go right.
		}
		transform.Translate (transform.right*fChaseSpeed*Time.deltaTime);	//Move the enemy in the direction it has been rotated so that it
															//It will actually move toward the player instead of just staring at him.
	}
	
	//This method checks if an enemy is within the horizontal bounds of the player, regardless of whether the y's actually meet or not.
	//This is handy with the monk, for example, where he follows the player but does not attack until he is close, but not fully colliding yet.
	public bool CollidingWithPlayer(GameObject gPlayer)
	{
		//If the enemy is within a two-pixel range of the player's center. (This is better practice than checking two floats for equality).
		if (gPlayer.transform.position.x+1.0f > this.gameObject.transform.position.x && gPlayer.transform.position.x-1.0f < this.gameObject.transform.position.x)
		{
			return true; //This function returns true, saying that the enemy is close to the player's x position.
		}
		else //If the enemy is not within the player's vertical bounds...
		{
			return false; //This function return false, saying that the enemy is not within the player's vertical bounds.
		}
//		return false; //By default, this function returns false. This makes C# happy, plus it's good practice in case something unexpected happens at runtime.
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
