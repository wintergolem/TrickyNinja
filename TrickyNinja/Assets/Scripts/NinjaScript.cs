//Ninja Script
//Last edited by Deven Smith on 4/3/2014 11:28am
//Handles the Ninja that jumps up, fires a fan of bullets, and then goes away.

using UnityEngine;
using System.Collections;

public class NinjaScript : EnemyScript {

	public bool bChase;
	public int iBulletsToFire;
	public float fBulletWait;
	public float fWaitToFire;
	public float fBulletDelta;
	public float fBulletDeltaLimit;
	public float fInitBulletRot;
	public float fAddToBulletRotation;
	public float fNinjaSpeed;
	//public GameObject goAnimationRig;
	public GameObject gEnemyBullet;
	public GameObject gPlayer;
	public GameObject goVanishFX;
	public float fTimeAliveLimit;
	public float fDeathTimer = 3.0f;
	public float fKnockUpForce = 7500f;
	
	int iCurrentBulletsToFire;
	bool bneedtofire = true;
	bool bOnGround = false;
	float fTimeAlive;
	float fYVelocity;
	float fXVelocity;

	Animator aAnim;
	SoundScript soundManagerScript;

	// Use this for initialization
	void Start () {
		bGoingLeft = false;
		bAttacking = false;
		bIsNinja = true;
		bGrounded = false;
		fYVelocity = rigidbody.velocity.y;
		fXVelocity = rigidbody.velocity.x;
		aAnim = gCharacter.GetComponent<Animator>();
		gPlayer = GameObject.FindGameObjectWithTag("Player");
		iCurrentBulletsToFire = iBulletsToFire;
		Jump ();

		Component[] components = gCharacter.GetComponentsInChildren(typeof(Rigidbody));
		foreach(Component c in components)
		{
			(c as Rigidbody).isKinematic = true;
		}
		soundManagerScript = GameObject.FindGameObjectWithTag("SoundManager").GetComponent<SoundScript>();
	}
	
	void Jump()
	{
		gameObject.rigidbody.AddForce(new Vector3(0,550.0f,0), ForceMode.Force);
	}
	
	public override void Die()
	{
		PowerUpDropScript puds = gameObject.GetComponent<PowerUpDropScript>();

		if(puds != null)
		{
			puds.TryToSpawnPowerUp();
		}
		Vector3 smokePos = gRagdoll.transform.position;
		Instantiate(goVanishFX, smokePos, transform.rotation);
		Destroy (gameObject);
	}
	
	public override void Hurt(int aiDamage)
	{
		soundManagerScript.SendMessage ("NinjaHurt", SendMessageOptions.DontRequireReceiver);
		bInjured = true;
		fHealth -= aiDamage;
		if (fHealth < 0)
		{

			bInjured = false;
			bDie = true;
			SetUpRigidBody();
			//Invoke("Die", 1);
		}
		Instantiate(gPow, new Vector3(transform.position.x, transform.position.y, transform.position.z+1), gPow.transform.rotation);
	}

	void SetUpRigidBody()
	{
		collider.enabled = false;
		aAnim.enabled = false;

		Component[] components = gCharacter.GetComponentsInChildren(typeof(Rigidbody));
		foreach(Component c in components)
		{
			(c as Rigidbody).isKinematic = false;
		}

		GameObject root;
		root = gCharacter.transform.Find("katana_enemy:AnimationRig_V3_enemy:Character1_Reference/katana_enemy:AnimationRig_V3_enemy:Character1_Hips").gameObject;
		root.rigidbody.AddForce(Vector3.up * fKnockUpForce , ForceMode.Force);
		gameObject.SendMessage("DeathSound", SendMessageOptions.DontRequireReceiver);

		Invoke("Die", fDeathTimer);
	}
	
	void OnCollisionStay(Collision c)
	{
		if (c.gameObject.name != "Player")
		{
			bOnGround = true;
		}
	}
	
	public override void Move()
	{
		if (bOnGround == true)
		{
			if (bChase == true)
			{
				ChasePlayer(gPlayer, fNinjaSpeed*Time.deltaTime);
			}
			else if (bChase == false)
			{
				Destroy (gameObject);
			}
		}
		if (fTimeAlive >= fTimeAliveLimit)
		{
			Destroy(gameObject);
		}
		fTimeAlive += Time.deltaTime;
	}
	
	public override void Attack ()
	{

		if (fBulletWait >= fWaitToFire)
		{
			if (iCurrentBulletsToFire > 0)
			{
				if (fBulletDelta > fBulletDeltaLimit)
				{
					bAttacking = true;
					Instantiate (gEnemyBullet, gameObject.transform.position, Quaternion.Euler (0,0,fInitBulletRot));
					fBulletDelta = 0;
					fInitBulletRot += fAddToBulletRotation;
					iCurrentBulletsToFire--;
				}
			}
			if (iCurrentBulletsToFire <= 0)
			{
				iCurrentBulletsToFire = iBulletsToFire;
				fInitBulletRot = fAddToBulletRotation;
				fBulletDelta = 0;
				bneedtofire = false;
			}
			fBulletDelta += Time.deltaTime;
		}
		fBulletWait += Time.deltaTime;
	}
	
	// Update is called once per frame
	void Update () {
		fYVelocity = rigidbody.velocity.y;
		fXVelocity = rigidbody.velocity.x;

		if(fYVelocity > 0.0f)
		{
			bJumping = true;
		}
		if(fYVelocity < 0.0f)
		{
			bJumping = false;
		}

		if(!bDie)
		{
			if (gameObject.rigidbody.velocity.y > -1.0f && gameObject.rigidbody.velocity.y < 1.0f && bneedtofire == true)
			{
				bneedtofire = true;
			}
			if (bneedtofire == true)
			{
				Attack ();
			}
			else
				bAttacking = false;
			Move();
		}
		else
		{
			rigidbody.velocity = Vector3.zero;
		}

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
