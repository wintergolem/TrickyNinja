/// <summary>
/// By Deven Smith
/// 2/13/2014
/// Player script.
/// Currently handles the players movement and his ability to attack
/// Camera Flipped now all references right are left
/// Last Edited by: Steven Hoover
/// </summary>

using UnityEngine;
using System.Collections;
using System.Linq;

public class PlayerScriptDeven : EntityScript {
	
	Facings eFacing = Facings.Right;
	
	public GameManager scrptInput;
	
	Animator aAnim;
	
	bool bRangedAttack = false;
	bool bSwordAttack = false;
	bool bRopeAttack = true;
	bool bNaginataAttack = false;
	bool bGoingLeft = true;
	bool bGrounded = true;
	bool bMoved = false;
	bool bCanJump = false;
	bool bStoppedJump = true;
	bool bAttacking = false;
	bool bCrouch = false;
	bool bLookUp = false;
	bool bJumping = false;
	bool bFirstAttack = true;
	bool bSecondAttack = false;
	bool bThirdAttack = false;
	bool bRunning = false;
	bool bIdle = false;

	float fCurComboResetTime = 0.0f;
	float fCurFallTime = 0.0f;
	float fCurJumpTime = 0.0f;
	float fHeight = 0.0f;
	float fWidth = 0.0f;
	float fCurAttackTime = 0.0f;
	float fXAxis;
	float fYAxis;
	float fMaxFallTime;
	float fJumpKeyPressTime = -1000.0f;
	float fJumpPressTimeBuffer = .25f;
	float fAirSpeedNegative = 0.0f;
	float fCurIdleTimer = 0.0f;
	
	public GameObject goActivePlayer;

	int iNextAttack = 1;
	int iJumpFallFraction = 2;
	int iFallFraction = 2;
	public int iActiveShadows = 0;
	public int armour = 0;

	Vector3 vDirection = Vector3.zero;
	Vector3 vPreviousPosition;
	public static Vector3 vPlayerSpawnPoint;
	
	public bool bMoreThan1Player = false;
	public bool bPlayer1;

	public float fComboResetTime = 1.0f;
	public float fAttackPauseTime = 0.5f;
	public float fMoveSpeed;
	public float fAirMoveSpeed;
	public float fJumpSpeed;
	public float fFallSpeed;
	public float fMaxAttackTime = 0.5f;
	public float fMaxJumpTime = 1.0f;
	public float fMinJumpTime = 0.5f;
	public float fGroundDistance = 0.2f;
	public static float fMaxDistanceFromActivePlayer = 15;
	public float fDestroyTimer = 5.0f;
	public float fKnockUpForce = 7500.0f;
	public float fIdleTimer = .06f;

	public GameObject goVanish;
	public GameObject gPlayerAttackPrefab;
	public GameObject[] goCharactersModels; // sword / kama / kunai / naginata
	public GameObject goCharacter2;
	public GameObject[] goRightHandWeapons;
	public GameObject[] goLeftHandWeapons;

	public string sGroundLayer;

	public SoundScript soundScript;
	public FadeToBlackScript fadeScript;

	int lmGroundLayer;
	
