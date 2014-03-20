using UnityEngine;
using System.Collections;
using XInputDotNetPure;

public class TestGamePadInputScript : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		if( GamePads.IsButtonDown( PlayerIndex.One , "A") )
		{
			print ("Yay!");
		}
	}
}
