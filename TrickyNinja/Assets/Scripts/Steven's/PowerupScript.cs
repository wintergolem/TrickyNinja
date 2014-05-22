using UnityEngine;
using System.Collections;

public class PowerupScript : MonoBehaviour {

	public float fLifeSpan = 1;
	float fTimeAlive = 0;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		fTimeAlive += Time.deltaTime;
		if( fTimeAlive > fLifeSpan )
			Destroy(gameObject);
	}
}
