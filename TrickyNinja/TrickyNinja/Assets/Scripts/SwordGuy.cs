//SwordGuy Script by Jason Ege
//Last edited on March 13, 2014

using UnityEngine;
using System.Collections;

public class SwordGuy : EnemyScript {

	public float fSpeed; //The speed of the SwordGuy, defined in the inspector interface.
	public float fMaxSpeed; //The maximum speed allowed for the sword guy to accelerate to.
	public Vector3 vOffset; //The spawning offset of the swordguy
	
	bool bGrounded;
	bool bBeenHit;

	GameObject gPlayer;	//The player game object.
	public float fAliveDistance; //How far away from the player the enemy has to be before he is destroyed to free up resources.

	// Use this for initialization
	void Start () {
		gPlayer = GameObject.FindGameObjectWithTag("Player"); //The player is any object tagged as the player.
		if (transform.position.x > gPlayer.transform.position.x)
		{
			fSpeed = -fSpeed;
		}
		bGrounded = false;
		bBeenHit = false;
	}
	
	//The Die method, derived from the "EntityScript".
	public override void Die()
	{
		Destroy (gameObject); //Destroy the local object that this script it attached to.
	}
	
	//The method that determines what happens when the player gets hurt.
	public override void Hurt(int aiDamage)
	{
		rigidbody.AddForce (-fSpeed*2, 25.0f, 0.0f, ForceMode.Force);
		bBeenHit = true;
		fHealth--;
	}
	//The function that determines how the swordguy should move, derived from the "EntityScript" class.
	public override void Move ()
	{
		//rigidbody.AddForce(transform.forward*fSpeed*Time.deltaTime, ForceMode.VelocityChange);
		//rigidbody.detectCollisions = false;
		//rigidbody.AddForce (0.0f, -9.8f*Time.deltaTime, 0.0f, ForceMode.VelocityChange); //Manually apply gravity
		if (rigidbody.velocity.x >= fMaxSpeed*Time.deltaTime || rigidbody.velocity.x <= -fSpeed*Time.deltaTime)
		{
			rigidbody.AddForce(new Vector3(fSpeed*Time.deltaTime, rigidbody.velocity.y, rigidbody.velocity.z), ForceMode.Acceleration);
		}
		else
		{
			rigidbody.AddForce(new Vector3(fSpeed*Time.deltaTime, 0.0f, 0.0f), ForceMode.Force);
		}
		RaycastHit hit;
		if (Physics.Raycast (transform.position, -transform.up, out hit, 3.0f))
		{
			if (hit.collider.tag == "Ground" || hit.collider.tag == "Enemy")
			{
				bGrounded = true;
			}
			else
			{
				bGrounded = false;
				//rigidbody.AddForce(0.0f, -9.8f, 0.0f, ForceMode.Force); //Manually apply gravity.
			}
		}
		if (bGrounded == true && transform.position.y <= 1.02f /*&& bBeenHit == false*/)
		{
			transform.position = new Vector3(transform.position.x, 1.02f, transform.position.z);
		}
		/*if (bBeenHit == true || bGrounded == false)
		{
			rigidbody.AddForce(0.0f, 18.0f, 0.0f, ForceMode.VelocityChange);
		}
		if (bBeenHit == true)
		{
			bGrounded = false;
			bBeenHit = false;
			rigidbody.AddForce (0.0f, 18.0f, 0.0f, ForceMode.VelocityChange);
		}*/
		DistanceKill();
	}
	
	void DistanceKill()
	{
		if (transform.position.x < gPlayer.transform.position.x - fAliveDistance || transform.position.x > gPlayer.transform.position.x + fAliveDistance)
		{
			Destroy (gameObject);
		}
	}
	
	// Update is called once per frame
	void Update () {
		Move (); //Move the sword guy in his own special way.
		if (fHealth <= 0) //If the swordguy is dead...
		{
			Die (); //The swordguy should die.
		}
	}
}
