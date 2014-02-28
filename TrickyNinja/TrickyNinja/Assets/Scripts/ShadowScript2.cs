/// <summary>
/// By Deven Smith
/// 1/29/2014
/// ShadowScript2
/// made the shadows only move to positions the player has been 
/// instead of tyring to treat it like a player recieving delayed inputs
/// </summary>
using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public enum Facings {Crouch, Up, Right, Left, Idle};
public class ShadowScript2 : EntityScript 
{
	public Facings eFacing = Facings.Right;

	public bool bGrounded = false;

	public int iDelay = 60;

	public float fMoveSpeed = 5.0f;
	public float fGroundDistance = 0.2f;

	public Vector3 vDirection = Vector3.zero;

	public LayerMask lmGroundLayer;
	
	public GameObject gPlayerAttackPrefab;
	public GameObject goCharacter;

	bool bMeleeAttack = false;
	bool bRangedAttack = true;
	bool bRopeAttack = false;

	float fHeight = 0.0f;
	float fWidth = 0.0f;
	float fMaxAttackTime;
	float fCurAttackTime;

	List<Vector3> lvPositions = new List<Vector3>();


	// Use this for initialization
	void Start () 
	{
		for(int i = iDelay; i > 0; i--)
			lvPositions.Add(transform.position);

		CapsuleCollider myCollider = GetComponent<CapsuleCollider>();
		fHeight = myCollider.height;
		fWidth = myCollider.radius;
	}
	
	// Update is called once per frame
	void Update () {

		//transform.localScale = new Vector3(1, 1, 1);
		RaycastHit hit;
		Debug.DrawLine(transform.position, transform.position + (-transform.up * (fGroundDistance + fHeight/2)));
		if(Physics.Raycast(transform.position, -transform.up, out hit, fGroundDistance + fHeight/2, lmGroundLayer.value))
		{
			if(hit.collider.tag != "Ground")
			{
				bGrounded = false;
			}
			else 
			{
				bGrounded = true;
			}
		}
		else
		{
			if(!goCharacter.animation.IsPlaying("Jump") && !goCharacter.animation.IsPlaying("Duck")  && !goCharacter.animation.IsPlaying("LookUp") )
			{
				goCharacter.animation.Play("Jump");
				ChangeFacing(4);
			}
			bGrounded = false;
		}

		if(eFacing == Facings.Left)
		{
			if(bGrounded)
				goCharacter.animation.Play("Walk");
			transform.eulerAngles = new Vector3(0, 180, 0);
		}
		if(eFacing == Facings.Right)
		{
			if(bGrounded)
				goCharacter.animation.Play("Walk");
			transform.eulerAngles = new Vector3(0, 0, 0);
		}
		if(eFacing == Facings.Crouch)
		{
			goCharacter.animation.Play("Duck");
			//transform.localScale = new Vector3(1, .5f, 1);
		}
		if(eFacing == Facings.Up)
		{
			goCharacter.animation.Play("LookUp");
		}
		if(eFacing == Facings.Idle)
		{
			if(bGrounded)
				goCharacter.animation.Play("Idle");
			else
			{
				if(goCharacter.animation.IsPlaying("Duck") || goCharacter.animation.IsPlaying("LookUp"))
					goCharacter.animation.Play("Jump");
			}
		}
	}

	public override void Move()
	{
		Vector3 vectorToPosition = lvPositions[0] - transform.position;
		transform.position = lvPositions[0];
		lvPositions.RemoveAt(0);
	}

	void AddPosition(Vector3 newPosition)
	{
		lvPositions.Add(newPosition);
	}

	void ChangeFacing(int newFacing)
	{
		switch(newFacing)
		{
		case 0:
			eFacing = Facings.Right;
			vDirection = new Vector3(1.0f, 0, 0);
			break;
		case 1:
			eFacing = Facings.Left;
			vDirection = new Vector3(-1.0f, 0, 0);
			break;
		case 2:
			eFacing = Facings.Up;
			vDirection = new Vector3(0, 1.0f, 0);
			break;
		case 3:
			eFacing = Facings.Crouch;
			vDirection = new Vector3(0, -1.0f, 0);
			break;
		case 4:
			eFacing = Facings.Idle;

			if(transform.eulerAngles == new Vector3(0, 0, 0))
				vDirection = new Vector3(1.0f, 0, 0);
			else
				vDirection = new Vector3(-1.0f, 0, 0);
			break;
		default:
			eFacing = Facings.Right;
			break;
		}
	}


	void ChangeAttackTime(float a_fNewAttackTime)
	{
		//change max attack time to new attack time
	}


	public override void Attack()
	{
		if(bRangedAttack)
		{
			GameObject attack = (GameObject)Instantiate (gPlayerAttackPrefab, transform.position, gPlayerAttackPrefab.transform.rotation);
			attack.SendMessage ("SetDirection", vDirection, SendMessageOptions.DontRequireReceiver);
		}
		if(bMeleeAttack)
		{
			//if(eFacing == )
		}
		if(bRopeAttack)
		{

		}

	}


	public void RangedAttack(Vector3 a_vAttackDirection)
	{
		if(bRangedAttack)
		{
			GameObject attack = (GameObject)Instantiate (gPlayerAttackPrefab, transform.position, gPlayerAttackPrefab.transform.rotation);
			attack.SendMessage ("SetDirection", a_vAttackDirection, SendMessageOptions.DontRequireReceiver);
		}
	}

}
