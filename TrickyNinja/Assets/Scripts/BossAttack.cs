using UnityEngine;
using System.Collections;

public class BossAttack : EntityScript {

	public ParticleSystem gBossDeathExplosion;
	public ParticleSystem[] gBossBullet;
	public float fTimeBetweenBullets;
	
	float fBulletTimer;

	// Use this for initialization
	void Start () {
		fBulletTimer = 0;
		if (gBossDeathExplosion != null)
		{
			gBossDeathExplosion.Stop();
		}
	}
	
	public override void Attack ()
	{
		fBulletTimer++;
		int bulletid = Random.Range (0, Random.Range (0, gBossBullet.Length));
		if (fBulletTimer >= fTimeBetweenBullets)
		{
			Instantiate(gBossBullet[bulletid], gBossBullet[bulletid].transform.position, gBossBullet[bulletid].transform.rotation);
		}
		for (int i = 0; i < gBossBullet.Length; i++)
		{
			
		}
	}
	
	public override void Die ()
	{
		if (gBossDeathExplosion != null)
		{
			gBossDeathExplosion.Play ();
		}
	}
	
	public override void Move ()
	{
	}
	
	public override void Hurt (int aiDamage)
	{
		fHealth -= aiDamage;
		if (fHealth < 1)
		{
			Die ();
		}
	}
	
	// Update is called once per frame
	void Update () {
		Move ();
		Attack ();
	}
}
