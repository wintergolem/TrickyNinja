//Built by: Steven Hoover
//Last Edit by: Steven Hoover

using UnityEngine;
using System.Collections;

public class KeyboardInputScript : MonoBehaviour {

	GameManager gameManager;
	Profile userProfile;

	PlayerScriptDeven[] agPlayers;

	// Use this for initialization
	void Start () 
	{
		gameManager = GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
		userProfile = Profile.Default();
		agPlayers = gameManager.agoPlayers;
	}
	
	// Update is called once per frame
	void Update () 
	{
		int i = 0;
		if ( Input.GetKey(KeyCode.LeftArrow ) )
		{
			agPlayers[i].SendMessage("MoveRight", SendMessageOptions.DontRequireReceiver);
		}
		if( Input.GetKey(KeyCode.RightArrow ) )
		{
			agPlayers[i].SendMessage("MoveLeft", SendMessageOptions.DontRequireReceiver);
		}
		if(  Input.GetKey(KeyCode.UpArrow ) )
		{
			agPlayers[i].SendMessage("LookUp", SendMessageOptions.DontRequireReceiver);
		}
		if(  Input.GetKey(KeyCode.DownArrow ) )
		{
			agPlayers[i].SendMessage("Crouch", SendMessageOptions.DontRequireReceiver);
		}
		
		//Attack and Jump
		if(  Input.GetKeyDown(KeyCode.W ) )
		{
			agPlayers[i].SendMessage("Attack", SendMessageOptions.DontRequireReceiver);
		}
		if( Input.GetKeyDown( KeyCode.Space ) )
		{
			agPlayers[i].SendMessage("Jump", SendMessageOptions.DontRequireReceiver);
		}
		if( Input.GetKeyUp( KeyCode.Space ) )
		{
			agPlayers[i].SendMessage("StoppedJumping", SendMessageOptions.DontRequireReceiver);
		}
		
		//swaps
		if( Input.GetKeyDown( KeyCode.E ) )
		{
			if( gameManager.bMultiplayer )
				gameManager.Swap(i);
			else
				agPlayers[i].SendMessage("Swap" , -1 , SendMessageOptions.DontRequireReceiver);
		}

//		agPlayers[i].SendMessage("SetYAxis", GamePads.GetAxis( "LeftStickY", (PlayerIndex)i ), SendMessageOptions.DontRequireReceiver);
//		agPlayers[i].SendMessage("SetXAxis", GamePads.GetAxis( "LeftStickX", (PlayerIndex)i ), SendMessageOptions.DontRequireReceiver);

	}
}
