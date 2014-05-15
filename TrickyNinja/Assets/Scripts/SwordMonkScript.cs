//Monk script
//Last edited by Deven Smith 4/2/2014
//Handles the monk enemy. The guy that runs up to you and then jumps before landing on you.

using UnityEngine;
using System.Collections;

public class SwordMonkScript : EnemyScript {

	public float fInitSpeed; //The set "normal" speed of the monk.
	public float fMaxSpeed; //The maximum speed the monk is capable of.
	public float fJumpHeight; //The maximum jump height that the monk will reach.
	public float fHorizontalKnockBack; //How far back the monk is knocked back when hit.
	public float fVerticalKnockBack; //How far up in the air the monk is knocked back when hit.
	public float fAliveDistance; //The farthest away the monk can be from the player before he is destroyed to free up computer resources.
	public float fAttackMoveOffset = 3.0f;
	public float fMoveAcceleration = 0.1f;
	
	//public GameObject goAttackBox;
	//public GameObject goJumpAttackBox;
	public GameObject goVanishFX;

	public NavMeshAgent nav;

	GameManager scrptInput;
	
	GameObject gPlayer;		//The active player object.
	GameObject root;
	float fSpeed; //The current speed of the monk.
	//float fVerticalSpeed; //The vertical speed of the monk when he begins his jump.
	float fYVelocity;
	float fXVelocity;
	public float fGroundDistance = 1.05f;
	//bool bInAir; //Is the monk in the air?
	bool bGrounded2;
	bool bBeenHit;
	public float fDestroyTimer = 2.0f;
	public float fKnockUpForce = 250f;
	bool bDead = false;//used to not trigger animator but tell him he is dead
	Vector3 vDeathPos;

	Animator aAnim;

	LayerMask lmGroundLayer;
	public LayerMask sGroundLayer;

	//testing
	void Awake()
	{

		scrptInput = GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
		FindActivePlayer();

		bLeapIn = Random.Range(0,2) == 1 ? true : false;
		if( bLeapIn)
			nav.enabled = false;
		else
			nav.SetDestination(gPlayer.transform.position);
		lmGroundLayer = sGroundLayer;//LayerMask.NameToLayer(sGroundLayer);
		fYVelocity = rigidbody.velocity.y;
		fXVelocity = rigidbody.velocity.x;
		
		aAnim = gCharacter.GetComponent<Animator>();

		fSpeed = fInitSpeed; //Set the current speed of the monk to the "normal", initial speed.
		//fVerticalSpeed = fJumpHeight; //Set the vertical speed of the monk to its jump height.
		
		

		
		bGoingLeft = true;
		bAttacking = true;
		bIsMonk = true;
		bIsSwordGuy = false;
		//bInAir = false; //The monk does not start in the air.
		bGrounded = false;
		bGrounded2 = true;
		bBeenHit = false;

		bLeapIn = false;//==========================================================================================================Dont Leave this as always true
		
		Component[] components = gCharacter.GetComponentsInChildren(typeof(Rigidbody));
		foreach(Component c in components)
		{
			(c as Rigidbody).isKinematic = true;
		}
	}

	// Use this for initialization
	void Start () {
		lmGroundLayer = sGroundLayer;//LayerMask.NameToLayer(sGroundLayer);
		fYVelocity = rigidbody.velocity.y;
		fXVelocity = rigidbody.velocity.x;

		aAnim = gCharacter.GetComponent<Animator>();

		fSpeed = fInitSpeed; //Set the current speed of the monk to the "normal", initial speed.
		//fVerticalSpeed = fJumpHeight; //Set the vertical speed of the monk to its jump height.

		
		scrptInput = GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
		FindActivePlayer();

		bGoingLeft = true;
		bAttacking = true;
		//bInAir = false; //The monk does not start in the air.
		bGrounded = false;
		bGrounded2 = true;
		bBeenHit = false;

		Component[] components = gCharacter.GetComponentsInChildren(typeof(Rigidbody));
		foreach(Component c in components)
		{
			(c as Rigidbody).isKinematic = true;
		}
	}
	
