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
	GameObject player;

	GameManager scrptInput;

	void Start()
	{
		player = GameObject.FindGameObjectWithTag("Player");
		playerScript = player.GetComponent<PlayerScriptDeven>();
		scrptInput = playerScript.scrptInput;
			// GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
	}

	public void TryToSpawnPowerUp()
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
					Vector3 spawnPoint = new Vector3(transform.position.x, transform.position.y, player.transform.position.z);

					Instantiate(goPowerUp, spawnPoint, goPowerUp.transform.rotation);
				}
			}
		}
	}



}
