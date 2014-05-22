/// <summary>
/// By Deven Smith
/// 2/5/2014
/// Last edited by Steven Hoover
/// Player attack script.
/// receives a direction from the player and travels in it
/// </summary>

using UnityEngine;
using System.Collections;

public class PlayerAttackScript : MonoBehaviour {

	public int iDamage = 100;
	public ThrowingStarScript star;
	Vector3 vDirection;
	public float fMoveSpeed = 1.0f;
	public float fLifeTime = 3.0f;
	public GameObject gPow;
	bool bMove = true;

	// Use this for initialization
	void Start () {
	
	}

	void TriggerCheck(Collider c)
	{
		if (c.gameObject.tag == "Enemy")
		{
			c.gameObject.SendMessage("Hurt", iDamage, SendMessageOptions.DontRequireReceiver);
			//Instantiate(gPow, new Vector3(transform.position.x, transform.position.y, transform.position.z+1), gPow.transform.rotation);
			Destroy (gameObject);
		}
		else if( c.gameObject.tag == "EnemyBullet" )
		{
			Instantiate(gPow, new Vector3(transform.position.x, transform.position.y, transform.position.z+1), gPow.transform.rotation);
			Destroy ( c.gameObject );
			Destroy ( this.gameObject );
		}


	}
	
	void OnTriggerStay(Collider c)
	{
		TriggerCheck(c);
	}
	void OnTriggerEnter(Collider c)
	{
		TriggerCheck(c);
		if( c.tag.ToLower() == "ground" )
		{
			gameObject.collider.enabled = false;
			bMove = false;
			star.bSpin = false;
			Instantiate(gPow, new Vector3(transform.position.x, transform.position.y, transform.position.z+1), gPow.transform.rotation);
		}
	}
	
	// Update is called once per frame
	//moves it forward and removes time from its life and if its life is up deletes it
	void Update () 
	{
		if(bMove)
			transform.Translate (vDirection * fMoveSpeed * Time.deltaTime);

		fLifeTime -= Time.deltaTime;

		if (fLifeTime <= 0.0f)
			Destroy (gameObject);
	}


	//a function to call to tell the attack in waht direction to travel
	void SetDirection(Vector3 newDirection)
	{
		vDirection = newDirection.normalized;
	}

	public void KillBullet(GameObject bullettokill)
	{
		Destroy (bullettokill); //Bullet should no longer exist.
		//This typically happens when a bullet hits a player or an enemy.
	}
}
