using UnityEngine;
using System.Collections;

public class KillPlayer : MonoBehaviour 
{
	
	// Update is called once per frame
	void Update () 
	{
		if(Input.GetKeyDown(KeyCode.Backspace))
			gameObject.SendMessage("Hurt", 9001);
	
	}
}
