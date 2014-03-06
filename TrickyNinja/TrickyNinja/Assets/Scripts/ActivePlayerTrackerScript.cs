using UnityEngine;
using System.Collections;

public class ActivePlayerTrackerScript : MonoBehaviour 
{
	InputCharContScript scrptInput;
	public GameObject goCamPrefab;
	public float fIndicatorHeight = 2.0f;

	// Use this for initialization
	void Start () 
	{
		scrptInput = goCamPrefab.GetComponent<InputCharContScript>();
	}
	
	// Update is called once per frame
	void Update () 
	{
		foreach(GameObject player in scrptInput.agPlayer)
		{
			PlayerScriptSteven playerScript;
			playerScript = player.GetComponent<PlayerScriptSteven>();
			if(!playerScript.bIncorporeal)
			{
				transform.position = new Vector3( player.transform.position.x, player.transform.position.y + fIndicatorHeight, player.transform.position.z );
				break;
			}
		}
	}
}
