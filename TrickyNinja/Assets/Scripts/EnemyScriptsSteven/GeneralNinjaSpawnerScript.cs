using UnityEngine;
using System.Collections;

public class GeneralNinjaSpawnerScript : MonoBehaviour {


	public enum TriggerType { collide , time };
	public TriggerType triggerBasedOn;

	public GeneralNinjaScript.EnemyType enemyTypeToSpawn;

	public Transform tStarting;
	public Transform tEnding;

	public GameObject PrefabToSpawn;

	public bool bWalkIn;

	public int iMaxSpawns = 1;

	public float fTimeBetweenSpawns;

	//private variables
	int iSpawns = 0;

	float fTimeSinceLastSpawn = 0;

	// Use this for initialization
	void Start () 
	{
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		
	}

	void Spawn()
	{
		if( iSpawns < iMaxSpawns )
		{
			GameObject ninja = Instantiate( PrefabToSpawn , tStarting.position , Quaternion.identity ) as GameObject;
			ninja.GetComponent<GeneralNinjaScript>().Init( enemyTypeToSpawn , bWalkIn , tEnding.position);
			iSpawns++;
		}
	}

	void OnCollisionEnter(Collision c)
	{
		if( triggerBasedOn == TriggerType.collide && c.gameObject.tag == "Player" )
		{
			Spawn();
		}
	}
}
