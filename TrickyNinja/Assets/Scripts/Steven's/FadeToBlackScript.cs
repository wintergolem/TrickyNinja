using UnityEngine;
using System.Collections;

public class FadeToBlackScript : MonoBehaviour {

	MeshRenderer mesh;
	float fOpacity = 1;
	public float fAddToOpacity = 2;
	public bool bStartFade = false;
	public bool bDemoOver = false;
	public GUIText text;
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
			if( fOpacity < 1 )
				fOpacity  += fAddToOpacity * Time.deltaTime;
		}
		else
		{
			if( fOpacity > 0 )
			fOpacity -= fAddToOpacity * Time.deltaTime;
		}

		if( Input.GetKeyDown(KeyCode.F) )
			bStartFade = !bStartFade;

		if( bDemoOver )
		{
			bStartFade = true;
			if( fOpacity >= 1 )
				text.gameObject.SetActive( true );
		}
	}
}
  