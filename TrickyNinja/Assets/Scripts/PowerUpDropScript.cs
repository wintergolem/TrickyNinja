/// <summary>
/// By Deven Smith
/// 5/2/2014
/// Power up drop script.
/// randomly spawns a power up
/// </summary>

using UnityEngine;
using System.Collections;

public class PowerUpDropScript  : MonoBehaviour
{
	public bool usingHealing = false;
	public GameObject goPowerUp;
	PlayerScriptDeven playerScript;
	[Range(0.0f,0.9f)] public float fDropChance = .1f;

	GameManager scrptInput;

	void Start()
	{
		GameObject player = GameObject.FindGameObjectWithTag("Player");
		playerScript = player.GetComponent<PlayerScriptDeven>();
		scrptInput = playerScript.scrptInput;
			// GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
	}

	void OnDestroy()
	{
		if(Application.isPlaying)
		{
			if(playerScript.iActiveShadows < scrptInput.agShadows.Length)
			{
				if(Random.Range(0.0f, .9f) <= fDropChance)
				{
					Instantiate(goPowerUp, transform.position, goPowerUp.transform.rotation);
				}
			}
			else if( usingHealing)
			{
				if(Random.Range(0.0f, .9f) <= (1.0f - playerScript.fHealth/100))
				{
					Instantiate(goPowerUp, transform.position, goPowerUp.transform.rotation);
				}
			}
		}
	}



}
