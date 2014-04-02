using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using XInputDotNetPure;

public class GameManager : MonoBehaviour {

	public struct Vibration
	{
		public int index;
		public float fTimeToStop;
	}

	public enum SwapType { Request , Demand , Give };

	struct Requeststruct
	{
		public int iIndex;
		public float fTime;
	}

	public SwapType swapType;
	public PlayerScriptDeven[] agoPlayers;
	public ShadowScript2[] agShadows;
	Queue<Requeststruct> qRequests;

	public float fRequestLifeSpan = 1;

	//demand variables
	public float fDemandLifeSpan = 1;
	float fDemandLastSwap = 0;

	//vibration
	//public float
	List<Vibration> lVibrations;
	// Use this for initialization
	void Start () {
		qRequests = new Queue<Requeststruct>();
		lVibrations = new List<Vibration>();
	}
	
	// Update is called once per frame
	void Update () 
	{
		for( int i = 0; i < lVibrations.Count ; i++ )
		{
			if( lVibrations[i].fTimeToStop < Time.timeSinceLevelLoad )
			{
				GamePads.SetVibration( (PlayerIndex)lVibrations[i].index , 0 , 0 );
				lVibrations.RemoveAt(i);
			}
		}
	}

	public int Swap( int a_index )
	{
		switch ( swapType )
		{
		case GameManager.SwapType.Request:
			return Request( a_index );
			break;
		case GameManager.SwapType.Demand:
			return Demand(a_index);
			break;
		case GameManager.SwapType.Give:

			break;
		default:
			print ("ERROR: bad swapT - Swap(int a_index) - GameManager");
			break;
		}
		return 9;
	}

	int Request(int a_iIndex)
	{
		if( !agoPlayers[a_iIndex].bIncorporeal )
		{
			//find oldest request
			while(qRequests.Count > 0)
			{
				Requeststruct request = qRequests.Dequeue();
				if(request.fTime + fRequestLifeSpan > Time.timeSinceLevelLoad )
				{
					return AssignNewActive(request.iIndex);
				}
			}

		}
		else
		{
			Requeststruct request = new Requeststruct();
			request.iIndex = a_iIndex;
			request.fTime = Time.timeSinceLevelLoad; //used this time variable for no particular reason
			qRequests.Enqueue( request );
			return 0;
		}
		return 0;
	}

	int Demand( int a_iIndex)
	{
		if( fDemandLastSwap + fDemandLifeSpan < Time.timeSinceLevelLoad )
		{
			
			fDemandLastSwap = Time.timeSinceLevelLoad;
			return AssignNewActive(a_iIndex);
		}
		return 9;
	}

	public int AssignNewActive(int a_indexNewActive)
	{
		for( int i = 0 ; i < agoPlayers.Length ; i++)
		{
			if( i == a_indexNewActive )
			{
				agoPlayers[i].bIncorporeal = false;
				ChangeChildrenLayerRecurs( "Player" , agoPlayers[i].transform );
				VibrateController( i , 0.3f , 0.6f );
				//agoPlayers[i].bPlayer1 = true;
			}
			else
			{
				//agoPlayers[i].bPlayer1 = false;
				agoPlayers[i].bIncorporeal = true;
				ChangeChildrenLayerRecurs( "Shadow" , agoPlayers[i].transform );
			}
		}
		qRequests.Clear();
		return a_indexNewActive;
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

	void ChangeChildrenLayerRecurs( string a_sLayerName, Transform a_parent)
	{
		foreach( Transform t in a_parent)
		{
			t.gameObject.layer = LayerMask.NameToLayer(a_sLayerName);
			ChangeChildrenLayerRecurs( a_sLayerName , t );
		}
	}

	public void VibrateController( int a_iIndex , float a_iAmount , float fTime)
	{
		GamePad.SetVibration( (PlayerIndex)a_iIndex , a_iAmount , a_iAmount);
		Vibration v = new Vibration();
		v.index = a_iIndex;
		v.fTimeToStop = Time.timeSinceLevelLoad + fTime;
		lVibrations.Add(v);
	}
}
