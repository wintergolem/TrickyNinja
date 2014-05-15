using UnityEngine;
using System.Collections;

public class SpinStaffScript : MonoBehaviour 
{
	public float fSpinRate = 25.0f;
	public Vector3 vSpinVector = new Vector3(0,0, 1);
	public EnemyScript enemyScript;

	Transform tTrans;
	Vector3 vOriginalPosition;
	bool spinning = true;

	void Awake()
	{
		tTrans = transform;
	}

	// Update is called once per frame
	void Update () 
	{
		if(spinning)
		{
			vOriginalPosition = tTrans.position;
			tTrans.RotateAround(Vector3.zero,vSpinVector,90f);
			tTrans.position = vOriginalPosition;

			if(enemyScript.fHealth <= 0)
				spinning = false;


		}
	}
}
