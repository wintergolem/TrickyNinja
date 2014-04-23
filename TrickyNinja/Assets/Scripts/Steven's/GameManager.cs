//Built by: Steven Hoover
//

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
	public bool bMultiplayer = false;
	public SwapType swapType;
	public PlayerScriptDeven[] agoPlayers;
	public ShadowScript2[] agShadows;
	public ActivePlayerTrackerScript tracker;
	public FadeToBlackScript fadeToBlack;
	public GamePadInputScript gamePadInput;
	public KeyboardInputScript keyInput;
	public float fEndGameLine = -500;

	bool bCheckTracker;
	bool bCheckedWebBuild = false;
	bool bWebBuild = false;

	new AudioSource audio;
	public AudioClip acBackgroundMusic;
	Queue<Requeststruct> qRequests;

	public float fRequestLifeSpan = 1;

	//demand variables
	public float fDemandLifeSpan = 1;
	float fDemandLastSwap = 0;

	//vibration
	//public float
	List<Vibration> lVibrations;

	void Awake()
	{
		bCheckedWebBuild = true;
		if( Application.platform == RuntimePlatform.WindowsWebPlayer )
		{
			bWebBuild = true;
		}

		if( bWebBuild )
		{
			gamePadInput.enabled = false;
			keyInput.enabled = true;
		}
	}

	// Use this for initialization
	void Start () {
		qRequests = new Queue<Requeststruct>();
		lVibrations = new List<Vibration>();

		if( GetComponent<AudioSource>() == null )
		{
			gameObject.AddComponent<AudioSource>();
			audio = GetComponent<AudioSource>();
			audio.clip = acBackgroundMusic;
			audio.loop = true;
			audio.Play();
		}

	}
	
	// Update is called once per frame
	void Update () 
	{
		//check tracker
		if( bCheckTracker )
		{
			if( tracker.bAtPlayer )
			{
				AssignNewActive( tracker.iIndex );
				tracker.DeActivate();
				bCheckTracker = false;
			}
		}

		//check vibrations
		for( int i = 0; i < lVibrations.Count ; i++ )
		{
			if( lVibrations[i].fTimeToStop < Time.timeSinceLevelLoad )
			{
				GamePads.SetVibration( (PlayerIndex)lVibrations[i].index , 0 , 0 );
				lVibrations.RemoveAt(i);
			}
		}

		if( GetActivePlayer().transform.position.x < fEndGameLine )
		{
			EndGame();
		}
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
		//return 9;
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
					SendTracker(request.iIndex);
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

	int Demand( int a_iIndex)
	{
		if( fDemandLastSwap + fDemandLifeSpan < Time.timeSinceLevelLoad )
		{
			fDemandLastSwap = Time.timeSinceLevelLoad;
			SendTracker( a_iIndex );
			//return AssignNewActive(a_iIndex);
		}
		return 9;
	}

	public bool SendTracker( int a_indexNewActive )
	{
		ChangeChildrenLayerRecurs( "Shadow" , agoPlayers[a_indexNewActive].transform );
		for( int i = 0; i < agoPlayers.Length; i++)
			if( !agoPlayers[i].bIncorporeal )
		{
				agoPlayers[i].bIncorporeal = true;
				ChangeChildrenLayerRecurs( "Shadow" , agoPlayers[i].transform );
		}

		bCheckTracker = true;
		return tracker.Set( a_indexNewActive , agoPlayers[a_indexNewActive].transform );
	}

	public void AssignNewActive(int a_indexNewActive)
	{
		for( int i = 0 ; i < agoPlayers.Length ; i++)
		{
			if( i == a_indexNewActive )
			{
				agoPlayers[i].bIncorporeal = false;
				agoPlayers[i].tag = "Player";
				agoPlayers[i].gameObject.layer = LayerMask.NameToLayer("Player");
				ChangeChildrenLayerRecurs( "Player" , agoPlayers[i].transform );
				VibrateController( i , 0.3f , 0.6f );
				agoPlayers[a_indexNewActive].SendMessage("Swap", a_indexNewActive , SendMessageOptions.DontRequireReceiver);
				//agoPlayers[i].bPlayer1 = true;
			}
			else
			{
				//agoPlayers[i].bPlayer1 = false;
				agoPlayers[i].bIncorporeal = true;
				agoPlayers[i].tag = "Shadow";
				agoPlayers[i].gameObject.layer = LayerMask.NameToLayer("Shadow");
				ChangeChildrenLayerRecurs( "Shadow" , agoPlayers[i].transform );
			}
		}
		qRequests.Clear();
		//return a_indexNewActive;
	}

	public GameObject GetActivePlayer()
	{
		for( int i = 0; i < agoPlayers.Length; i++)
		{
			if( !agoPlayers[i].bIncorporeal )
			{
				return agoPlayers[i].gameObject;
			}
		}
		//print ("ERROR: no active player  GetActivePlayer - GameManager class");
		return tracker.gameObject;
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

	public void EndGame()
	{
		fadeToBlack.bDemoOver = true;
	}
}
