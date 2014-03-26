//Built by: Steven Hoover
//Last Edit by: Steven Hoover

using UnityEngine;
using System.Collections;

public class ObjectDanceAround : MonoBehaviour 
{

	private Vector3 originPosition;
	private Quaternion originRotation;
	float shake_decay;
	float shake_intensity;
	public float shake_intensity_set;
	public float shake_decay_set;
	public BossBehaviorScript boss;
	// Use this for initialization
	void Start () {
	
	}
	
	void Update ()
	{
		if (shake_intensity > 0){
			Vector3 temp = originPosition + Random.insideUnitSphere * shake_intensity;
			temp.z = originPosition.z;
			transform.position = temp;
			transform.rotation = new Quaternion(
				0,//originRotation.x + Random.Range (-shake_intensity,shake_intensity) * .2f,
				originRotation.y + Random.Range (-shake_intensity,shake_intensity) * .2f,
				0,//originRotation.z + Random.Range (-shake_intensity,shake_intensity) * .2f,
				0/*originRotation.w + Random.Range (-shake_intensity,shake_intensity) * .2f*/);
			shake_intensity -= shake_decay;
		}
		else
		{
			if( boss.bRisen )
				Shake ();
		}
	}

	public void Shake()
	{
		originPosition = transform.position;
		originRotation = transform.rotation;
		shake_intensity = shake_intensity_set;
		shake_decay = shake_decay_set;
	}
}
