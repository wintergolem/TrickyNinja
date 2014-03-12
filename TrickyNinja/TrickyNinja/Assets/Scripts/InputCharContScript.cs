/// <summary>
/// By Deven / Steven
/// 2/14/2014
/// Input char cont script.
/// Last Edit -Steven Hoover - ensuring profiles get assigned to players properly
/// </summary>

using UnityEngine;
using System.Collections;
using GamepadInput;

public class InputCharContScript : MonoBehaviour {
	
	public struct PlayerContInputs
	{
		public GamePad.Button bAttack;
		public GamePad.Button bJump;
		public GamePad.Button bPause;
		public GamePad.Button bSwap1;
		public GamePad.Button bSwap2;
		public GamePad.Button bSwap3;
		public GamePad.Button bSwap4;
	}
	
	public PlayerContInputs[] strctPlayerInputs = new PlayerContInputs[4];
	
	public GameObject[] agPlayer;
	public GameObject[] agShadows;
	Profile[] userProfiles;
	
	//assigns all the players default controls
	void Start()
	{
		if( GameObject.FindGameObjectWithTag("Profile") != null )
			userProfiles = GameObject.FindGameObjectWithTag("Profile").GetComponent<ProfileObjectScript>().profiles ;
		else
		{
			print ( "using default");
			userProfiles = new Profile[4];
			userProfiles[0] = Profile.Default();
			userProfiles[1] = Profile.Default();
			userProfiles[2] = Profile.Default();
			userProfiles[3] = Profile.Default();
		}
		strctPlayerInputs = new PlayerContInputs[4];
		strctPlayerInputs[0] = ConvertToPlayerContInputs( userProfiles[0] );
		strctPlayerInputs[1] = ConvertToPlayerContInputs( userProfiles[1] );
		strctPlayerInputs[2] = ConvertToPlayerContInputs( userProfiles[2] );
		strctPlayerInputs[3] = ConvertToPlayerContInputs( userProfiles[3] );
	}
	
	// Update is called once per frame
	//just looks for the player inputs and handles them accordingly 
	void Update () 
	{
		for(int i = 0; i < agPlayer.Length; i++)
		{
			GamePad.Index  index = ReturnWhichIndex( i );
			//print ( "i = " + i + "   index = " + index.ToString() );
			if( GamePad.GetAxis(GamePad.Axis.LeftStick, index ).x < 0 )
			{
				agPlayer[i].SendMessage("MoveRight", SendMessageOptions.DontRequireReceiver);
			}
			
			if( GamePad.GetAxis(GamePad.Axis.LeftStick, index ).x > 0 )
			{
				agPlayer[i].SendMessage("MoveLeft", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePad.GetAxis(GamePad.Axis.LeftStick, index  ).y > 0 )
			{
				agPlayer[i].SendMessage("LookUp", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePad.GetAxis(GamePad.Axis.LeftStick , index ).y < 0 )
			{
				agPlayer[i].SendMessage("Crouch", SendMessageOptions.DontRequireReceiver);
			}
			
			if( GamePad.GetButtonDown( strctPlayerInputs[i].bAttack , index ) )
			{
				agPlayer[i].SendMessage("Attack", SendMessageOptions.DontRequireReceiver);
			}
			
			//print ( strctPlayerInputs[0].bAttack.ToString() + "  " + strctPlayerInputs[0].bJump.ToString() + "  " + strctPlayerInputs[0].bSwap2.ToString() );
			if( GamePad.GetButton( strctPlayerInputs[i].bJump , index ) )
			{
				agPlayer[i].SendMessage("Jump", SendMessageOptions.DontRequireReceiver);
			}
			
			if( GamePad.GetButtonUp( strctPlayerInputs[i].bJump , index ) )
			{
				agPlayer[i].SendMessage("StoppedJumping", SendMessageOptions.DontRequireReceiver);
			}
			if(GamePad.GetButtonDown(strctPlayerInputs[i].bSwap1 , index ) )
			{
				agPlayer[i].SendMessage("Swap", 1, SendMessageOptions.DontRequireReceiver);
			}
			if(GamePad.GetButtonDown(strctPlayerInputs[i].bSwap2 , index ))
			{
				agPlayer[i].SendMessage("Swap", 2, SendMessageOptions.DontRequireReceiver);
			}
			if(GamePad.GetButtonDown(strctPlayerInputs[i].bSwap3 , index ))
			{
				agPlayer[i].SendMessage("Swap", 3, SendMessageOptions.DontRequireReceiver);
			}
			if(GamePad.GetButtonDown(strctPlayerInputs[i].bSwap4 , index ))
			{
				agPlayer[i].SendMessage("Swap", 4, SendMessageOptions.DontRequireReceiver);
			}

			agPlayer[i].SendMessage("SetYAxis", GamePad.GetAxis(GamePad.Axis.LeftStick, index ).y, SendMessageOptions.DontRequireReceiver);
			agPlayer[i].SendMessage("SetXAxis", GamePad.GetAxis(GamePad.Axis.LeftStick, index ).x, SendMessageOptions.DontRequireReceiver);
		}
	}

	GamePad.Button ConvertToGamepadButton( Button aButton )
	{
		if( aButton == Button.A )
			return GamePad.Button.A;

		if( aButton == Button.B )
			return GamePad.Button.B;

		if( aButton == Button.X )
			return GamePad.Button.X;

		if( aButton == Button.Y )
			return GamePad.Button.Y;

		if( aButton == Button.RightShoulder )
			return GamePad.Button.RightShoulder;

		if( aButton == Button.RightTrigger )
			return GamePad.Button.RightTrigger;
		if( aButton == Button.LeftShoulder )
			return GamePad.Button.RightShoulder;
		if( aButton == Button.LeftTrigger )
			return GamePad.Button.LeftTrigger;
		else
		{
			return GamePad.Button.Start;
		}
	}

	PlayerContInputs ConvertToPlayerContInputs( Profile aProfile )
	{
		PlayerContInputs p = new PlayerContInputs();
		p.bAttack = ConvertToGamepadButton( aProfile.kAttack );
		p.bJump = ConvertToGamepadButton( aProfile.kJump );
		p.bPause = ConvertToGamepadButton( aProfile.kPause );
		p.bSwap1 = ConvertToGamepadButton( aProfile.kSwap1 );
		p.bSwap2 = ConvertToGamepadButton( aProfile.kSwap2 );
		p.bSwap3 = ConvertToGamepadButton( aProfile.kSwap3 );
		p.bSwap4 = ConvertToGamepadButton( aProfile.kSwap4 );
		return p;
	}

	GamePad.Index ReturnWhichIndex(int i)
	{
		switch( i )
		{
		case 0:
			return GamePad.Index.One;
		case 1:
			return GamePad.Index.Two;
		case 2:
			return GamePad.Index.Three;
		case 3:
			return GamePad.Index.Four;
		}
		return GamePad.Index.Any;
	}
}
