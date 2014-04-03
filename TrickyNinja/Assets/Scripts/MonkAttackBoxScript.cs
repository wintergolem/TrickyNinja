/// <summary>
/// By Deven Smith
/// 4/2/2014
/// Monk attack box script.
/// 
/// </summary>
using UnityEngine;
using System.Collections;

public class MonkAttackBoxScript : MonoBehaviour 
{
	public int iDamage = 25;
	public float fMaxAttackTimer = 1.0f;

	float fAttackTimer = 0.0f;
	
	// Update is called once per frame
	void Update () 
	{
		fAttackTimer -= Time.deltaTime;
	}

	void OnTriggerStay(Collider c)
	{
		if(c.tag == "Player")
		{
			if(!c.GetComponent<PlayerScriptDeven>().bIncorporeal && fAttackTimer <= 0.0f)
			{
				//print("Monk Hit Player");
				c.gameObject.SendMessage("Hurt", iDamage, SendMessageOptions.DontRequireReceiver);
				fAttackTimer = fMaxAttackTimer;
			}
		}
	}
}
