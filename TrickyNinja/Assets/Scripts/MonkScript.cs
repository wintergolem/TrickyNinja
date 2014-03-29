//Monk script
//Last edited by Jason Ege on 03/20/2014 @ 9:53am
//Handles the monk enemy. The guy that runs up to you and then jumps before landing on you.

using UnityEngine;
using System.Collections;

public class MonkScript : EnemyScript {

	public float fInitSpeed; //The set "normal" speed of the monk.
	public float fMaxSpeed; //The maximum speed the monk is capable of.
	public float fJumpHeight; //The maximum jump height that the monk will reach.
	public float fHorizontalKnockBack; //How far back the monk is knocked back when hit.
	public float fVerticalKnockBack; //How far up in the air the monk is knocked back when hit.
	public float fAliveDistance; //The farthest away the monk can be from the player before he is destroyed to free up computer resources.

	public GameObject goAnimationRig;

	InputCharContScript scrptInput;
	
	GameObject gPlayer;		//The active player object.
	GameObject[] agPlayer;	//The player array used to find the player.
	float fSpeed; //The current speed of the monk.
	float fVerticalSpeed; //The vertical speed of the monk when he begins his jump.
	float fYVelocity;
	bool bInAir; //Is the monk in the air?
	//bool bGrounded;
	bool bGrounded2;
	bool bBeenHit;

	Animator aAnim;

	// Use this for initialization
	void Start () {
		fYVelocity = rigidbody.velocity.y;
		aAnim = goAnimationRig.GetComponent<Animator>();
		gPlayer = GameObject.FindGameObjectWithTag ("Player"); //The definition of the player game object is any object tagged as a player.
		fSpeed = fInitSpeed; //Set the current speed of the monk to the "normal", initial speed.
		fVerticalSpeed = fJumpHeight; //Set the vertical speed of the monk to its jump height.

		
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


		bGoingLeft = true;
		bAttacking = true;
		bIsMonk = true;
		bInAir = false; //The monk does not start in the air.
		bGrounded = false;
		bGrounded2 = true;
		bBeenHit = false;
	}
	
	//Derived from the "Move" function of "EntityScript". It tells the enemies how to move.
	public override void Move()
	{
		MonkChasePlayer (); //Tell the monk to chase the player using the monk's own ChasePlayer method.
		MonkGravity(); //The monk has its own special gravity command.
		CustomAttack ();
		if (bBeenHit)
		{
			bIncorporeal = true;
		}
	}
	
	//Derived from the "Die" function of "EntityScript".
	public override void Die()
	{
		Destroy (gameObject); //Destroy the current monk.
	}
	
	//Derived from the "Hurt" function of "EntityScript". It handles damage that an entity takes.
	//"Hurt" is indirectly called by a broadcasted SendMessage command.
	//It takes a specified amount of damage that the enemy should take (typically 1).
	/*public override void Hurt(int aiDamage)
	{
		fHealth -= aiDamage; //Damage the enemy by the amount specified.
		if (fHealth <= 0) //If health is equal to or less than 0...
		{
			Die (); //Tell the monk to go die in a hole.
		}
	}*/
	
	//The method that determines what happens when the player gets hurt.
	public override void Hurt(int aiDamage)
	{
		
			RaycastHit hit2;
			if (Physics.Raycast (transform.position, -transform.up, out hit2, 1.0f))
			{
				if (hit2.collider.tag == "Ground" || bGrounded2 == false)
				{
					if (EnemyIsRightOfPlayer(gPlayer))
					{
						if (rigidbody.velocity.x < 0.0f)
						{
							rigidbody.velocity = new Vector3(fHorizontalKnockBack, fVerticalKnockBack, rigidbody.velocity.z);
						}
					}
					else if (!EnemyIsRightOfPlayer(gPlayer))
					{
						if (rigidbody.velocity.x > 0.0f)
						{
							rigidbody.velocity = new Vector3(-fHorizontalKnockBack, fVerticalKnockBack, rigidbody.velocity.z);
						}
					}
					fHealth -= aiDamage;
				}
				Instantiate(gPow, new Vector3(transform.position.x, transform.position.y, transform.position.z+1), gPow.transform.rotation);
			}
			bIncorporeal = true;
		
		bBeenHit = true;
	}
	
	//This keeps the monk falling back down to the ground after he jumps to attack the player.
	void MonkGravity()
	{
		RaycastHit hit1;
		if (Physics.Raycast(rigidbody.position, -transform.up, out hit1, 1.04f) )
		{
			if (hit1.collider.tag == "Ground" || hit1.collider.tag == "Enemy")
			{
				bGrounded = true;
				bGrounded2 = true;
				bIncorporeal = false;
				bJumping = false;
			}
			else
			{
				bGrounded = false;
				bGrounded2 = true;
			}
		}
		if (bGrounded == true && transform.position.y <= 1.02f /*&& bBeenHit == false*/)
		{
			transform.position = new Vector3(transform.position.x, 1.02f, transform.position.z);
		}



		if(bGrounded)
		{
			rigidbody.useGravity = false;
			rigidbody.velocity = new Vector3(rigidbody.velocity.x, 0.0f, 0.0f);
		}
		else 
			rigidbody.useGravity = true;

		DistanceKill();
		//transform.Translate (0.0f,fVerticalSpeed*Time.deltaTime,0.0f); //Transalate the monk so that he actually moves.
		//fVerticalSpeed -=  20.0f*Time.deltaTime; //Subtract from the monk's vertical speed so that he eventually comes back down after he goes up.
	}
	