	// Use this for initialization
	// gets the input script from the main camera and figures out how tall the character is for movement
	void Start () {
		fMaxAttackTime = .5f;
		lmGroundLayer = LayerMask.NameToLayer(sGroundLayer);

		aAnim = goCharacter2.GetComponent<Animator>();
		
		fHealth = 100.0f;

		fMaxFallTime = fMaxJumpTime/iJumpFallFraction;
		if(iActiveShadows > 0)
			SendShadowMessage("ChangeFacing" , 4);
		
		scrptInput = GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
		
		CapsuleCollider myCollider = GetComponent<CapsuleCollider>();
		fHeight = myCollider.height;
		fWidth = myCollider.radius;

		FindActivePlayer();
		if(vPlayerSpawnPoint != Vector3.zero)
			transform.position = vPlayerSpawnPoint;

		vPreviousPosition = transform.position;

		foreach(GameObject g in goCharactersModels)
		{
			g.SetActive(true);
			goCharacter2 = g;
			Component[] components = goCharacter2.GetComponentsInChildren(typeof(Rigidbody));
			foreach(Component c in components)
				(c as Rigidbody).isKinematic = true;
			Component[] components2 = goCharacter2.GetComponentsInChildren(typeof(Collider));
			foreach(Component c in components2)
				(c as Collider).enabled = false;


			g.SetActive(false);
		}
		goCharacter2 = goCharactersModels[1];
		goCharacter2.SetActive(true);

		foreach(GameObject go in goRightHandWeapons)
			go.collider.enabled = false;

		foreach(GameObject go in goLeftHandWeapons)
			go.collider.enabled = false;

		SetWeaponModels();

		fYAxis = 0;
		MoveLeft();
	}
	// Update is called once per frame
	//checks to handle if the player has moved or if he was grounded but now is not or if he was not grounded but now is
	void Update () 
	{
		if(fCurIdleTimer > 0)
			fCurIdleTimer -= Time.deltaTime;

		if(!bIncorporeal && fadeScript.bDemoOver)
			armour = 9001;
			//bIncorporeal = true;

		if(fCurComboResetTime > 0.0f)
		{
			fCurComboResetTime -= Time.deltaTime;
			if(fCurComboResetTime <= 0.0f)
			{
				bFirstAttack = true;
				bSecondAttack = false;
				bThirdAttack = false;
			}
		}

		if(fHealth > 0.0f)
		{
			if(Mathf.Abs(transform.position.x - goActivePlayer.transform.position.x) > fMaxDistanceFromActivePlayer && bIncorporeal)
			{
				transform.position = goActivePlayer.transform.position;
			}

			if(Input.GetKeyDown(KeyCode.Backslash))
			{
				Hurt(50);
			}
			
			//if not the active player, update that script
			if (bIncorporeal)
				FindActivePlayer();

			if(eFacing != Facings.Idle)
			{
				if(bGrounded && fXAxis == 0 && fYAxis == 0)
				{
					eFacing = Facings.Idle;
					SendShadowMessage("ChangeFacing" , 4);
				}
			}
			
			if(fAttackPauseTime > 0.0f)
			{
				fAttackPauseTime -= Time.deltaTime;
				if(fAttackPauseTime <= 0.0f)
				{
					bAttacking = false;
					foreach(GameObject go in goRightHandWeapons)
					{
						go.collider.enabled = false;
					}
					foreach(GameObject go in goLeftHandWeapons)
					{
						go.collider.enabled = false;
					}
				}
			}
			if(fCurAttackTime > 0)
			{
				fCurAttackTime -= Time.deltaTime;
			}
			
			if(eFacing != Facings.Crouch)
			{
				bCrouch = false;
			}

			if(!(fYAxis <.75f))
			{
				bLookUp = true;
			}
			else 
			{
				bLookUp = false;
			}

			//end of stuff from update

			if(bGrounded)
			{
				RaycastHit hit;
				if(
					Physics.Raycast(transform.position+ transform.right*fWidth/2, -transform.up, out hit, fGroundDistance*2 + fHeight/2, 1 << lmGroundLayer) 
					|| Physics.Raycast(transform.position - transform.right*fWidth/2, -transform.up, out hit, fGroundDistance*2 + fHeight/2, 1 << lmGroundLayer))
				{
					if(hit.collider.tag != "Ground")
					{
						bGrounded = false;
						bCanJump = false;
						fCurFallTime = 0.0f;
					}
				}
				else
				{
					bGrounded = false;
					bCanJump = false;
					fCurFallTime = 0.0f;
				}
			}
		
			if(!bGrounded)
			{
				if(!bCanJump)
				{

					bJumping = false;

					if(fCurJumpTime == 0.0f || fCurJumpTime > fMinJumpTime)
					{
						if(fCurFallTime >= 0.0f)
						{
							transform.Translate((-transform.up * fFallSpeed * Time.deltaTime) + transform.up*fFallSpeed *Time.deltaTime* (((fMaxFallTime-fCurFallTime)/fMaxFallTime)));
							fCurFallTime += Time.deltaTime;
						}
						else
						{
							transform.Translate(-transform.up * fFallSpeed * Time.deltaTime, Space.World);
						}
						bMoved = true;
					}
					else
					{
						bCanJump = true;
						Jump();
						bCanJump = false;
						bStoppedJump = true;
					}
				}
			}
			
			if(bMoved)
			{
				SendShadowMessage("AddPosition" , transform.position);
				SendShadowMessage("Move");
			}

			CheckForGroundPassThrough();

			SendAnimatorBools();
			bMoved = false;

			vPreviousPosition = transform.position;

			//if(bAttacking)
				//ComboHandler();
		}
	}

