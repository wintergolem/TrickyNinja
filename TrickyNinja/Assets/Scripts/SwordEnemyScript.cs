using UnityEngine;
using System.Collections;

public class SwordEnemyScript : EnemyScript 
{
	Animator aAnim;
	GameObject gPlayer;
	public float fMoveSpeed = 5.0f;
	public float fAttackRange = 1.0f;
	RaycastHit rhRayhit;
	GameManager scrptInput;
	public GameObject goVanishFX;
	public float fDeathTime = 3.0f;
	LayerMask lmPlayerLayer;
	public GameObject gAttackBox;
	public float fAttackMoveOffset = 10.0f;
	public NavMeshAgent nav;


	// Use this for initialization
	void Start() 
	{
		lmPlayerLayer = LayerMask.NameToLayer("Player");
		//Debug.Log("made it to start");
		bGrounded = true;
		bIsSwordGuy = true;
		bGoingLeft = false;

		aAnim = gCharacter.GetComponent<Animator>();
		scrptInput = GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
		FindActivePlayer();

		Component[] components = gCharacter.GetComponentsInChildren(typeof(Rigidbody));
		foreach(Component c in components)
		{
			(c as Rigidbody).isKinematic = true;
		}
		nav.SetDestination(gPlayer.transform.position);
	}
	
	// Update is called once per frame
	void Update () 
	{
		if(!bIncorporeal)
		{
			Debug.DrawLine(transform.position + transform.up, (transform.forward * fAttackRange) + transform.position + transform.up,Color.red);
			if(Physics.Raycast(transform.position + transform.up, transform.forward ,out rhRayhit, fAttackRange, 1<<lmPlayerLayer.value))
			{
				nav.enabled = false;
				//print ("hit");
				if(rhRayhit.transform.tag == "Player")
				{
					//print ("player hit");
					bAttacking = true;
					gAttackBox.collider.enabled = true;
				}
				else
					bAttacking = false;
			}
			else
				bAttacking = false;

			if(!bAttacking)
			{
				if( !nav.enabled )
					nav.enabled = true;
				nav.SetDestination(gPlayer.transform.position);
				gAttackBox.collider.enabled = false;
				if(gPlayer.transform.position.x > transform.position.x)
				{
					//transform.Translate(-transform.right * fMoveSpeed * Time.deltaTime, Space.World);

					if(!bGoingLeft)
					{
						bGoingLeft = true;
						//transform.eulerAngles = new Vector3(0, 180, 0);
					}
				}
				else
				{
					//transform.Translate(-transform.right * fMoveSpeed * Time.deltaTime, Space.World);
					
					if(bGoingLeft)
					{
						bGoingLeft = false;
						//transform.eulerAngles = new Vector3(0, 0, 0);
					}
				}
			}
		}
		else
		{
			fDeathTime -= Time.deltaTime;
			if(fDeathTime <= 0)
			{
				PowerUpDropScript puds = gameObject.GetComponent<PowerUpDropScript>();
				if(puds != null)
				{
					puds.TryToSpawnPowerUp();
				}

				Instantiate(goVanishFX, gCharacter.transform.position, goVanishFX.transform.rotation);
				Destroy(gameObject);
			}
		}

		SendAnimatorBools();
	}

	public override void Hurt (int aiDamage)
	{
		if(!bIncorporeal)
		{
			base.Hurt (aiDamage);
			if(fHealth <= 0 )
			{
				aAnim.enabled = false;
				bIncorporeal = true;

				Component[] components = gCharacter.GetComponentsInChildren(typeof(Rigidbody));
				foreach(Component c in components)
				{

					(c as Rigidbody).isKinematic = false;
				}
				bDie = true;
				//Destroy(gameObject);
			}
		}
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
		Instantiate(goVanishFX, transform.position, transform.rotation);
	}


	void FindActivePlayer()
	{
		gPlayer = scrptInput.GetActivePlayer();
	}

	void SendAnimatorBools()
	{
		aAnim.SetBool("bLeapIn", bLeapIn);
		//aAnim.SetFloat("fYVelocity", fYVelocity);
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
