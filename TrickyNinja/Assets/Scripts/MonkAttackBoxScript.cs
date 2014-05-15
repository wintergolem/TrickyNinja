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
	public GameObject parent;

	float fAttackTimer = 0.0f;
	
	// Update is called once per frame
	void Update () 
	{
		fAttackTimer -= Time.deltaTime;
	}

	void OnTriggerEnter(Collider c)
	{
		if(c.tag == "Player")
		{
			if(!c.GetComponent<PlayerScriptDeven>().bIncorporeal && fAttackTimer <= 0.0f)
			{
				//print("Monk Hit Player");
				c.gameObject.SendMessage("Hurt", iDamage, SendMessageOptions.DontRequireReceiver);
				fAttackTimer = fMaxAttackTimer;
				if(parent != null)
					parent.SendMessage("VanishBack", SendMessageOptions.DontRequireReceiver);
				else
					transform.parent.SendMessage("VanishBack", SendMessageOptions.DontRequireReceiver);
			}
		}
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
				if(parent != null)
					parent.SendMessage("VanishBack", SendMessageOptions.DontRequireReceiver);
				else
					transform.parent.SendMessage("VanishBack", SendMessageOptions.DontRequireReceiver);
			}
		}
	}
}
