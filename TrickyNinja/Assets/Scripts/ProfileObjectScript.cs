//Builted by : Steven Hoover
//Edited By: Steven Hoover

//used to hold profile selections across scenes

using UnityEngine;
using System.Collections;

public class ProfileObjectScript : MonoBehaviour {

	public Profile[] profiles;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void FillArray( Profile p1 , Profile p2 , Profile p3 , Profile p4 )
	{
		if( p1 == null )
			p1 = Profile.Default();
		if( p2 == null )
			p2 = Profile.Default();
		if( p3 == null )
			p3 = Profile.Default();
		if( p4 == null )
			p4 = Profile.Default();

		profiles = new Profile[4];
		profiles[0] = p1;
		profiles[1] = p2;
		profiles[2] = p3;
		profiles[3] = p4;
	}
}