	#region Movement
	//handles if the player needs to change facing and moving right
	void MoveRight()
	{
		if(!(fYAxis < -.5f) && fHealth > 0.0f)
		{
			SendShadowMessage("ChangeFacing" , 0);//consider taking it out of if statement same in move left
			bCrouch = false;
			float horMoveSpeed;
			if(bGrounded)
				horMoveSpeed = fMoveSpeed;
			else
			{
				horMoveSpeed = fAirMoveSpeed - fAirSpeedNegative;
				if(fAirSpeedNegative >= fAirMoveSpeed)
					horMoveSpeed = 0.0f;
				else
					fAirSpeedNegative += Time.deltaTime ;
			}

			if(!bGoingLeft)
			{
				transform.eulerAngles = new Vector3(0, 0, 0);
				bGoingLeft = true;
				SetWeaponModels();
			}

			RaycastHit hit;
			if(Physics.Raycast(transform.position, transform.right, out hit, fWidth, 1 << lmGroundLayer))
			{
				if(hit.collider.tag != "Wall")
				{
					transform.Translate(transform.right * horMoveSpeed * Time.deltaTime,Space.World);
				}
			}
			else
			{
				transform.Translate(transform.right * horMoveSpeed * Time.deltaTime,Space.World);
			}
			bMoved = true;

			SendShadowMessage("ChangeFacing" , 0);//consider taking it out of if statement same in move left
		}
	}
	
	//handles if the player needs to change facing and moving left
	void MoveLeft()
	{
		if(!(fYAxis < -.5f) && fHealth > 0.0f)
		{
			SendShadowMessage("ChangeFacing" , 1);
			bCrouch = false;
			float horMoveSpeed;
			if(bGrounded)
				horMoveSpeed = fMoveSpeed;
			else
			{
				horMoveSpeed = fAirMoveSpeed - fAirSpeedNegative;
				if(fAirSpeedNegative >= fAirMoveSpeed)
					horMoveSpeed = 0.0f;
				else
					fAirSpeedNegative += Time.deltaTime ;
			}

			if(bGoingLeft)
			{
				transform.eulerAngles = new Vector3(0, 180, 0);
				bGoingLeft = false;
				SetWeaponModels();
			}

			RaycastHit hit;
			if(Physics.Raycast(transform.position, transform.right, out hit, fWidth, 1 << lmGroundLayer))
			{
				if(hit.collider.tag != "Wall")
				{
					transform.Translate(transform.right * horMoveSpeed * Time.deltaTime,Space.World);
				}
			}
			else
			{
				transform.Translate(transform.right * horMoveSpeed * Time.deltaTime,Space.World);
			}
			bMoved = true;
			SendShadowMessage("ChangeFacing" , 1);
		}
	}
	
	//ensures that the player is allowed to jump and then moves him up
	void Jump()
	{
		if( fHealth > 0.0f)
		{
			if(bStoppedJump)
				fJumpKeyPressTime = Time.time;
			
			if(bCanJump)
			{
				bJumping = true;
				bGrounded = false;
				fCurJumpTime += Time.deltaTime;
				
				if(fCurJumpTime >= fMaxJumpTime)
				{
					bJumping = false;
					bCanJump = false;
					fCurJumpTime = 0.0f;
				}
				else
				{
					if(fCurJumpTime > fMaxJumpTime/iJumpFallFraction)
					{
						//hyperbola -x^2 for slow down 
						transform.Translate((transform.up * fJumpSpeed * Time.deltaTime) - transform.up*fJumpSpeed *Time.deltaTime* ((fCurJumpTime/fMaxJumpTime)*(fCurJumpTime/fMaxJumpTime)));
					}
					else
					{
						transform.Translate(transform.up * fJumpSpeed * Time.deltaTime);
					}
				}
				bMoved = true;
			}
			bStoppedJump = false;
		}
	}
	
	//stops the ability to jump 
	void StoppedJumping()
	{
		bJumping = false;
		bCanJump = false;
		bStoppedJump = true;
		
		if(bGrounded)
		{
			RaycastHit hit;
			if(Physics.Raycast(transform.position, -transform.up, out hit, fGroundDistance + fHeight, 1 << lmGroundLayer))
			{
				if(hit.collider.tag == "Ground")
				{
					bCanJump = true;
				}
			}
		}
	}
	
