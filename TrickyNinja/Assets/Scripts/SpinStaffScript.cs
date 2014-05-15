using UnityEngine;
using System.Collections;

public class SpinStaffScript : MonoBehaviour 
{
	public float fSpinRate = 25.0f;
	public Vector3 vSpinVector = new Vector3(0,0, 1);

	Transform tTrans;
	Vector3 vOriginalPosition;

	void Awake()
	{
		tTrans = transform;
	}

	// Update is called once per frame
	void Update () 
	{
		vOriginalPosition = tTrans.position;
		tTrans.RotateAround(Vector3.zero,vSpinVector,90f);
		tTrans.position = vOriginalPosition;
	}
}
