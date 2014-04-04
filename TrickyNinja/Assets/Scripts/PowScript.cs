using UnityEngine;
using System.Collections;

public class PowScript : MonoBehaviour {

	public float fAliveTime;
	
	float fTimer;

	// Use this for initialization
	void Start () {
		if (fAliveTime <  0.005f)
		{
			fAliveTime = 0.005f;
		}
		fTimer = 0.0f;
	}
	
	// Update is called once per frame
	void Update () {
		fTimer += Time.deltaTime;
		if (fTimer >= fAliveTime)
		{
			Destroy (gameObject);
		}
	}
}
