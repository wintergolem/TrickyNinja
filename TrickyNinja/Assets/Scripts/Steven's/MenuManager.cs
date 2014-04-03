//Built by: Steven Hoover
//Last Edited by: Steven Hoover

using UnityEngine;
using System.Collections;

public class MenuManager : MonoBehaviour {

	// Use this for initialization
	public AudioSource audioSource;
	void Awake()
	{
		if( GameObject.FindGameObjectWithTag("GameManager") )
			Destroy (this);
	}

	void Start () 
	{
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
