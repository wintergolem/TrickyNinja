//EnemyBlock Script by Jason Ege
//Last edited by Jason Ege on March 7, 2014 @ 11:00am
//Goes along with the trigger box that blocks an enemy from entering a specified area.
//If an enemy collides with the EnemyBlocker box, it is destroyed instantly. This is
//handy for preventing enemies from falling from the ceiling to the ground and such.

using UnityEngine;
using System.Collections;

public class EnemyBlockerScript : MonoBehaviour {

	// Use this for initialization
	void Start () {
	}
	
	void OnCollisionEnter(Collision c)
	{
		if (c.gameObject.tag == "Enemy")
		{
			Destroy (c.gameObject);
		}
	}
	
	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Enemy")
		{
			Destroy (c.gameObject);
		}
	}
	
	// Update is called once per frame
	void Update () {
	}
}
