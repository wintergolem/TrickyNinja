using UnityEngine;
using System.Collections;
using System.Collections.Generic;

// This is the PocketRPG Blade Master class stripped down to just a bit of animation... it's just for an example of how to use the PocketRPG weapon trails.
// This code was written by Evan Greenwood (of Free Lives) and used in the game PocketRPG by Tasty Poison Games.
// But you can use this how you please... Make great games... that's what this is about.
// This code is provided as is. Please discuss this on the Unity Forums if you need help.

// Adapted for general transforms by Mike Ton.

[RequireComponent(typeof(mt_AnimIntervalControl))]
public class mt_AnimIntervalManager : MonoBehaviour{
	public mt_WeaponTrail mtonSwipe;
	public float timeTrail = 1.0f;
	public float timeToTweenTo = 1.0f;
	public float fadeInTime = 1.5f;
	private   float timeCurrn = 0.0f;
	private int swipeState = 0;
	protected float t = 0.033f;

	protected mt_AnimIntervalControl animationController;

	protected float timeScale = 1; // This is here for personal time distortion... like freeze spells that slow enemies... (changing this affects the animation rate)

	protected void Awake (){
		animationController = GetComponent<mt_AnimIntervalControl> ();
	}
	protected void Start (){
		animationController.AddTrail (mtonSwipe); // Adds the trails to the animationController which will run them
		Initialise ();
	}

	protected void Initialise (){		
		//mtonSwipe.StartTrail(timeToTweenTo, fadeInTime);
		mtonSwipe.SetTime (timeTrail, 0, 1);
	    mtonSwipe.ClearTrail(); // Forces the trail to clear	
	}

	protected void Update (){
		t = Mathf.Clamp (Time.deltaTime * timeScale, 0, 0.066f);
		animationController.SetDeltaTime (t); // Sets the delta time that the animationController uses. ??? HACK : Disable still works
		timeCurrn -= t;
		if(timeCurrn < 0.0f){
			switch (swipeState) {
			  case 0: //start trail
			    timeCurrn = timeToTweenTo * 0.75f;
			    swipeState++;
                mtonSwipe.StartTrail(timeToTweenTo, fadeInTime);
				break;
			  case 1: //fade out
			    timeCurrn = timeToTweenTo * 0.25f;
			    swipeState++;
			    mtonSwipe.FadeOut(0.5f); // Fades the trail out
				break;
			  case 2: //delete trail
			    timeCurrn = timeToTweenTo * 0.10f;
			    swipeState++;
			    mtonSwipe.ClearTrail(); // Forces the trail to clear	
				break;
			  default: //reset to start state
			    swipeState = 0;
				break;
		    }
	    }
	}
}
