/// <summary>
/// By Deven Smith
/// 2/13/2014
/// Player script.
/// Currently handles the players movement and his ability to attack
/// Camera Flipped now all references right are left
/// </summary>

using UnityEngine;
using System.Collections;
using System.Linq;

public class PlayerScriptSteven : EntityScript {

	Facings eFacing = Facings.Right;

	InputCharContScript scrptInput;

	bool bRangedAttack = true;
	bool bSwordAttack = false;
	bool bRopeAttack = false;
	bool bNaginataAttack = false;
	bool bGoingRight = true;
	bool bGrounded = true;
	bool bMoved = false;
	bool bCanJump = false;
	bool bStoppedJump = true;
	bool bAttacking = false;

	float fCurRopeScaleTime = 0.0f;
	float fCurFallTime = 0.0f;
	float fCurJumpTime = 0.0f;
	float fHeight = 0.0f;
	float fWidth = 0.0f;
	float fCurAttackTime = 0.0f;
	float fXAxis;
	float fYAxis;
	float fMaxFallTime;
	float fOriginalRopeXScale = 50.0f; 
	float fPrevRopeAngle = -1.0f;
	float fRopeLength = 0.0f;

	int iJumpFallFraction = 2;
	int iActiveShadows = 0;

	Vector3 vDirection = Vector3.zero;

	public bool bMoreThan1Player = false;
	public bool bPlayer1;

	public float fAttackPauseTime = 0.5f;
	public float fMoveSpeed;
	public float fMaxAttackTime = 0.5f;
	public float fMaxJumpTime = 1.0f;
	public float fGroundDistance = 0.2f;
	public float fMaxRopeScaleTime = .5f;

	public GameObject gPlayerAttackPrefab;
	public GameObject goRopePivotPoint;
	public GameObject goRopeAttackBox;
	public GameObject goRopeEndPoint;
	public GameObject goCharacter;
	public GameObject goSwordPivot;
	public GameObject goNaginataPivot;

	public LayerMask lmGroundLayer;
	
	// Use this for initialization
	// gets the input script from the main camera and figures out how tall the character is for movement
	void Start () {
		fHealth = 100.0f;
		fRopeLength = Vector3.Distance(goRopePivotPoint.transform.position, goRopeEndPoint.transform.position);

		fMaxFallTime = fMaxJumpTime/iJumpFallFraction;
		goCharacter.animation.Play("Idle");
		if(iActiveShadows > 0)
			SendShadowMessage("ChangeFacing" , 4);
		//disable the attack boxes 
		goRopeAttackBox.SetActive(false);

		scrptInput = CameraScriptInGame.GrabMainCamera().transform.parent.GetComponent<InputCharContScript>();
		
		CapsuleCollider myCollider = GetComponent<CapsuleCollider>();
		fHeight = myCollider.height;
		fWidth = myCollider.radius;
	}

	void Update()
	{
		if(!goCharacter.animation.IsPlaying("Idle"))
		{
			if(bGrounded && fXAxis != 1 && fXAxis != 1 && fYAxis != 1 && fYAxis != -1)
			{
				eFacing = Facings.Idle;
				goCharacter.animation.Play("Idle");
				SendShadowMessage("ChangeFacing" , 4);
			}
		}

		if(fAttackPauseTime > 0.0f)
		{
			fAttackPauseTime -= Time.deltaTime;
			if(fAttackPauseTime <= 0.0f)
			{
				bAttacking = false;
			}
		}

		if(fCurRopeScaleTime < fMaxRopeScaleTime)
		{
			fCurRopeScaleTime += Time.deltaTime;
			goRopeAttackBox.transform.localScale = new Vector3(fOriginalRopeXScale * fCurRopeScaleTime/fMaxRopeScaleTime, 1, 1);
			if(fCurRopeScaleTime > fMaxRopeScaleTime)
				goRopeAttackBox.transform.localScale = new Vector3(fOriginalRopeXScale, 1, 1);
			
		}

		//if currently attacking resolve it
		if(fCurAttackTime > 0)
		{
			if(bRopeAttack && fCurRopeScaleTime >= fMaxRopeScaleTime)
			{
				RopeHandler();
				fCurAttackTime -= Time.deltaTime;
			}
			else if (bSwordAttack)
			{
				fCurAttackTime -= Time.deltaTime;
			}
			else if(bRangedAttack)
			{
				fCurAttackTime -= Time.deltaTime;
			}
			else
			{
				fCurAttackTime -= Time.deltaTime;
			}

			if(fCurAttackTime <= 0)
			{
				goRopeAttackBox.SetActive(false);
			}
		}
	}
	
