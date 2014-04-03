/// <summary>
/// By Deven Smith
/// 2/12/2014
/// Entity script.
/// Abstract Class to layout the framework for other classes
/// Last Edit - 3-28-2014 10:48 Deven - added variable gPow;
/// </summary>

using UnityEngine;
using System.Collections;

public class EntityScript : MonoBehaviour 
{
	public struct Weapon
	{
		public string sName;
		public int iDamage;
	}

	public bool bIncorporeal;
	public Vector3 vSpawnPoint;
	public float fHealth;
	public GameObject gPow;

	public virtual void Move()
	{

	}

	public virtual void Attack()
	{
	}

	public virtual void Hurt(int aiDamage)
	{
		fHealth -= aiDamage;
		Instantiate(gPow, transform.position, gPow.transform.rotation);
	}

	public virtual void Hurt(int aiDamage, Vector3 avDirection)
	{
		Hurt (aiDamage);

	}

	public virtual void Hurt(int aiDamage, Vector3 avDirection, Vector3 avPoint)
	{
		Hurt (aiDamage);
	}

	public virtual void Die()
	{
	}

	public virtual void ChangeFacing()
	{
	}

}
