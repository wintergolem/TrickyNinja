using UnityEngine;
using System.Collections;

public class PlayerDamageScript : EntityScript {

	// Use this for initialization
	void Start () {
		
	}
	
	void OnCollisionEnter(Collision c)
	{
		if (c.gameObject.tag == "Enemy" || c.gameObject.tag == "EnemyBullet")
		{
			fHealth--;
		}
	}
	
	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Enemy" || c.gameObject.tag == "EnemyBullet")
		{
			fHealth--;
		}
	}
	
	bool OutOfHealth()
	{
		if (fHealth <= 0)
		{
			return true;
		}
		return false;
	}
	
	public override void Die ()
	{
		Destroy (gameObject);
	}
	
	// Update is called once per frame
	void Update () {
		if (OutOfHealth())
		{
			Die ();
		}
	}
}