	// Update is called once per frame
	//checks to handle if the player has moved or if he was grounded but now is not or if he was not grounded but now is
	void LateUpdate () 
	{
		if(bGrounded)
		{
			RaycastHit hit;
			if(
				Physics.Raycast(transform.position+ transform.right*fWidth/2, -transform.up, out hit, fGroundDistance*2 + fHeight/2, lmGroundLayer.value) 
				|| Physics.Raycast(transform.position - transform.right*fWidth/2, -transform.up, out hit, fGroundDistance*2 + fHeight/2, lmGroundLayer.value))
			{
				if(hit.collider.tag != "Ground")
				{
					if(!goCharacter.animation.IsPlaying("Fall"))
						goCharacter.animation.Play("Fall");
					bGrounded = false;
					bCanJump = false;
					fCurFallTime = 0.0f;
				}
			}
			else
			{
				if(!goCharacter.animation.IsPlaying("Fall"))
					goCharacter.animation.Play("Fall");
				bGrounded = false;
				bCanJump = false;
				fCurFallTime = 0.0f;
			}
		}
		
		if(!bGrounded)
		{
			if(!bCanJump)
			{
				if(!goCharacter.animation.IsPlaying("Fall"))
					goCharacter.animation.Play("Fall");

				if(fCurFallTime < fMaxFallTime)
				{
					transform.Translate((-transform.up * fMoveSpeed * Time.deltaTime) + transform.up*fMoveSpeed *Time.deltaTime* (((fMaxFallTime-fCurFallTime)/fMaxFallTime)*((fMaxFallTime-fCurFallTime)/fMaxFallTime)));
					fCurFallTime += Time.deltaTime;
				}
				else
				{
					transform.Translate(-transform.up * fMoveSpeed * Time.deltaTime, Space.World);
				}
				bMoved = true;
			}
		}
		
		if(bMoved)
		{
			SendShadowMessage("AddPosition" , transform.position);
			SendShadowMessage("Move");
		}
		bMoved = false;
	}
	
	//handles if the player needs to change facing and moving right
	void MoveRight()
	{
		if(fYAxis != -1)
		{
			if(!goCharacter.animation.IsPlaying("Jump") && !goCharacter.animation.IsPlaying("Fall"))
				goCharacter.animation.Play("Walk");
			if(!bGoingRight)
			{
				transform.eulerAngles = new Vector3(0, 0, 0);
				bGoingRight = true;
				eFacing = Facings.Right;
			}
			if(!bAttacking || !bGrounded)
			{
				RaycastHit hit;
				if(Physics.Raycast(transform.position, transform.right, out hit, fWidth, lmGroundLayer.value))
				{
					if(hit.collider.tag != "Wall")
					{
						transform.Translate(transform.right * fMoveSpeed * Time.deltaTime,Space.World);
					}
				}
				else
				{
					transform.Translate(transform.right * fMoveSpeed * Time.deltaTime,Space.World);
				}
				bMoved = true;
			}
		}
		SendShadowMessage("ChangeFacing" , 0);//consider taking it out of if statement same in move left
	}
	
	//handles if the player needs to change facing and moving left
	void MoveLeft()
	{
		if(fYAxis != -1)
		{
			if(!goCharacter.animation.IsPlaying("Jump") && !goCharacter.animation.IsPlaying("Fall"))
				goCharacter.animation.Play("Walk");
			if(bGoingRight)
			{
				transform.eulerAngles = new Vector3(0, 180, 0);
				bGoingRight = false;
				eFacing = Facings.Left;
			}

			if(!bAttacking || !bGrounded)
			{
				RaycastHit hit;
				if(Physics.Raycast(transform.position, transform.right, out hit, fWidth, lmGroundLayer.value))
				{
					print (hit.collider.tag);
					if(hit.collider.tag != "Wall")
					{
						transform.Translate(transform.right * fMoveSpeed * Time.deltaTime,Space.World);
					}
				}
				else
				{
					transform.Translate(transform.right * fMoveSpeed * Time.deltaTime,Space.World);
				}

				bMoved = true;
			}
		}
		SendShadowMessage("ChangeFacing" , 1);
	}

