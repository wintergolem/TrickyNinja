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
	public GameObject goPowerUp;
	public PlayerScriptDeven playerScript;
	public float fDropChance = .1f;

	GameManager scrptInput;

	void Start()
	{
		scrptInput = playerScript.scrptInput;
			// GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
	}

	void OnDestroy()
	{
		if(playerScript.iActiveShadows < scrptInput.agShadows.Length)
		{
			if(Random.Range(0.0f, .9f) <= fDropChance)
			{
				Instantiate(goPowerUp, transform.position, goPowerUp.transform.rotation);
			}
		}
	}



}