	//Derived from the "Move" function of "EntityScript". It tells the enemies how to move.
	public override void Move()
	{
		MonkChasePlayer (); //Tell the monk to chase the player using the monk's own ChasePlayer method.
		MonkGravity(); //The monk has its own special gravity command.
		CustomAttack ();
	}
	
	//Derived from the "Die" function of "EntityScript".
	public override void Die()
	{
		PowerUpDropScript puds = gameObject.GetComponent<PowerUpDropScript>();
		if(puds != null)
		{
			puds.TryToSpawnPowerUp();
		}
		
		Vector3 smokePos = gRagdoll.transform.position;
		Instantiate(goVanishFX, smokePos, transform.rotation);
		Destroy (gameObject); //Destroy the current monk.
	}
	
	//The method that determines what happens when the player gets hurt.
	public override void Hurt(int aiDamage)
	{
		if(!bIncorporeal && !bLeapIn)
		{
			fHealth -= aiDamage;
			bInjured = true;

			Vector3 positionInfo = gPlayer.transform.position - transform.position;

			rigidbody.velocity = Vector3.zero;

			if (positionInfo.x < 0.0f)
			{
				rigidbody.velocity = new Vector3(fHorizontalKnockBack, fVerticalKnockBack, 0);
			}
			if (positionInfo.x > 0.0f)
			{
				rigidbody.velocity = new Vector3(-fHorizontalKnockBack, fVerticalKnockBack, 0);
			}
			Instantiate(gPow, new Vector3(transform.position.x, transform.position.y, transform.position.z+1), gPow.transform.rotation);

			bIncorporeal = true;
		}
	}
	
	//This keeps the monk falling back down to the ground after he jumps to attack the player.
	void MonkGravity()
	{
		RaycastHit hit1;
		if (Physics.Raycast(rigidbody.position, -transform.up, out hit1, fGroundDistance, lmGroundLayer.value) && !bLeapIn)
		{
			if (hit1.collider.tag == "Ground" )//|| hit1.collider.tag == "Enemy")
			{
				nav.enabled = true;
				bGrounded = true;
				bGrounded2 = true;
				bIncorporeal = false;
				bInjured = false;
				bJumping = false;
				transform.position = new Vector3(transform.position.x, hit1.point.y + fGroundDistance, transform.position.z);
			}

		}
//		else
//		{
//			bGrounded = false;
//			bGrounded2 = true;
//		}
//
//		if(bGrounded)
//		{
//			rigidbody.useGravity = false;
//			rigidbody.velocity = new Vector3(rigidbody.velocity.x, 0.0f, 0.0f);
//		}
//		else 
//			rigidbody.useGravity = true;

		DistanceKill();
	}
	
	void DistanceKill()
	{
		if (transform.position.x < gPlayer.transform.position.x - fAliveDistance || transform.position.x > gPlayer.transform.position.x + fAliveDistance)
		{

			Destroy (gameObject);
		}
	}
	
	void CustomAttack()
	{
		if (transform.position.x < gPlayer.transform.position.x + 1.05f && transform.position.x > gPlayer.transform.position.x - 1.05f 
		    && transform.position.y < gPlayer.transform.position.y)
		{
			nav.enabled = false;
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
			//nav.enabled = false;
			fSpeed = fInitSpeed;

			if (bGrounded2 == false)
			{
				fSpeed = 0.0f;
			}
		}
		bIncorporeal = false;
	}
	
	//The special command that tells the monk how to chase the player.
	void MonkChasePlayer()
	{	
//		if (bGrounded == true)
//		{
//			bJumping = false;

			//nav.enabled = true;
		if( bGrounded )
		{
			nav.SetDestination( gPlayer.transform.position );
			if( transform.rotation.eulerAngles.y > 90 )
				bGoingLeft = false;
			else 
				bGoingLeft = true;
		}

	}
	