	//ensures that the player is allowed to jump and then moves him up
	void Jump()
	{
		if(bCanJump)
		{
			goCharacter.animation.Play("Jump");
			bGrounded = false;
			fCurJumpTime += Time.deltaTime;
			
			if(fCurJumpTime >= fMaxJumpTime)
			{
				bCanJump = false;
			}
			else
			{
				if(fCurJumpTime > fMaxJumpTime/iJumpFallFraction)
				{
					//hyperbola -x^2 for slow down 
					transform.Translate((transform.up * fMoveSpeed * Time.deltaTime) - transform.up*fMoveSpeed *Time.deltaTime* ((fCurJumpTime/fMaxJumpTime)*(fCurJumpTime/fMaxJumpTime)));
				}
				else
				{
					transform.Translate(transform.up * fMoveSpeed * Time.deltaTime);
				}
			}
			bMoved = true;
		}
		bStoppedJump = false;
	}
	
	//stops the ability to jump 
	void StoppedJumping()
	{
		bCanJump = false;
		bStoppedJump = true;

		if(bGrounded)
		{
			RaycastHit hit;
			if(Physics.Raycast(transform.position, -transform.up, out hit, fGroundDistance + fHeight, lmGroundLayer.value))
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
		goCharacter.animation.Play("LookUp");
		eFacing = Facings.Up;
		SendShadowMessage("ChangeFacing" , 2);
	}
	
	//handles the player crouching and informs the shadows to do the same
	void Crouch()
	{
		eFacing = Facings.Crouch;
		goCharacter.animation.Play("Duck");
		SendShadowMessage("ChangeFacing" , 3);
	}

	//determins the attack type and attacks accordingly
	public override void Attack()
	{
		bAttacking = true;
		fAttackPauseTime = fMaxAttackTime;

		if(fXAxis == 0.0f && fYAxis == 0.0f)
		{//look into this pretty sure some of it cant happen the state should only be idle if the stick isnt moving
			if(eFacing == Facings.Left)
			{
				vDirection = new Vector3(-1.0f, 0, 0);
			}
			if(eFacing == Facings.Right)
			{
				vDirection = new Vector3(1.0f, 0, 0);
			}
			if(eFacing == Facings.Crouch)
			{
				vDirection = new Vector3(0, -1.0f, 0);
			}
			if(eFacing == Facings.Up)
			{
				vDirection = new Vector3(0, 1.0f, 0);
			}
			if(eFacing == Facings.Idle)
			{
				if(bGoingRight)
					vDirection = new Vector3(1.0f, 0, 0);
				else
					vDirection = new Vector3(-1.0f, 0, 0);
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
		}
		if(bSwordAttack)
		{//finds facing to determin which attack to turn on
			if(eFacing == Facings.Left || eFacing == Facings.Right || eFacing == Facings.Idle)
			{
				goSwordPivot.SendMessage("StartSwing", 0, SendMessageOptions.DontRequireReceiver);
				fCurAttackTime = fMaxAttackTime;
			}
			else if(eFacing == Facings.Up)
			{
				goSwordPivot.SendMessage("StartSwing", 1, SendMessageOptions.DontRequireReceiver);
				fCurAttackTime = fMaxAttackTime;
			}
			else
			{
				goSwordPivot.SendMessage("StartSwing", 2, SendMessageOptions.DontRequireReceiver);
				fCurAttackTime = fMaxAttackTime;
			}
			SendShadowMessage("Attack");
		}

		if(bRopeAttack)
		{//turns on the rope for attacking
			goRopeAttackBox.SetActive(true);
			fCurAttackTime = fMaxAttackTime;
			fCurRopeScaleTime =0.0f;
			SendShadowMessage("Attack");
		}

		if(bNaginataAttack)
		{//finds facing to determin which attack to turn on
			if(eFacing == Facings.Left || eFacing == Facings.Right || eFacing == Facings.Idle)
			{
				goNaginataPivot.SendMessage("StartSwing", 0, SendMessageOptions.DontRequireReceiver);
				fCurAttackTime = fMaxAttackTime;
			}
			else if(eFacing == Facings.Up)
			{
				goNaginataPivot.SendMessage("StartSwing", 1, SendMessageOptions.DontRequireReceiver);
				fCurAttackTime = fMaxAttackTime;
			}
			else
			{
				goNaginataPivot.SendMessage("StartSwing", 2, SendMessageOptions.DontRequireReceiver);
				fCurAttackTime = fMaxAttackTime;
			}
			SendShadowMessage("Attack");
		}
	}

	void Swap(int a_iChoice)
	{

		if(!bMoreThan1Player)
		{
			ChangeWeapon( -1);
		}
		else{
			if(!bIncorporeal)
			{
				SendPlayerMessage("ChangeWeapon", a_iChoice);

				//int iNumPlayers = scrptInput.agPlayer.Length
				for(int i = 0; i < scrptInput.agPlayer.Length; i++)
				{
					PlayerScriptSteven playerScript;
					playerScript = scrptInput.agPlayer[i].GetComponent<PlayerScriptSteven>();
					if(i == a_iChoice-1)
					{
						playerScript.bIncorporeal = false;
					}
					else
					{
						playerScript.bIncorporeal = true;
					}
				}
			}
		}
	}

	//checks what the active weapon is and makes sure the others are off and informs the shadows
	void ChangeWeapon(int a_iValue)
	{
		if(a_iValue < 0)
		{
			if(bRangedAttack)
			{
				fMaxAttackTime = .5f;
				bRangedAttack = false;
				bSwordAttack = true;
				bRopeAttack = false;
				bNaginataAttack = false;
				SendShadowMessage("ChangeAttackTime", fMaxAttackTime);
				SendShadowMessage("ChangeAttackMode", 1);
			}
			else if(bSwordAttack)
			{
				fMaxAttackTime = 1.0f;
				bRangedAttack = false;
				bSwordAttack = false;
				bRopeAttack = true;
				bNaginataAttack = false;
				SendShadowMessage("ChangeAttackTime", fMaxAttackTime);
				SendShadowMessage("ChangeAttackMode", 2);
			}
			else if(bRopeAttack)
			{
				fMaxAttackTime = 1.0f;
				bRangedAttack = false;
				bSwordAttack = false;
				bRopeAttack = false;
				bNaginataAttack = true;
				SendShadowMessage("ChangeAttackTime", fMaxAttackTime);
				SendShadowMessage("ChangeAttackMode", 3);
			}
			else if(bNaginataAttack)
			{
				fMaxAttackTime = .25f;
				bRangedAttack = true;
				bSwordAttack = false;
				bRopeAttack = false;
				bNaginataAttack = false;
				SendShadowMessage("ChangeAttackTime", fMaxAttackTime);
				SendShadowMessage("ChangeAttackMode", 0);
			}
		}
		else
		{
			if(a_iValue == 1)
			{
				fMaxAttackTime = .5f;
				bRangedAttack = false;
				bSwordAttack = true;
				bRopeAttack = false;
				bNaginataAttack = false;
			}
			else if(a_iValue == 2)
			{
				fMaxAttackTime = 1.0f;
				bRangedAttack = false;
				bSwordAttack = false;
				bRopeAttack = true;
				bNaginataAttack = false;
			}
			else if(a_iValue == 3)
			{
				fMaxAttackTime = 1.0f;
				bRangedAttack = false;
				bSwordAttack = false;
				bRopeAttack = false;
				bNaginataAttack = true;
			}
			else
			{
				fMaxAttackTime = .25f;
				bRangedAttack = true;
				bSwordAttack = false;
				bRopeAttack = false;
				bNaginataAttack = false;
			}
		}
	}

	//figures out the angle of the joystick and tries to place the rope there and if there was a previous angle does a sweep of raycasts 
	//to determine if anything was hit
	void RopeHandler()
	{
		float angle = Mathf.Atan2(fYAxis, -fXAxis) * Mathf.Rad2Deg;//determine angle based on joystick input

		if(eFacing != Facings.Idle)//if not standing still 
		{
			goRopePivotPoint.transform.eulerAngles = new Vector3(0,0,angle);//rotate the pivot point so its right matches the joystick position
			if(angle > fPrevRopeAngle)//if the new position is greater than the old position sweep counter clockwise
			{
				for(float tempangle = angle; tempangle > fPrevRopeAngle; tempangle--)
				{
					goRopePivotPoint.transform.eulerAngles = new Vector3(0,0,tempangle);
					//Debug.DrawLine(goRopePivotPoint.transform.position, goRopePivotPoint.transform.position + (goRopePivotPoint.transform.right * fRopeLength));
					RaycastHit hit;
					if(Physics.Raycast(goRopePivotPoint.transform.position, goRopePivotPoint.transform.right, out hit, fRopeLength))
					{
						if(hit.collider.tag == "Enemy")//if we hit an enemy tell the rope to send the hit message to the target
							goRopeAttackBox.SendMessage("SetHit", hit.collider.gameObject, SendMessageOptions.DontRequireReceiver);
					}
				}
				goRopePivotPoint.transform.eulerAngles = new Vector3(0,0,angle);//ensure the rope pivote is the correct final position
			}
			else if(angle < fPrevRopeAngle)//see top except swings clockwise 
			{
				for(float tempangle = angle; tempangle < fPrevRopeAngle; tempangle++)
				{
					goRopePivotPoint.transform.eulerAngles = new Vector3(0,0,tempangle);
				//	Debug.DrawLine(goRopePivotPoint.transform.position, goRopePivotPoint.transform.position + (goRopePivotPoint.transform.right * fRopeLength ));
					RaycastHit hit;
					if(Physics.Raycast(goRopePivotPoint.transform.position, goRopePivotPoint.transform.right, out hit, fRopeLength))
					{
						//not raycasting the angles yet cause im stupid
						if(hit.collider.tag == "Enemy")
							goRopeAttackBox.SendMessage("SetHit", hit.collider.gameObject, SendMessageOptions.DontRequireReceiver);
					}
				}
				goRopePivotPoint.transform.eulerAngles = new Vector3(0,0,angle);
			}
		}
		else
		{
			if(bGoingRight)
			{
				goRopePivotPoint.transform.eulerAngles = new Vector3(0,0,0);
			}
			else
			{
				goRopePivotPoint.transform.eulerAngles = new Vector3(0,0,180);
			}
		}
		fPrevRopeAngle = angle;//store the latest rope angle as the previouse angle for the next time
	}

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

	//sends a message to all shadows if player 1
	void SendShadowMessage(string a_sMessage)
	{

		if(bPlayer1 && iActiveShadows > 0)
		{
			foreach(GameObject shadow in scrptInput.agShadows)
			{
				shadow.SendMessage(a_sMessage, SendMessageOptions.DontRequireReceiver);
			}
		}
	}

	//sends a message and value to all shadows if player 1 
	void SendShadowMessage(string a_sMessage , int a_iValue)
	{
		if(bPlayer1 && iActiveShadows > 0 && !bMoreThan1Player)
		{
			foreach(GameObject shadow in scrptInput.agShadows)
			{
				shadow.SendMessage(a_sMessage, a_iValue ,SendMessageOptions.DontRequireReceiver);
			}
		}
	}

	//sends a message and value to all shadows if player 1 
	void SendShadowMessage(string a_sMessage , float a_fValue)
	{
		if(bPlayer1 && iActiveShadows > 0 && !bMoreThan1Player)
		{
			foreach(GameObject shadow in scrptInput.agShadows)
			{
				shadow.SendMessage(a_sMessage, a_fValue ,SendMessageOptions.DontRequireReceiver);
			}
		}
	}

	//sends a message and value to all shadows if player 1 
	void SendShadowMessage(string a_sMessage , Vector3 a_vValue)
	{
		if(bPlayer1 && iActiveShadows > 0 && !bMoreThan1Player)
		{
			foreach(GameObject shadow in scrptInput.agShadows)
			{
				shadow.SendMessage(a_sMessage, a_vValue ,SendMessageOptions.DontRequireReceiver);
			}
		}
	}

	void SendPlayerMessage(string a_sMessage, int a_iValue)
	{
		foreach(GameObject player in scrptInput.agPlayer)
		{
			player.SendMessage(a_sMessage, a_iValue, SendMessageOptions.DontRequireReceiver);
		}
	}

	//called when a shadow power up has been acquired
	//checks how many shadows are curently active and turns on the next one
	void ActivateShadow()
	{
		if(iActiveShadows < scrptInput.agShadows.Length)
		{
			iActiveShadows++;
			scrptInput.agShadows[iActiveShadows-1].SetActive(true);

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
		}
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
			}
		}

		if(c.collider.tag == "PowerUpShadow")
		{
			Destroy(c.gameObject);
			ActivateShadow();
		}
	}

	public override void Hurt (int aiDamage)
	{
		if(!bIncorporeal)
			fHealth -= aiDamage;
	}
}
