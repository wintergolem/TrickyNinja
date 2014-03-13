using UnityEngine;
using System.Collections;

public class MenuAudioScript : MonoBehaviour {

	//AudioSource audio;
	public bool original = false;
	void Awake()
	{
		if( GameObject.FindGameObjectsWithTag("MenuAudio").Length > 1 )
		{
			if( !original )
			{
				Destroy ( gameObject );
			}
		}
		else
		{
			original = true;
		}
	}

	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
		//DontDestroyOnLoad( gameObject );
		//if( !GameObject.FindGameObjectWithTag("MenuAudio") )
			//DontDestroyOnLoad( gameObject );
		if( !audio.enabled )
			audio.enabled = true;
	}

	void FixedUpdate()
	{
		DontDestroyOnLoad( gameObject );
	}
}
