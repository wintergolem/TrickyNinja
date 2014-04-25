using UnityEngine;
using System.Collections;

public class GeneralNinjaScript : MonoBehaviour {

	public enum EnemyType { WalkThrow, WalkAttack , WalkJump };
	public enum EnemyState {Move , Attack , KnockBack, Dead, Idle };

	public EnemyType type;
	public EnemyState state;

	public GameObject attack;

	GameManager manager;

	Vector3 moveVector;

	bool bFacingLeft;

	float fAttackCurrent = 0;
	float fTargetY = 0;

	public float fSpeed;
	public float fAttackDistance;
	public float fMaxDistanceFromPlayer;
	public float fAttackTime;
	public float fAttackWait;

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
	// Update is called once per frame
	void Update () 
	{
		switch(type)
		{
		case EnemyType.WalkAttack:
			WalkAttackUpdate();
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
			if( manager.GetActivePlayer().transform.position.x > transform.position.x )
			{
				bFacingLeft = false;
			}
			else
			{
				bFacingLeft = true;
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
			break;

		case EnemyState.Attack:
			fAttackCurrent += Time.deltaTime;
			if(fAttackTime > fAttackWait)
			{
				attack.SetActive(true);
			}
			if(fAttackCurrent > fAttackWait + fAttackTime)
			{
				attack.SetActive(false);
			}
			break;

		case EnemyState.KnockBack:
			break;

		default:
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
		else if( state == EnemyState.Attack || ( state != EnemyState.Attack && Vector3.Distance( transform.position , manager.GetActivePlayer().transform.position ) < fAttackDistance) )
		{
			state = EnemyState.Attack;
		}
		else if( state != EnemyState.KnockBack && state != EnemyState.Dead && state != EnemyState.Attack)
		{
			state = EnemyState.Move;
		}
		else if( state == EnemyState.Dead)
		{
			Die();
		}
		else
		{
			state = EnemyState.Idle;
		}
	}

	void Die()
	{
		Destroy ( gameObject );
	}
}
