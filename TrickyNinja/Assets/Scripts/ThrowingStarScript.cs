using UnityEngine;
using System.Collections;

public class ThrowingStarScript : MonoBehaviour 
{
	float fSpin = 1.0f;
	public float fSpinSpeed = 10.0f;
	public bool bSpin = true;
	bool sticksoundplayed = false;
	
	// Update is called once per frame
	void Update () 
	{
		if( bSpin )
			transform.Rotate(new Vector3(0.0f, 0.0f, fSpin*fSpinSpeed*Time.deltaTime), Space.World);
		if (!bSpin && !sticksoundplayed)
		{
			GameObject.FindGameObjectWithTag("SoundManager").SendMessage("PlayStarStickSound", SendMessageOptions.DontRequireReceiver);
			sticksoundplayed = true;
		}
	}
}