	//handles the player looking up and informs the shadows to do the same
	void LookUp()
	{
		if(fYAxis >= .75f)
		{
			bLookUp = true;
			eFacing = Facings.Up;
			SendShadowMessage("ChangeFacing" , 2);
		}
		else
		{
			bLookUp = false;
		}
	}
	
	//handles the player crouching and informs the shadows to do the same
	void Crouch()
	{
		if(fYAxis < -.5f && fXAxis == 0)
		{
			bCrouch = true;
			eFacing = Facings.Crouch;
			SendShadowMessage("ChangeFacing" , 3);
		}
	}
	#endregion

	#region Attack

	void ComboHandler()
	{
		if(!bAttacking && fHealth > 0.0f)
		{
			if(fCurComboResetTime > 0.0f)
			{
				if(iNextAttack == 1)
				{
				//	Debug.Log("first attack in combo");
					if(!bRangedAttack)
						iNextAttack++;

					bFirstAttack = true;
					bSecondAttack = false;
					bThirdAttack = false;
				}
				else if(iNextAttack == 2)
				{
				//	Debug.Log("second attack in combo");
					if(bNaginataAttack || bRopeAttack)
						iNextAttack++;
					else
						iNextAttack = 1;

					bSecondAttack = true;
					bFirstAttack = false;
					bThirdAttack = false;
				}
				else
				{
				//	Debug.Log("Third attack in combo");
					iNextAttack = 1;
					bFirstAttack = false;
					bSecondAttack = false;
					bThirdAttack = true;
				}
				fCurComboResetTime = fComboResetTime;
			}
			else
			{
			//	print ("First Attack starting combo ");
				bFirstAttack = true;
				bSecondAttack = false;
				bThirdAttack = false;
				
				if(!bRangedAttack)
					iNextAttack++;
				
				fCurComboResetTime = fComboResetTime;
			}
		}
	}

	//determins the attack type and attacks accordingly
	public override void Attack()
	{
		if(!bAttacking && fHealth > 0.0f)
		{
			ComboHandler();

			bAttacking = true;
			foreach(GameObject go in goRightHandWeapons)
			{
				go.collider.enabled = true;
			}
			foreach(GameObject go in goLeftHandWeapons)
			{
				go.collider.enabled = true;
			}


			
			if(fXAxis == 0.0f && fYAxis == 0.0f)
			{//look into this pretty sure some of it cant happen the state should only be idle if the stick isnt moving
				if(!bGoingLeft && !bCrouch && !bLookUp)
				{
					vDirection = new Vector3(-1.0f, 0, 0);
				}
				if(bGoingLeft && !bCrouch && !bLookUp)
				{
					vDirection = new Vector3(1.0f, 0, 0);
				}
				if(bCrouch)
				{
					vDirection = new Vector3(0, -1.0f, 0);
				}
				if(bLookUp)
				{
					vDirection = new Vector3(0, 1.0f, 0);
				}
			}
			else
			{
				vDirection = new Vector3(-fXAxis, fYAxis, 0);
			}
			
			if(bRangedAttack)
			{
				GameObject attack = (GameObject)Instantiate (gPlayerAttackPrefab, transform.position, gPlayerAttackPrefab.transform.rotation);
				attack.SendMessage ("SetDirection", vDirection, SendMessageOptions.DontRequireReceiver);
				SendShadowMessage("RangedAttack", vDirection);
				soundScript.SendMessage ("ShotFired", SendMessageOptions.DontRequireReceiver);
			}
			if(bSwordAttack)
			{//finds facing to determin which attack to turn on
				fCurAttackTime = fMaxAttackTime;
				SendShadowMessage("Attack");
				soundScript.SendMessage ("StartSwing", true, SendMessageOptions.DontRequireReceiver);
			}
			if (bNaginataAttack)
			{
				fCurAttackTime = fMaxAttackTime;
				SendShadowMessage ("Attack");
				soundScript.SendMessage ("StartSwing", false, SendMessageOptions.DontRequireReceiver);
			}
			if(bRopeAttack)
			{
				fCurAttackTime = fMaxAttackTime;
				SendShadowMessage ("Attack");
			}
			fAttackPauseTime = fMaxAttackTime;
		}
	}
	
