using UnityEngine;
using System.Collections;

public class PivotPointScript : MonoBehaviour {
	public GameObject parent;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		transform.position = new Vector3(parent.transform.position.x, parent.transform.position.y + .5f, parent.transform.position.z);
	}
}
