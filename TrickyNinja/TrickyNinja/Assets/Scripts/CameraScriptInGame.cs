﻿using UnityEngine;
using System.Collections;

public class CameraScriptInGame : MonoBehaviour {


	//private variables
	Camera caMainCamera;
	int maxIndex;

	public string Instructions = "X = xMin Y = yMin Z = xMax W = yMax";
	public Vector4[] v4CameraLimits;
	//cameras, set in editor
	public Camera[] Cameras;
	//player; set in editor
	public GameObject GoPlayer;
	
	// Use this for initialization
	void Start () 
	{
		DisableAllCameras();
		SetCameraAsMain( ref Cameras[0] );
		maxIndex = v4CameraLimits.Length -1;
		if( maxIndex > Cameras.Length -1 )
			maxIndex = Cameras.Length -1;

		for( int i = 0 ; i <= maxIndex ; i++ )
		{
			SetCameraFollowVariables( i );
		}
	}
	
	// Update is called once per frame
	void Update () 
	{
		for( int i = 0 ; i <= maxIndex ; i++ )
		{
			if( CheckPlayerEnterCamera( i ) )
			{
				SetCameraAsMain( ref Cameras[ i ] );
			}
		}
	}

	bool CheckPlayerEnterCamera( int aiIndex )
	{
		if( GoPlayer.transform.position.x > v4CameraLimits[aiIndex].x && GoPlayer.transform.position.x < v4CameraLimits[aiIndex].z )
		{
			if( GoPlayer.transform.position.y > v4CameraLimits[aiIndex].y && GoPlayer.transform.position.y < v4CameraLimits[aiIndex].w )
			{
				return true;
			}
		}
		return false;
	}

	void DisableAllCameras()
	{
		foreach( Camera c in Cameras )
		{
			c.gameObject.SetActive( false );
		}
	}

	void SetCameraAsMain(ref Camera aCamera)
	{
		DisableAllCameras();
		caMainCamera = aCamera;
		aCamera.gameObject.SetActive( true );
		aCamera.tag = "MainCamera";
	}

	void SetCameraFollowVariables( int aiIndex )
	{
		Cameras[aiIndex].GetComponent<CameraFollow>().Init( v4CameraLimits[ aiIndex ] );
	}
}