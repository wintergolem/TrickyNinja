using UnityEngine;
using System.Collections;

public class CheckPointScript : MonoBehaviour 
{
	void OnTriggerEnter(Collider c)
	{
		if(c.tag == "Player")
		{
			PlayerScriptDeven.vPlayerSpawnPoint = transform.position;
			gameObject.SetActive(false);
		}
	}

	void OnTriggerStay(Collider c)
	{
		if(c.tag == "Player")
		{
			PlayerScriptDeven.vPlayerSpawnPoint = transform.position;
			gameObject.SetActive(false);
		}
	}
}
