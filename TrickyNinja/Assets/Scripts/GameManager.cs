using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameManager : MonoBehaviour {

	struct Requeststruct
	{
		public int iIndex;
		public float fTime;
	}

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

	public void Request(int a_iIndex)
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

	public void AssignNewActive(int a_indexNewActive)
	{
		for( int i = 0 ; i < agoPlayers.Length ; i++)
		{
			if( i == a_indexNewActive )
			{
				agoPlayers[i].bIncorporeal = false;
				//agoPlayers[i].bPlayer1 = true;
			}
			else
			{
				//agoPlayers[i].bPlayer1 = false;
				agoPlayers[i].bIncorporeal = true;
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
