/// <summary>
/// By Deven Smith
/// 2/28/2014
/// Sword swing script.
/// rotates the sword to simulate a sword swing
/// </summary>

using UnityEngine;
using System.Collections;

public class SwordSwingScript : MonoBehaviour {

	bool bSwingStarted = false;

	float fAngleCovered = 0;
	public float fOriginalRotation;
	
	public float fSwingSpeed;
	public float fSwingAngle = 90.0f;
	public float fHorizontalRotation = -45.0f;
	public float fUpRotation = 45.0f;
	public float fDownRotation = -135.0f;

	public GameObject goSword;

	// Update is called once per frame
	void Update () 
	{
		if(bSwingStarted)
		{
			if(fAngleCovered < fSwingAngle)
			{
				transform.eulerAngles = new Vector3(transform.eulerAngles.x, transform.eulerAngles.y, transform.eulerAngles.z - (fSwingSpeed * Time.deltaTime));
				fAngleCovered += fSwingSpeed*Time.deltaTime;
			}
			else 
			{
				fAngleCovered = 0;
				goSword.SetActive(false);
				bSwingStarted = false;
			}
		}
		//if(transform.eulerAngles.z > fOriginalRotation - fSwingAngle)
	}

	void StartSwing(int a_iSwingType)// horizontal = 0 , up - 1, down - 2
	{
		switch(a_iSwingType)
		{
		case 0:
			fOriginalRotation = fHorizontalRotation;
			break;
		case 1:
			fOriginalRotation = fUpRotation;
			break;
		case 2:
			fOriginalRotation = fDownRotation;
			break;
		default:
			print ("Does Not have a swing setting");
			break;
		}
		transform.eulerAngles =  new Vector3(transform.eulerAngles.x, transform.eulerAngles.y, fOriginalRotation);
		bSwingStarted = true;
		fAngleCovered = 0;
		goSword.SetActive(true);
	}
}
