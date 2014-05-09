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
	public AudioClip BossSound;
	public float BossSoundDelay;
	

	AudioSource AsEnemyHurt = new AudioSource();
	AudioSource AsEnemyDeath = new AudioSource();
	AudioSource AsPlayerDeath = new AudioSource();
	AudioSource AsShotFired = new AudioSource();
	AudioSource AsStartSwing = new AudioSource();
	AudioSource AsHurtSound = new AudioSource();
	AudioSource AsDeathSound = new AudioSource();
	AudioSource AsBossSound = new AudioSource();
	
	void Awake()
	{
		AsEnemyHurt = gameObject.AddComponent<AudioSource>();
		AsEnemyDeath = gameObject.AddComponent<AudioSource>();
		AsPlayerDeath = gameObject.AddComponent<AudioSource>();
		AsShotFired = gameObject.AddComponent<AudioSource>();
		AsStartSwing = gameObject.AddComponent<AudioSource>();
		AsHurtSound = gameObject.AddComponent<AudioSource>();
		AsDeathSound = gameObject.AddComponent<AudioSource>();
		AsBossSound = gameObject.AddComponent<AudioSource>();
	}

	void OnDestroy()
	{
		Destroy (AsEnemyHurt);
		Destroy (AsEnemyDeath);
		Destroy (AsPlayerDeath);
		Destroy (AsShotFired);
		Destroy (AsStartSwing);
		Destroy (AsHurtSound);
		Destroy (AsDeathSound);
		Destroy (AsBossSound);
	}
	
	//Called if the enemy gets hurt. Inside "EnemyInjuryScript"
	public void EnemyHurt()
	{
		AsEnemyHurt.clip = EnemyDeathSound;
		AsEnemyHurt.PlayDelayed(EnemyDeathSoundDelay);
	}
	
	public void EnemyDeath()
	{
		AsEnemyDeath.clip = EnemyHurtSound;
		AsEnemyDeath.PlayDelayed(EnemyHurtSoundDelay);
	}
	
	//Called when the player dies. Inside "PlayerDamageScript"
	public void PlayerDeath()
	{
		AsPlayerDeath.clip = PlayerDeathSound;
		AsPlayerDeath.PlayDelayed(PlayerDeathSoundDelay);
	}
	
	public void ShotFired()
	{
		AsShotFired.clip = ShootSound;
		AsShotFired.PlayDelayed(ShootSoundDelay);
	}
	
	public void StartSwing(bool shortsword)
	{		
		AsStartSwing.clip = SwingSound;
		if (shortsword == true)
		{
			AsStartSwing.PlayDelayed(SwingSoundDelay);
		}
		else if (!shortsword)
		{
			AsStartSwing.PlayDelayed(LongSwordSwingDelay);
		}
	}
	
	public void StartSwing()
	{
		StartSwing (true);
	}
	
	//Found in "PlayerScriptDeven"
	public void DeathSound()
	{
		AsDeathSound.clip = PlayerDeathSound;
		AsDeathSound.PlayDelayed(PlayerDeathSoundDelay);
	}
	
	public void Hurt(int aiDamage)
	{
		AsHurtSound.clip = EnemyDeathSound;
		AsHurtSound.PlayDelayed(EnemyDeathSoundDelay);
	}
	
	public void Hurt()
	{
		AsHurtSound.clip = EnemyDeathSound;
		AsHurtSound.PlayDelayed(EnemyDeathSoundDelay);
	}
}