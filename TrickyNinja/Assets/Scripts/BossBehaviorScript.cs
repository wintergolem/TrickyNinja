//built by: Steven Hoover
//edited by: Steven Hoover

using UnityEngine;
using System.Collections;

public class BossBehaviorScript : MonoBehaviour {

	public float fTriggerDistance = 3;
	bool bStartRise = false;

	public float fStartZ = 0;
	public float fEndZ = 10;
	public bool bRisen = false;
	public bool bFall = false;
	public float fRiseSpeed = 5;
	GameManager manager;

	public GameObject goActivePlayer;
	public CameraShake cCamera;
	public GameObject[] agoEyes;
	// Use this for initialization
	void Start () {
		foreach( GameObject goE in agoEyes )
			goE.SetActive( false );
	}
	
	// Update is called once per frame
	void Update ()
	{
		if( bStartRise || Mathf.Abs(goActivePlayer.transform.position.x - transform.position.x )< fTriggerDistance) //Mathf.Abs( Vector3.Distance( goActivePlayer.transform.position , transform.position ) )< fTriggerDistance ) 
			bStartRise = true;
		if( !bRisen && bStartRise )
		{
			transform.Translate( transform.forward * Time.deltaTime * fRiseSpeed, Space.World );
			cCamera.Shake();
			if( transform.position.z >= fEndZ ) 
			{
				bRisen = true;
				foreach( GameObject goE in agoEyes )
					goE.SetActive( true );
			}
		}
		if( bFall )
		{
			transform.Translate( -transform.forward * Time.deltaTime * fRiseSpeed, Space.World );
			cCamera.Shake();
			if( transform.position.z <= fStartZ ) 
			{
				bFall = false;
				manager.EndGame();
			}
		}
	}

	void OnTriggerEnter(Collider col)
	{
		if( bRisen )
		{
			if( col.tag.ToLower() == "playerbullet" )
			{
				bFall = true;
				Destroy (col.gameObject);
			}
		}
	}
}