	void Swap(int a_iChoice)
	{
		if(!bMoreThan1Player)
		{
			ChangeWeapon( -1);
		}
		else
		{
			SendPlayerMessage("ChangeWeapon", a_iChoice);
		}
	}
	
	//checks what the active weapon is and makes sure the others are off and informs the shadows
	void ChangeWeapon(int a_iValue)
	{
		if(a_iValue < 0 && fHealth > 0)
		{
			if(bRangedAttack)
			{
				Instantiate(goVanish, transform.position, goVanish.transform.rotation);
				foreach(GameObject go in goCharactersModels)
				{
					go.SetActive(false);
				}
				goCharactersModels[1].SetActive(true);
				goCharacter2 = goCharactersModels[1];
				aAnim = goCharacter2.GetComponent<Animator>();

				fMaxAttackTime = .5f;
				bRangedAttack = false;
				bSwordAttack = false;
				bRopeAttack = true;
				bNaginataAttack = false;
				SendShadowMessage("ChangeAttackTime", fMaxAttackTime);
				SendShadowMessage("ChangeAttackMode", 2);
			}
			else if(bSwordAttack)
			{
				Instantiate(goVanish, transform.position, goVanish.transform.rotation);
				foreach(GameObject go in goCharactersModels)
				{
					go.SetActive(false);
				}
				goCharactersModels[3].SetActive(true);
				goCharacter2 = goCharactersModels[3];
				aAnim = goCharacter2.GetComponent<Animator>();

				fMaxAttackTime = 1.0f;
				bRangedAttack = false;
				bSwordAttack = false;
				bRopeAttack = false;
				bNaginataAttack = true;
				SendShadowMessage("ChangeAttackTime", fMaxAttackTime);
				SendShadowMessage("ChangeAttackMode", 2);

			}
			else if(bRopeAttack)
			{
				Instantiate(goVanish, transform.position, goVanish.transform.rotation);
				foreach(GameObject go in goCharactersModels)
				{
					go.SetActive(false);
				}
				goCharactersModels[3].SetActive(true);
				goCharacter2 = goCharactersModels[3];
				aAnim = goCharacter2.GetComponent<Animator>();

				fMaxAttackTime = .5f;
				bRangedAttack = false;
				bSwordAttack = false;
				bRopeAttack = false;
				bNaginataAttack = true;
				SendShadowMessage("ChangeAttackTime", fMaxAttackTime);
				SendShadowMessage("ChangeAttackMode", 3);
			}
			else if(bNaginataAttack)
			{
				Instantiate(goVanish, transform.position, goVanish.transform.rotation);
				foreach(GameObject go in goCharactersModels)
				{
					go.SetActive(false);
				}
				goCharactersModels[2].SetActive(true);
				goCharacter2 = goCharactersModels[2];
				aAnim = goCharacter2.GetComponent<Animator>();

				fMaxAttackTime = .25f;
				bRangedAttack = true;
				bSwordAttack = false;
				bRopeAttack = false;
				bNaginataAttack = false;
				SendShadowMessage("ChangeAttackTime", fMaxAttackTime);
				SendShadowMessage("ChangeAttackMode", 0);
			}

			fCurComboResetTime = 0.0f;
			bFirstAttack = true;
			bSecondAttack = false;
			bThirdAttack = false;
		}

		SetWeaponModels();
	}

	void SetWeaponModels()
	{

		foreach(GameObject go in goLeftHandWeapons)
		{
			go.SetActive(false);
		}
		foreach(GameObject go in goRightHandWeapons)
		{
			go.SetActive(false);
		}

		if(bGoingLeft)
		{
			if(bSwordAttack)
				goLeftHandWeapons[0].SetActive(true);
			if(bNaginataAttack)
				goLeftHandWeapons[1].SetActive(true);

			
		}
		else
		{
			if(bSwordAttack)
				goRightHandWeapons[0].SetActive(true);
			if(bNaginataAttack)
				goRightHandWeapons[1].SetActive(true);

				
		}

		if(bRopeAttack)
		{
			goRightHandWeapons[2].SetActive(true);	
			goLeftHandWeapons[2].SetActive(true);
		}

	}

	#endregion
	//used by input handler to pass the fyaxis
	void SetYAxis(float a_fValue)
	{
		fYAxis = a_fValue;
	}
	
