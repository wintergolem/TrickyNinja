//Keyboard Controller
//Made by Jason Ege on March 12, 2014 @ 1:33pm
//Designed to use the keyboard to control player 1 in case I forgot to bring my controller to class.

using UnityEngine;
using System.Collections;

public class KeyboardController : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKey (KeyCode.LeftArrow))
		{
			transform.Translate (transform.right*Time.deltaTime);
		}
		else if (Input.GetKey (KeyCode.RightArrow))
		{
			transform.Translate (-transform.right*Time.deltaTime);
		}
	}
}
