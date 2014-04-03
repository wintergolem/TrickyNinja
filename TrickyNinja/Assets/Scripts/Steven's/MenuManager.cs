//Built by: Steven Hoover
//Last Edited by: Steven Hoover

using UnityEngine;
using System.Collections;

public class MenuManager : MonoBehaviour {

	// Use this for initialization
	public AudioSource audioSource;
	bool bFirst = false;
	void Awake()
	{
		if( GameObject.FindGameObjectsWithTag("MenuManager").Length < 2 )
			bFirst = true;
		if( GameObject.FindGameObjectWithTag("GameManager") )
			Destroy (this.gameObject);
	}

	void Start () 
	{
		if( ! bFirst )
			Destroy ( this.gameObject );
		DontDestroyOnLoad(this.gameObject);
	}
	
	// Update is called once per frame
	void Update () 
	{
		if( !audio.isPlaying )
		{
			audio.Play();
		}
	}
}