	//used by input handler to pass fxaxis
	void SetXAxis(float a_fValue)
	{
		fXAxis = a_fValue;
	}

	#region SendMessage
	//sends a message to all shadows if player 1
	void SendShadowMessage(string a_sMessage)
	{
		if(bPlayer1 && iActiveShadows > 0 && !bMoreThan1Player)
		{
			foreach(ShadowScript2 shadow in scrptInput.agShadows)
			{
				shadow.gameObject.SendMessage(a_sMessage, SendMessageOptions.DontRequireReceiver);
			}
		}
	}
	
	//sends a message and value to all shadows if player 1 
	void SendShadowMessage(string a_sMessage , int a_iValue)
	{
		if(bPlayer1 && iActiveShadows > 0 && !bMoreThan1Player)
		{
			foreach(ShadowScript2 shadow in scrptInput.agShadows)
			{
				shadow.gameObject.SendMessage(a_sMessage, a_iValue ,SendMessageOptions.DontRequireReceiver);
			}
		}
	}
	
	//sends a message and value to all shadows if player 1 
	void SendShadowMessage(string a_sMessage , float a_fValue)
	{
		if(bPlayer1 && iActiveShadows > 0 && !bMoreThan1Player)
		{
			foreach(ShadowScript2 shadow in scrptInput.agShadows)
			{
				shadow.gameObject.SendMessage(a_sMessage, a_fValue ,SendMessageOptions.DontRequireReceiver);
			}
		}
	}
	
	//sends a message and value to all shadows if player 1 
	void SendShadowMessage(string a_sMessage , Vector3 a_vValue)
	{
		if(bPlayer1 && iActiveShadows > 0 && !bMoreThan1Player)
		{
			foreach(ShadowScript2 shadow in scrptInput.agShadows)
			{
				shadow.gameObject.SendMessage(a_sMessage, a_vValue ,SendMessageOptions.DontRequireReceiver);
			}
		}
	}
	
	void SendPlayerMessage(string a_sMessage, int a_iValue)
	{
		foreach(PlayerScriptDeven player in scrptInput.agoPlayers)
		{
			player.gameObject.SendMessage(a_sMessage, a_iValue, SendMessageOptions.DontRequireReceiver);
		}
	}
	#endregion

	//called when a shadow power up has been acquired
	//checks how many shadows are curently active and turns on the next one
	bool ActivateShadow()
	{
		if(iActiveShadows < scrptInput.agShadows.Length)
		{
			iActiveShadows++;
			scrptInput.agShadows[iActiveShadows-1].gameObject.SetActive(true);
			
			//ensures that the new shadow is in the right attack mode
			if(bRangedAttack)
				SendShadowMessage("ChangeAttackMode", 0);
			if(bSwordAttack)
				SendShadowMessage("ChangeAttackMode", 1);
			if(bRopeAttack)
				SendShadowMessage("ChangeAttackMode", 2);
			if(bNaginataAttack)
				SendShadowMessage("ChangeAttackMode", 3);
			
			SendShadowMessage("ChangeAttackTime", fMaxAttackTime);
			return true;
		}
		return false;
	}
	
	void FindActivePlayer()
	{
		goActivePlayer = scrptInput.GetActivePlayer ();
	}
	
	//finds the ground to see if the player should stop falling 
	//also checks for picking up power ups
	void OnCollisionStay(Collision c)
	{
		if(c.collider.tag == "Ground")
		{
			if(c.contacts[0].point.y < transform.position.y)
			{
				bGrounded = true;
				
				if(bStoppedJump)
					bCanJump = true;
				
				transform.position = new Vector3(transform.position.x, c.contacts[0].point.y  + fGroundDistance + fHeight/2, transform.position.z);
				fCurJumpTime = 0.0f;
				fCurFallTime = 0.0f;
				fAirSpeedNegative = 0.0f;
				
				if((Time.time - fJumpKeyPressTime) <= fJumpPressTimeBuffer)
				{
					bCanJump = true;
					Jump();
				}
			}
		}
		
		if(c.collider.tag == "PowerUpShadow")
		{
			Destroy(c.gameObject);
			if( bPlayer1 && !bMoreThan1Player)
				if(!ActivateShadow())
					Heal(10);
		}
	}

