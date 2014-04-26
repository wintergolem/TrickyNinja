using UnityEngine;
using System.Collections;

public class GeneralNinjaScript : MonoBehaviour {

	delegate void AttackType( bool a_b);

	public enum EnemyType { WalkThrow, WalkAttack , WalkJump };
	public enum EnemyState {Move , Attack , KnockBack, Dead, Idle };

	public EnemyType type;
	public EnemyState state;

	public GameObject attack;

	GameManager manager;

	Vector3 moveVector;

	bool bFacingLeft;
	bool bAttacked = false;

	float fAttackCurrent = 0;
	float fTargetY = 0;

	public float fSpeed;
	public float fAttackDistance;
	public float fMaxDistanceFromPlayer;
	public float fAttackTime;
	public float fAttackWait;

	public Vector2 v2JumpPower;
	public float fInAirAttackDistance;

	public bool bKnockBack = false;
	// Use this for initialization
	void Start () 
	{
		manager = GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();	
	}

	public void Init( EnemyType a_type )
	{
		type = a_type;
	}
	
	void Update () 
	{
		switch(type)
		{
		case EnemyType.WalkAttack:
			WalkAttackUpdate();
			break;
		case EnemyType.WalkThrow:
			WalkThrowUpdate();
			break;
		case EnemyType.WalkJump:
			WalkJumpUpdate();
			break;
		default:
			break;
		}

		CheckState();
	}

	void WalkAttackUpdate()
	{
		switch(state)
		{
		case EnemyState.Move:
			Move ();
			break;

		case EnemyState.Attack:
			Attack (new AttackType (WalkAttackAttack) );
			break;

		case EnemyState.KnockBack:
			break;

		default:
			break;
		}
	}

	void WalkThrowUpdate()
	{
		switch (state)
		{
		case EnemyState.Move:
			Move ();
			break;
		case EnemyState.Attack:
			Attack(new AttackType (WalkThrowAttack) );
			break;

		case EnemyState.Idle:

			break;

		case EnemyState.Dead:

			break;

		case EnemyState.KnockBack:

			break;
		}
	}
	
	void WalkJumpUpdate()
	{
		switch (state)
		{
		case EnemyState.Move:
			Move ();
			break;
		case EnemyState.Attack:
			//this state serves as the jumping state
			//so I need to check for attack distance here
			if( Vector3.Distance(manager.GetActivePlayer().transform.position, transform.position ) < fInAirAttackDistance )
			{
				Attack( new AttackType (WalkJumpAttack) );
			}
			break;
		case EnemyState.Idle:
			break;
		case EnemyState.Dead:
			break;
		case EnemyState.KnockBack:
			break;
		}
	}

	void CheckState()
	{
		if( bKnockBack )
		{
			state = EnemyState.KnockBack;
		}
		else  if( !bKnockBack && state == EnemyState.KnockBack)
		{
			state = EnemyState.Idle;
		}

		if( fAttackCurrent > fAttackTime + (fAttackWait*2) )
		{
			fAttackCurrent = 0;
			state = EnemyState.Idle;
			attack.SetActive(false);
		}
		else if( bAttacked != true && (state == EnemyState.Attack || ( state != EnemyState.Attack && Vector3.Distance( transform.position , manager.GetActivePlayer().transform.position ) < fAttackDistance) ) )
		{
			state = EnemyState.Attack;
		}

		if( state != EnemyState.KnockBack && state != EnemyState.Dead && state != EnemyState.Attack)
		{
			state = EnemyState.Move;
		}
		else if( state == EnemyState.Dead)
		{
			Die();
		}
//		else
//		{
//			state = EnemyState.Idle;
//		}
	}

	void Die()
	{
		Destroy ( gameObject );
	}

	void Move()
	{
		if( moveVector == null )
		{
			if( manager.GetActivePlayer().transform.position.x > transform.position.x )
			{
				bFacingLeft = false;
			}
			else
			{
				bFacingLeft = true;
			}
		}
		Vector3 v3Move;
		if( bFacingLeft )
		{
			v3Move = new Vector3( -fSpeed , 0 ,0);
		}
		else
		{
			v3Move = new Vector3( fSpeed , 0 ,0);
		}
		transform.Translate(v3Move);
	}

	void Attack( AttackType a_Attack )
	{
		fAttackCurrent += Time.deltaTime;
		if(fAttackTime > fAttackWait)
		{
			a_Attack(true);//start attack
		}
		if(fAttackCurrent > fAttackWait + fAttackTime)
		{
			a_Attack(false);//end attack
		}
	}

	void WalkAttackAttack( bool a_b )
	{
		attack.SetActive(a_b);
	}

	void WalkThrowAttack( bool a_b)
	{
		if(a_b)
		{
			bAttacked = true;
			//TODO:spawn bullet
		}
		else
		{
			//nothing?
		}
	}

	void WalkJumpAttack( bool a_b)
	{
		//TODO: fill this out
	}
}
