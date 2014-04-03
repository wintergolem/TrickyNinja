using UnityEngine;
using System.Collections;

public class FadeToBlackScript : MonoBehaviour {

	MeshRenderer mesh;
	float fOpacity = 0;
	float fAddToOpacity = 2;
	public bool bStartFade = false;
	// Use this for initialization
	void Start () {
		mesh = gameObject.GetComponent<MeshRenderer>();
	}
	
	// Update is called once per frame
	void Update () {
		Color color = mesh.renderer.material.color;
		mesh.renderer.material.color = new Color( color.r , color.g , color.b , fOpacity );

		if(bStartFade )
		{
			fOpacity  += fAddToOpacity * Time.deltaTime;
		}
		else
		{
			fOpacity -= fAddToOpacity * Time.deltaTime;
		}

		if( Input.GetKeyDown(KeyCode.F) )
			bStartFade = !bStartFade;
	}
}
  