	public void Heal(int health)
	{
		if(fHealth < 100)
		{
			fHealth += health;
			if(fHealth > 100)
				fHealth = 100;
		}
	}
	
	public override void Hurt (int aiDamage)
	{
		soundScript.SendMessage ("PlayerDeath", SendMessageOptions.DontRequireReceiver);
		if(fHealth > 0.0f)
		{
			if(!bIncorporeal)
			{
				if(aiDamage > armour)
					fHealth -= aiDamage - armour;
				else
					fHealth -= aiDamage;
				Instantiate(gPow, transform.position + new Vector3(0,0,.5f), gPow.transform.rotation);
			}

			if(aiDamage > 1000)
				fHealth -= aiDamage;

			if(fHealth <= 0.0f)
			{
				SendPlayerMessage("Hurt", 9001);

				GameObject[] enemies = GameObject.FindGameObjectsWithTag("Enemy");
				foreach(GameObject go in enemies)
				{
					go.SetActive(false);
				}

				if(!bMoreThan1Player && bPlayer1)
					SendShadowMessage("Hurt", 1);

				collider.enabled = false;
				aAnim.enabled = false;
				Component[] components = goCharacter2.GetComponentsInChildren(typeof(Rigidbody));
				foreach(Component c in components)
				{
					(c as Rigidbody).isKinematic = false;
				}
				Component[] components2 = goCharacter2.GetComponentsInChildren(typeof(Collider));
				foreach(Component c in components2)
					(c as Collider).enabled = true;

				GameObject spawner = GameObject.FindGameObjectWithTag("EnemySpawner");
				spawner.SetActive(false);
				
				GameObject root;
				root = goCharacter2.transform.Find("AnimationRig_V3:Character1_Reference/AnimationRig_V3:Character1_Hips").gameObject;
				root.rigidbody.AddForce(Vector3.up * fKnockUpForce , ForceMode.Force);
				soundScript.SendMessage("PlayerDeath", SendMessageOptions.DontRequireReceiver);
				Invoke ("RestartLevel", fDestroyTimer);
			}
		}
	}

	void RestartLevel()
	{
		if(bPlayer1)
			Application.LoadLevel(Application.loadedLevel);
	}

	void CheckForGroundPassThrough()
	{
		RaycastHit hit;
		if(Physics.Linecast(vPreviousPosition, transform.position, out hit, 1<<lmGroundLayer))
		{
			if(hit.collider.tag == "Ground")
			{
				bGrounded = true;
				
				if(bStoppedJump)
					bCanJump = true;
				
				transform.position = new Vector3(transform.position.x, hit.point.y  + fGroundDistance + fHeight/2, transform.position.z);
				fCurJumpTime = 0.0f;
				fCurFallTime = 0.0f;
				fAirSpeedNegative = 0.0f;
				
				if((Time.time - fJumpKeyPressTime) <= fJumpPressTimeBuffer)
				{
					bCanJump = true;
					Jump();
				}
			}
		}
	}
	
	void SendAnimatorBools()
	{
		if(bMoved && bGrounded)
			bRunning = true;
		else
			bRunning = false;

		if(!bMoved && bGrounded)
		{
			if(fCurIdleTimer <= 0)
				bIdle = true;
		}
		else
		{
			bIdle = false;
			fCurIdleTimer = fIdleTimer;
		}

		aAnim.SetBool("bIdle", bIdle);
		aAnim.SetBool("bRunning", bRunning);
		aAnim.SetBool("bFirstAttack", bFirstAttack);
		aAnim.SetBool("bSecondAttack", bSecondAttack);
		aAnim.SetBool("bThirdAttack", bThirdAttack);
		aAnim.SetBool("bLookUp", bLookUp);
		aAnim.SetBool("bCrouch", bCrouch);
		aAnim.SetBool("bAttacking", bAttacking);
		aAnim.SetBool("bJumping", bJumping);
		aAnim.SetBool("bMoved", bMoved);
		aAnim.SetBool("bGrounded", bGrounded);
		aAnim.SetBool("bGoingLeft", bGoingLeft);
		aAnim.SetBool("bNaginataAttack", bNaginataAttack);
		aAnim.SetBool("bRopeAttack", bRopeAttack);
		aAnim.SetBool("bSwordAttack", bSwordAttack);
		aAnim.SetBool("bRangedAttack", bRangedAttack);
		
	}
}
