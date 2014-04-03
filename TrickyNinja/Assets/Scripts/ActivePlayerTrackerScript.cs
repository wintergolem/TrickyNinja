using UnityEngine;
using System.Collections;

public class ActivePlayerTrackerScript : MonoBehaviour 
{
	//InputCharContScript scrptInput;
	//public GameObject goCamPrefab;
	public float fIndicatorHeight = 2.0f;
	public bool bActive = false;
	public bool bAtPlayer = false;
	public Transform playerToGoTo;
	public float fMoveSpeed = 5;

	public int iIndex;
	// Use this for initialization
	void Start () 
	{

	}
	
	// Update is called once per frame
	void Update () 
	{
		gameObject.GetComponent<MeshRenderer>().enabled = bActive;

		if( bActive )
		{
			Vector3 v3Move = playerToGoTo.position - transform.position;
			v3Move = v3Move.normalized * Time.deltaTime * fMoveSpeed;
			transform.Translate(v3Move);

			if( Mathf.Abs( Vector3.Distance( transform.position , playerToGoTo.position ) ) < fMoveSpeed * Time.deltaTime)
			{
				bAtPlayer = true;
			}
			else
			{
				bAtPlayer = false;
			}
		}
		else
		{
			transform.position = playerToGoTo.position;
		}
	}

	public bool Set ( int a_iIndex , Transform a_player ) //returns
	{
		if( bActive )
		{
			return false;
		}
		else
		{
			iIndex = a_iIndex;
			playerToGoTo = a_player;
			bActive = true;
			return true;
		}
	}

	public void DeActivate()
	{
		iIndex = 0;
		//playerToGoTo = null;
		bActive = false;
		bAtPlayer = false;
	}
}
