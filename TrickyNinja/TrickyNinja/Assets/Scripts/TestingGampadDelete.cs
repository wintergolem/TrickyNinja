using UnityEngine;
using System.Collections;
using GamepadInput;

public class TestingGampadDelete : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		print( GamePad.GetTrigger (GamePad.Trigger.LeftTrigger, GamePad.Index.One).ToString() );
	}
}