	// Update is called once per frame
	void Update () 
	{
		if(!bDead)
		{
			if(!bLeapIn)
			{
				FindActivePlayer();

				/*if(fYVelocity != 0.0f)
				{
					goJumpAttackBox.SetActive(true);
					goAttackBox.SetActive(false);
				}
				else
				{
					goJumpAttackBox.SetActive(false);
					goAttackBox.SetActive(true);
				}*/
				if(!bDie)
					Move (); //The monk's move method.
				else
					rigidbody.velocity = new Vector3(0,0,0);

				if (fHealth <= 0 && !bDie)
				{
					bInjured = false;
					bDie = false;
					bDead = true;
					vDeathPos = transform.position;
					collider.enabled = false;

					SetUpRigidBody();
				}

				if(rigidbody.velocity.y > 0)
					bJumping = true;
				else 
					bJumping = false;
				fYVelocity = rigidbody.velocity.y;
			}
			else
			{
				rigidbody.useGravity = false;
				int defaultState = Animator.StringToHash("Base Layer.Default");
				int leapLeft = Animator.StringToHash("Base Layer.Leap In Left");
				int leapRight = Animator.StringToHash("Base Layer.Leap In Right");
				int runRight = Animator.StringToHash("Base Layer.Run Right");
				int check = aAnim.GetCurrentAnimatorStateInfo(0).nameHash;
				string layer = aAnim.GetLayerName(0);


				//if(!aAnim.GetCurrentAnimatorStateInfo(0).IsName("Leap In Left") && !aAnim.GetCurrentAnimatorStateInfo(0).IsName("Leap In Right"))
				if(check != leapLeft && check != leapRight && check != defaultState)
				{
					//Debug.Log(aAnim.GetCurrentAnimatorStateInfo(0).nameHash);
					bLeapIn = false;
					rigidbody.useGravity = true;
				}
			}

			SendAnimatorBools();
		}
		else
		{
			transform.position = vDeathPos;
			rigidbody.useGravity = false;
			rigidbody.velocity = Vector3.zero;
		}
	}

	void SetUpRigidBody()
	{
		//goAttackBox.SetActive(false);
		//goJumpAttackBox.SetActive(false);
		aAnim.enabled = false;

		Component[] components = gCharacter.GetComponentsInChildren(typeof(Rigidbody));
		foreach(Component c in components)
		{
			(c as Rigidbody).isKinematic = false;
		}
		
		root = gCharacter.transform.Find("katana_enemy:AnimationRig_V3_enemy:Character1_Reference/katana_enemy:AnimationRig_V3_enemy:Character1_Hips").gameObject;
		root.rigidbody.AddForce(Vector3.up * fKnockUpForce , ForceMode.Impulse);
		root.rigidbody.AddRelativeTorque(Vector3.up *2500,ForceMode.Impulse);
		gameObject.SendMessage("DeathSound", SendMessageOptions.DontRequireReceiver);
		Invoke ("Die", fDestroyTimer);
	}

	void Twist()
	{
		root.rigidbody.AddForce(transform.right * 500, ForceMode.Force);
	}
	void CancelTwist()
	{
		CancelInvoke("Twist");
	}

	void FindActivePlayer()
	{
		gPlayer = scrptInput.GetActivePlayer();
	}

	public void VanishBack()
	{
		Instantiate(goVanishFX, transform.position, transform.rotation);
		if(transform.position.x < gPlayer.transform.position.x)
		{
			nav.Warp( new Vector3(transform.position.x - fAttackMoveOffset, transform.position.y, transform.position.z) );
		}
		else
		{
			nav.Warp( new Vector3(transform.position.x + fAttackMoveOffset, transform.position.y, transform.position.z) );
		}
		rigidbody.velocity = Vector3.zero;
		Instantiate(goVanishFX, transform.position, transform.rotation);
	}

	void SendAnimatorBools()
	{
		aAnim.SetBool("bLeapIn", bLeapIn);
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
