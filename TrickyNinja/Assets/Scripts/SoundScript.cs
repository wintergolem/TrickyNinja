//SoundScript by Jason Ege
//May 1, 2014
//
//To make it work, apply the following code:
//
/*SoundScript soundScript;
void Awake()
{
	GameObject soundManager = GameObject.FindGameObjectWithTag("SoundManager");
	soundScript = soundManager.GetComponent<SoundScript>();
}*/
//...
//soundScript.SendMessage ("Method Name", SendMessageOptions.DontRequireReceiver);
//
//The bottom line goes wherever you want the sound to be played.

//Using directives
using UnityEngine;
using System.Collections;

public class SoundScript : MonoBehaviour {

	public AudioClip PlayerDeathSound;
	public float PlayerDeathSoundDelay;
	public AudioClip EnemyDeathSound;
	public float EnemyDeathSoundDelay;
	public AudioClip EnemyHurtSound;
	public float EnemyHurtSoundDelay;
	public AudioClip ShootSound;
	public float ShootSoundDelay;
	public AudioClip SwingSound;
	public float SwingSoundDelay;
	public float LongSwordSwingDelay;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
	}
	
	//Called if the enemy gets hurt. Inside "EnemyInjuryScript"
	public void EnemyHurt()
	{
		audio.clip = EnemyDeathSound;
		audio.PlayDelayed(EnemyHurtSoundDelay);
	}
	
	public void EnemyDeath()
	{
		audio.clip = EnemyHurtSound;
		audio.PlayDelayed(EnemyDeathSoundDelay);
	}
	
	//Called when the player dies. Inside "PlayerDamageScript"
	public void PlayerDeath()
	{
		audio.clip = PlayerDeathSound;
		audio.PlayDelayed(PlayerDeathSoundDelay);
	}
	
	public void ShotFired()
	{
		audio.clip = ShootSound;
		audio.PlayDelayed(ShootSoundDelay);
	}
	
	public void StartSwing(bool shortsword)
	{
		audio.clip = SwingSound;
		if (shortsword)
		{
			audio.PlayDelayed(SwingSoundDelay);
		}
		else if (!shortsword)
		{
			audio.PlayDelayed(LongSwordSwingDelay);
		}
	}
	
	//Found in "PlayerScriptDeven"
	public void DeathSound()
	{
		audio.clip = PlayerDeathSound;
		audio.PlayDelayed(PlayerDeathSoundDelay);
	}
	
	public void Hurt(int aiDamage)
	{
		audio.clip = EnemyDeathSound;
		audio.PlayDelayed(EnemyDeathSoundDelay);
	}
	
	public void Hurt()
	{
		audio.clip = EnemyDeathSound;
		audio.PlayDelayed(EnemyDeathSoundDelay);
	}
}