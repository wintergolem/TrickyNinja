//TheScriptThatPlaysSounds
//The script that plays sounds- specifically death and hurt sounds.

using UnityEngine;
using System.Collections;

public class TheScriptThatPlaysSounds : MonoBehaviour {

	public AudioClip[] acAudio;

	public void Hurt (int aiDamage)
	{
		audio.clip = acAudio[0];
		audio.Play ();
	}
	
	public void DeathSound()
	{
		audio.clip = acAudio[1];
		audio.Play();
	}
}