	void DistanceKill()
	{
		if (transform.position.x < gPlayer.transform.position.x - fAliveDistance || transform.position.x > gPlayer.transform.position.x + fAliveDistance)
		{
			Destroy (gameObject);
		}
	}
	
	//This pre-defined method handles what happens when the monk stays collided with something.
	/*void OnCollisionStay(Collision c)
	{
		if (c.gameObject.tag == "Ground") //If it has collided with an object tagged as ground...
		{
			//bInAir = false; //The monk is not longer set as in the air.
		}
	}*/
	
	void CustomAttack()
	{
		if (transform.position.x < gPlayer.transform.position.x + 1.05f && transform.position.x > gPlayer.transform.position.x - 1.05f && transform.position.y < 1.05f)
		{
			bIncorporeal = false;
			rigidbody.AddForce(new Vector3(0.0f, 700.0f, 0.0f), ForceMode.Force);
			bGrounded = false;
			bGrounded2 = false;
			if (bGrounded == false)
			{
				fSpeed = 0.0f;
				rigidbody.velocity = new Vector3(0.0f, 0.0f, 0.0f);
			}
			else if (bGrounded2 == true)
			{
				fSpeed = fInitSpeed;
			}
		}
		else if (transform.position.x > gPlayer.transform.position.x + 1.05f || transform.position.x < gPlayer.transform.position.x - 1.05f)
		{
			if (rigidbody.position.y < 1.05f)
			{
				fSpeed = fInitSpeed;
			}
			else if (bGrounded2 == false)
			{
				fSpeed = 0.0f;
			}
		}
		bIncorporeal = false;
	}
	
	//The special command that tells the monk how to chase the player.
	void MonkChasePlayer()
	{	
		if (bGrounded == true)
		{
			bJumping = false;

			if (Mathf.Abs (rigidbody.velocity.x*Time.deltaTime) < Mathf.Abs (fMaxSpeed*Time.deltaTime))
			{
				if (gPlayer.rigidbody.position.x > this.rigidbody.position.x)
				{
					if(bGoingLeft == true)
						transform.Rotate(new Vector3(0.0f, 180.0f, 0.0f));

					bGoingLeft = false;
					rigidbody.AddForce (fSpeed*Time.deltaTime, 0.0f, 0.0f, ForceMode.Force);
				}
				if (gPlayer.rigidbody.position.x < this.rigidbody.position.x)
				{
					if(bGoingLeft == false)
						transform.Rotate(new Vector3(0.0f, 180.0f, 0.0f));

					bGoingLeft = true;
					rigidbody.AddForce (-fSpeed*Time.deltaTime, 0.0f, 0.0f, ForceMode.Force);
				}
			}
		}
		/*if (CollidingWithPlayer (gPlayer) && bInAir == false) //If the monk is almost colliding with player (defined in "EnemyScript")...
		{
			fSpeed = 0.0f; //Set the horizontal speed of the monk to 0 so it no longer will chase the player back and forth while in the air.
			fVerticalSpeed = fJumpHeight; //Set its vertical speed to the specified jump amount so that it shoots up in the air.
			bInAir = true; //Tell the monk that he is in the air.
		}
		else if (!CollidingWithPlayer (gPlayer) && bInAir == false) //If the monk is not colliding with the player and he is in the air.
		{
			fSpeed = fInitSpeed; //The horizontal speed is the "normal" initial speed.
			ChasePlayer(gPlayer, fSpeed*Time.deltaTime); //Tell the monk to chase the player like a normal enemy would (defined in "EnemyScript").
		}
		if (bInAir == false) //If the monk is not in the air (and it doesn't matter whether he is colliding with the player or not).
		{
			transform.position = new Vector3(transform.position.x, 1.5f, transform.position.z); //Tell the monk to stay at vertical position 1.5.
			fVerticalSpeed = 0; //Tell the monk to not jump.
		}*/
	}
	
	// Update is called once per frame
	void Update () {
		Move (); //The monk's move method.
		if (fHealth <= 0)
		{
			Die ();
		}

		if(rigidbody.velocity.y > 0)
			bJumping = true;
		else 
			bJumping = false;
		fYVelocity = rigidbody.velocity.y;

		SendAnimatorBools();
	}

	void SendAnimatorBools()
	{
		aAnim.SetFloat("fYVelocity", fYVelocity);
		aAnim.SetBool("bDie", bDie);
		aAnim.SetBool("bFacingUp", bFacingUp);
		aAnim.SetBool("bAttacking", bAttacking);
		aAnim.SetBool("bJumping", bJumping);
		aAnim.SetBool("bGrounded", bGrounded);
		aAnim.SetBool("bGoingLeft", bGoingLeft);
		aAnim.SetBool("bInjured", bInjured);
		aAnim.SetBool("bIsSwordGuy", bIsSwordGuy);
		aAnim.SetBool("bIsMonk", bIsMonk);
		aAnim.SetBool("bIsNinja", bIsNinja);
	}
}
