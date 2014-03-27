using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameManager : MonoBehaviour {

	public enum SwapType { Request , Demand , Give };

	struct Requeststruct
	{
		public int iIndex;
		public float fTime;
	}
	public SwapType swapType;
	public PlayerScriptDeven[] agoPlayers;
	Queue<Requeststruct> qRequests;

	public float fRequestLifeSpan = 1;
	// Use this for initialization
	void Start () {
		qRequests = new Queue<Requeststruct>();

	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void Swap( int a_index )
	{
		switch ( swapType )
		{
		case GameManager.SwapType.Request:
			Request( a_index );
			break;
		case GameManager.SwapType.Demand:
			Demand(a_index);
			break;
		case GameManager.SwapType.Give:

			break;
		default:
			print ("ERROR: bad swapT - Swap(int a_index) - GameManager");
			break;
		}
	}

	void Request(int a_iIndex)
	{
		if( !agoPlayers[a_iIndex].bIncorporeal )
		{
			//find oldest request
			while(qRequests.Count > 0)
			{
				Requeststruct request = qRequests.Dequeue();
				if(request.fTime + fRequestLifeSpan > Time.timeSinceLevelLoad )
				{
					AssignNewActive(request.iIndex);
					break;
				}
			}

		}
		else
		{
			Requeststruct request = new Requeststruct();
			request.iIndex = a_iIndex;
			request.fTime = Time.timeSinceLevelLoad; //used this time variable for no particular reason
			qRequests.Enqueue( request );
		}
	}

	void Demand( int a_iIndex)
	{
		AssignNewActive(a_iIndex);
	}

	public void AssignNewActive(int a_indexNewActive)
	{
		for( int i = 0 ; i < agoPlayers.Length ; i++)
		{
			if( i == a_indexNewActive )
			{
				agoPlayers[i].bIncorporeal = false;
				agoPlayers[i].gameObject.layer = LayerMask.NameToLayer("Player");
				//agoPlayers[i].bPlayer1 = true;
			}
			else
			{
				//agoPlayers[i].bPlayer1 = false;
				agoPlayers[i].bIncorporeal = true;
				agoPlayers[i].gameObject.layer = LayerMask.NameToLayer("Shadow");
			}
		}
		qRequests.Clear();
	}

	public PlayerScriptDeven GetActivePlayer()
	{
		for( int i = 0; i < agoPlayers.Length; i++)
		{
			if( !agoPlayers[i].bIncorporeal )
			{
				return agoPlayers[i];
			}
		}
		print ("ERROR: no active player  GetActivePlayer - GameManager class");
		return new PlayerScriptDeven();
	}
}
