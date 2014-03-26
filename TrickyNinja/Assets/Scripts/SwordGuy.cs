//SwordGuy Script by Jason Ege
//Last edited on March 14, 2014

using UnityEngine;
using System.Collections;

public class SwordGuy : EnemyScript {

	public float fSpeed; //The speed of the SwordGuy, defined in the inspector interface.
	public float fMaxSpeed; //The maximum speed allowed for the sword guy to accelerate to.
	public float fHorizontalKnockBack; //The amount of force the sword guy gets thrown back when he is hit.
	public float fVerticalKnockBack; //The amount of force the sword guy gets thrown into the air when he is hit.
	public Vector3 vOffset; //The spawning offset of the swordguy
	
	bool bGrounded;
	bool bBeenHit;
	
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
		}
		bGrounded = false;
		bBeenHit = false;
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
		if (Physics.Raycast (transform.position, -transform.up, out hit2, 1.5f))
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
			}
		}
		bBeenHit = true;
	}
	//The function that determines how the swordguy should move, derived from the "EntityScript" class.
	public override void Move ()
	{
		RaycastHit hit;
		if (Physics.Raycast (transform.position, -transform.up, out hit, 1.5f))
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
		}
		/*if (bGrounded == true && transform.position.y <= 1.02f)
		{
			transform.position = new Vector3(transform.position.x, 1.02f, transform.position.z);
		}*/
		if (!bGrounded)
		{
			transform.Translate (0.0f, -9.8f * Time.deltaTime, 0.0f);
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
		if (fHealth <= 0) //If the swordguy is dead...
		{
			Die (); //The swordguy should die.
		}
	}
}
