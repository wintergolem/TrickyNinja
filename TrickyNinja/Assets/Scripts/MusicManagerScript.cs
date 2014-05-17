using UnityEngine;
using System.Collections;

public class MusicManagerScript : MonoBehaviour {

	GameObject MusicManager;
	public AudioClip acMusicToPlay;
	//AudioSource asMusicAudio = new AudioSource();
	bool transitioning;

	// Use this for initialization
	void Awake () {
		MusicManager = GameObject.FindGameObjectWithTag ("MusicManager");
		//asMusicAudio = MusicManager.AddComponent<AudioSource>();
		transitioning = false;
	}
	
	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Player")
		{
			transitioning = true;
		}
	}
	
	// Update is called once per frame
	void Update () {
		if (MusicManager.audio.volume > 0.1f && transitioning == true)
		{
			MusicManager.audio.volume -= Time.deltaTime * 0.25f;
		}
		if (MusicManager.audio.volume <= 0.1f && transitioning == true)
		{
			MusicManager.audio.volume = 1.0f;
			MusicManager.audio.clip = acMusicToPlay;
			MusicManager.audio.Play ();
			MusicManager.audio.loop = true;
			transitioning = false;
			gameObject.SetActive (false);
		}
	}
}
