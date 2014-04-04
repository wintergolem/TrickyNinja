using UnityEngine;
using System.Collections;

public class RunningNinja : MonoBehaviour {

	GameManager manager;
	GameObject goPlayer;
	bool bVecterSet;

	// Use this for initialization
	void Start () {
		//manager = GameObject.FindGameObjectWithTag("GameManager");
	}
	
	// Update is called once per frame
	void Update () 
	{
	
		//update player variable
		goPlayer = manager.GetActivePlayer();

		if( !bVecterSet )
		{

		}
		else
		{

		}
	}
}
