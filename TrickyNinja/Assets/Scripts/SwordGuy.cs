//SwordGuy Script by Jason Ege
//Last edited on March 14, 2014

using UnityEngine;
using System.Collections;

public class SwordGuy : EnemyScript {

	public float fGroundRayDistance;
	public float fSpeed; //The speed of the SwordGuy, defined in the inspector interface.
	public float fMaxSpeed; //The maximum speed allowed for the sword guy to accelerate to.
	public float fHorizontalKnockBack; //The amount of force the sword guy gets thrown back when he is hit.
	public float fVerticalKnockBack; //The amount of force the sword guy gets thrown into the air when he is hit.
	public Vector3 vOffset; //The spawning offset of the swordguy
	public float fHitTimer;
	public float fAttackDistance; //How far the swordguy raycasts forward while looking for the player
	//public bool bAttacking;
	public GameObject gSwordPrefab; //The sword prefab for when the enemy swings the sword.
	
	float fCurHitTimer;
	float fAttackingLength;
	//bool bGrounded;
	bool bBeenHit;
	bool bAttacked;
	
	InputCharContScript scrptInput;

	GameObject gPlayer;		//The active player object.
	GameObject[] agPlayer;	//The player array used to find the player.
	public float fAliveDistance; //How far away from the player the enemy has to be before he is destroyed to free up resources.

	// Use this for initialization
	void Start () {
		scrptInput = CameraScriptInGame.GrabMainCamera().transform.parent.GetComponent<InputCharContScript>();
		//agPlayer = GameObject.FindGameObjectsWithTag("Player"); //The player is any object tagged as the player.
		for(int i = 0; i < scrptInput.agPlayer.Length; i++)
		{
			PlayerScriptDeven playerScript;
			playerScript = scrptInput.agPlayer[i].GetComponent<PlayerScriptDeven>();
			if(!playerScript.bIncorporeal)
			{
				gPlayer = scrptInput.agPlayer[i];
			}
		}
		if (transform.position.x > gPlayer.transform.position.x)
		{
			fSpeed = -fSpeed;
			bGoingLeft = false;
		}
		else
		{
			bGoingLeft = true;
		}
		bGrounded = false;
		bBeenHit = false;
		bAttacked = false;
		fAttackingLength = 2.0f;
	}
	
	//The Die method, derived from the "EntityScript".
	public override void Die()
	{
		Destroy (gameObject); //Destroy the local object that this script it attached to.
	}
	
	//The method that determines what happens when the player gets hurt.
	public override void Hurt(int aiDamage)
	{
		RaycastHit hit2;
		if (Physics.Raycast (transform.position, -transform.up, out hit2, fGroundRayDistance))
		{
			if (hit2.collider.tag == "Ground")
			{
				if (EnemyIsRightOfPlayer(gPlayer))
				{
					if (rigidbody.velocity.x < 0.0f)
					{
						rigidbody.velocity = new Vector3(fHorizontalKnockBack, fVerticalKnockBack, rigidbody.velocity.z);
						fHealth -=  aiDamage;
					}
				}
				else if (!EnemyIsRightOfPlayer(gPlayer))
				{
					if (rigidbody.velocity.x > 0.0f)
					{
						rigidbody.velocity = new Vector3(-fHorizontalKnockBack, fVerticalKnockBack, rigidbody.velocity.z);
						fHealth -= aiDamage;
					}
				}
				Instantiate(gPow, new Vector3(transform.position.x, transform.position.y, transform.position.z+1), gPow.transform.rotation);
				bGrounded = false;
				fCurHitTimer = fHitTimer;
			}
		}
		bBeenHit = true;
	}
	//The function that determines how the swordguy should move, derived from the "EntityScript" class.
	public override void Move ()
	{
		RaycastHit hit;
		if (Physics.Raycast (transform.position, -transform.up, out hit, fGroundRayDistance))
		{
			if (hit.collider.tag == "Ground" || hit.collider.tag == "Enemy")
			{
				bGrounded = true;
				if (rigidbody.velocity.x >= fMaxSpeed*Time.deltaTime || rigidbody.velocity.x <= -fMaxSpeed*Time.deltaTime)
				{
				}
				else
				{
					rigidbody.AddForce(new Vector3(fSpeed*Time.deltaTime, 0.0f, 0.0f), ForceMode.Force);
				}
			}
			else
			{
				bGrounded = false;
			}
		/*if (bGrounded == true && transform.position.y <= 1.02f)
		{
			transform.position = new Vector3(transform.position.x, 1.02f, transform.position.z);
		}*/
		}
		else 
		{
			bGrounded = false;
		}
		/*if (rigidbody.velocity.y > -120.0f * Time.deltaTime)
		{
			rigidbody.AddForce (new Vector3(0.0f, -120.0f * Time.deltaTime, 0.0f));
		}*/
		if (!bGrounded )//|| ( hit.collider.tag != "Ground" && hit.collider.tag != "Enemy"))
		{
			rigidbody.AddForce (new Vector3(0.0f, Mathf.Abs(9.8f * fSpeed *  Time.deltaTime) * -1.0f, 0.0f));
			//transform.Translate (0.0f, -98.0f * Time.deltaTime, 0.0f);
		}
		else if(bGrounded && !bBeenHit)
		{
			rigidbody.velocity = new Vector3(rigidbody.velocity.x, 0, 0);
		}
		else if(bGrounded && bBeenHit)
			rigidbody.velocity = new Vector3(rigidbody.velocity.x, rigidbody.velocity.y, 0);

		Vector3 vCastDirection;
		vCastDirection = transform.forward;
		if (bGoingLeft)
		{
			vCastDirection = transform.forward;
		}
		else if (!bGoingLeft)
		{
			vCastDirection = -transform.forward;
		}
		if (Physics.Raycast (transform.position, vCastDirection, out hit, fAttackDistance))
		{
			if (hit.collider.gameObject == gPlayer.gameObject )//&& bGrounded && !bAttacked)
			{
				//renderer.animation.Play();
				rigidbody.velocity = new Vector3(0.0f, 0.0f, 0.0f);
				bAttacking = true;
			}
		}
		if (bAttacking)
		{
			if (!bAttacked)
			{
			//print ("Attacked");
				bAttacked = true;
				fAttackingLength -= Time.deltaTime;
				//gSwordPrefab.gameObject.SetActive(true);
				//gSwordPrefab.GetComponent<MeleeAttackScript>().sTagToHurt = "Player";
				gSwordPrefab.SendMessage("StartSwing", 0, SendMessageOptions.RequireReceiver);
				//Instantiate(gSwordPrefab, transform.position+vCastDirection, Quaternion.Euler ((-transform.up*90.0f)+vCastDirection));
				//if (fAttackingLength < 0.0f)
				//{
					bAttacking = false;
				//}
				/*if (!renderer.animation.isPlaying)
				{
					bAttacking = false;
				}*/
			}
		}
		if (!bAttacking)
		{
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
		if(fCurHitTimer > 0.0f)
			fCurHitTimer -= Time.deltaTime;
		else
		{
			fCurHitTimer = 0.0f;
			bBeenHit = false;
		}
			
	
		Move (); //Move the sword guy in his own special way.
		if (fHealth <= 0) //If the swordguy is dead...
		{
			Die (); //The swordguy should die.
		}
	}
}
