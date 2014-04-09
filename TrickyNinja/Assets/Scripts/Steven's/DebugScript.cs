//script to be placed on gameManager and handles actions that shouldn't be in final game
//built by: Steven Hoover
//Last edited by: Steven Hoover

using UnityEngine;
using System.Collections;

public class DebugScript : MonoBehaviour {

	public KeyCode RespawnKey;
	public KeyCode RestartKey;
	public KeyCode LevelWhichKey;
	public string multiplayer;
	public string single;
	public GameManager gameManager;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () 
	{

		if (Input.GetKeyDown (RespawnKey)) 
		{
			Application.LoadLevel (Application.loadedLevel);
		} 
		else if (Input.GetKeyDown (RestartKey))
		{
			PlayerScriptDeven.vPlayerSpawnPoint = Vector3.zero;
			Application.LoadLevel (Application.loadedLevel);
		}
		else if( Input.GetKeyDown(LevelWhichKey) )
		{
			PlayerScriptDeven.vPlayerSpawnPoint = Vector3.zero;
			if( !gameManager.bMultiplayer )
				Application.LoadLevel( multiplayer );
			else
				Application.LoadLevel( single );
		}
	}
}
