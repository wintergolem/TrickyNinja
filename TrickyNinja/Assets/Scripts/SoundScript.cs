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

	public float fMinSoundPitch;
	public float fMaxSoundPitch;
	public AudioClip PlayerDeathSound;
	public AudioClip PlayerDeathSoundGirl;
	public float PlayerDeathSoundDelay;
	public AudioClip EnemyHurtSound;
	public float EnemyHurtSoundDelay;
	public AudioClip EnemyDeathSound;
	public float EnemyDeathSoundDelay;
	public bool bSeparateNinjaSounds;
	public AudioClip NinjaHurtSound;
	public float NinjaHurtSoundDelay;
	public AudioClip NinjaDeathSound;
	public float NinjaDeathSoundDelay;
	public bool bSeparateMonkSounds;
	public AudioClip MonkHurtSound;
	public float MonkHurtSoundDelay;
	public AudioClip MonkDeathSound;
	public float MonkDeathSoundDelay;
	public AudioClip ShootSound;
	public float ShootSoundDelay;
	public AudioClip ShortSwingSound;
	public float SwingSoundDelay;
	public AudioClip LongSwingSound;
	public float LongSwordSwingDelay;
	public AudioClip BossSound;
	public float BossSoundDelay;
	public AudioClip StarStickSound;
	public float StarStickSoundDelay;
	

	AudioSource AsEnemyHurt = new AudioSource();
	AudioSource AsEnemyDeath = new AudioSource();
	AudioSource AsPlayerDeath = new AudioSource();
	AudioSource AsShotFired = new AudioSource();
	AudioSource AsStartSwing = new AudioSource();
	AudioSource AsHurtSound = new AudioSource();
	AudioSource AsDeathSound = new AudioSource();
	AudioSource AsBossSound = new AudioSource();
	AudioSource AsStarStick = new AudioSource();
	
	void Awake()
	{
		AsPlayerDeath = gameObject.AddComponent<AudioSource>();
		AsEnemyHurt = gameObject.AddComponent<AudioSource>();
		AsEnemyDeath = gameObject.AddComponent<AudioSource>();
		AsShotFired = gameObject.AddComponent<AudioSource>();
		AsStartSwing = gameObject.AddComponent<AudioSource>();
		AsHurtSound = gameObject.AddComponent<AudioSource>();
		AsDeathSound = gameObject.AddComponent<AudioSource>();
		AsBossSound = gameObject.AddComponent<AudioSource>();
		AsStarStick = gameObject.AddComponent<AudioSource>();
	}

	void OnDestroy()
	{
		Destroy (AsPlayerDeath);
		Destroy (AsEnemyHurt);
		Destroy (AsEnemyDeath);
		Destroy (AsShotFired);
		Destroy (AsStartSwing);
		Destroy (AsHurtSound);
		Destroy (AsDeathSound);
		Destroy (AsBossSound);
		Destroy (AsStarStick);
	}
	
	//Default enemy hurt sound. Called whenever an enemy is not set to use their own set of sounds.
	public void EnemyHurt()
	{
		AsEnemyHurt.pitch = Random.Range(fMinSoundPitch, fMaxSoundPitch);
		AsEnemyHurt.clip = EnemyHurtSound;
		AsEnemyHurt.PlayDelayed(EnemyHurtSoundDelay);
	}
	
	//Default enemy death sound. Called whenever an enemy is not set to use their own set of sounds.
	public void EnemyDeath()
	{
		AsEnemyDeath.pitch = Random.Range (fMinSoundPitch, fMaxSoundPitch);
		AsEnemyDeath.clip = EnemyDeathSound;
		AsEnemyDeath.PlayDelayed (EnemyDeathSoundDelay);
	}
	
	//Ninja hurt sound. Called in the Ninja's script. If Ninja does not have its own set of sounds, default enemy sounds are used.
	public void NinjaHurt()
	{
		if (bSeparateNinjaSounds)
		{
			AsEnemyHurt.pitch = Random.Range (fMinSoundPitch, fMaxSoundPitch);
			AsEnemyHurt.clip = NinjaHurtSound;
			AsEnemyHurt.PlayDelayed (NinjaHurtSoundDelay);
		}
		else if (!bSeparateNinjaSounds)
		{
			EnemyHurt ();
		}
	}
	
	//Ninja death sound. Called in the Ninja's script. If Ninja does not have its own set of sounds, default enemy sounds are used.
	public void NinjaDeath()
	{
		if (bSeparateNinjaSounds)
		{
			AsEnemyDeath.clip = NinjaDeathSound;
			AsEnemyDeath.pitch = Random.Range (fMinSoundPitch, fMaxSoundPitch);
			AsEnemyDeath.PlayDelayed (NinjaDeathSoundDelay);
		}
		else if (!bSeparateNinjaSounds)
		{
			EnemyDeath ();
		}
	}
	
	public void MonkHurt()
	{
		if (bSeparateMonkSounds)
		{
			AsEnemyHurt.clip = MonkHurtSound;
			AsEnemyHurt.pitch = Random.Range (fMinSoundPitch, fMaxSoundPitch);
			AsEnemyHurt.PlayDelayed (MonkHurtSoundDelay);
		}
		else if (!bSeparateMonkSounds)
		{
			EnemyHurt ();
		}
	}
	
	public void MonkDeath()
	{
		if (bSeparateMonkSounds)
		{
			AsEnemyDeath.clip = MonkDeathSound;
			AsEnemyDeath.pitch = Random.Range (fMinSoundPitch, fMaxSoundPitch);
			AsEnemyDeath.PlayDelayed (MonkDeathSoundDelay);
		}
		else if (!bSeparateMonkSounds)
		{
			EnemyDeath ();
		}
	}
	
	//Called when the player dies. Inside "PlayerDamageScript"
	public void PlayerDeath(string sName)
	{
		if (sName == "Kama_Prefab" || sName == "kama_prefab")
		{
			AsDeathSound.clip = PlayerDeathSoundGirl;
			AsDeathSound.PlayDelayed(PlayerDeathSoundDelay);
		}
		else
		{
			AsPlayerDeath.clip = PlayerDeathSound;
			AsPlayerDeath.PlayDelayed(PlayerDeathSoundDelay);
		}
	}
	
	public void ShotFired()
	{
		AsShotFired.clip = ShootSound;
		AsShotFired.PlayDelayed(ShootSoundDelay);
	}
	
	public void StartSwing(bool shortsword)
	{
		if (shortsword == true)
		{
			AsStartSwing.clip = ShortSwingSound;
			AsStartSwing.PlayDelayed(SwingSoundDelay);
		}
		else if (!shortsword)
		{
			AsStartSwing.clip = LongSwingSound;
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

	public void PlayStarStickSound()
	{
		AsStarStick.clip = StarStickSound;
		AsStarStick.PlayDelayed (StarStickSoundDelay);
	}

	public void PlayBossSound()
	{
		AsBossSound.clip = BossSound;
		AsBossSound.PlayDelayed (BossSoundDelay);
	}
}