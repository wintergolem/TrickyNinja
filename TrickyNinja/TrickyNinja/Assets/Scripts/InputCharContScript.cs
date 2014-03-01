//Built by: Steven Hoover
//Last Edited by: Steven Hoover

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
	
	public GameObject[] gPlayer;
	public GameObject[] agShadows;
	Profile userProfile;
	
	//assigns all the players default controls
	void Start()
	{
		if( GameObject.FindGameObjectWithTag("Profile") != null )
			userProfile = GameObject.FindGameObjectWithTag("Profile").GetComponent<ProfileObjectScript>().profile ;
		else
		{
			print ( "using default");
			userProfile = Profile.Default();
		}
		strctPlayerInputs[0] = ConvertToPlayerContInputs( userProfile );
	}
	
	// Update is called once per frame
	//just looks for the player inputs and handles them accordingly 
	void Update () 
	{
		for(int i = 0; i < gPlayer.Length; i++)
		{
			print ( strctPlayerInputs[0].bJump.ToString() + "  " + strctPlayerInputs[0].bAttack.ToString() );
			if( GamePad.GetAxis(GamePad.Axis.LeftStick, GamePad.Index.One ).x < 0 )
			{
				gPlayer[i].SendMessage("MoveRight", SendMessageOptions.DontRequireReceiver);
			}
			
			if( GamePad.GetAxis(GamePad.Axis.LeftStick, GamePad.Index.One  ).x > 0 )
			{
				gPlayer[i].SendMessage("MoveLeft", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePad.GetAxis(GamePad.Axis.LeftStick, GamePad.Index.One  ).y > 0 )
			{
				gPlayer[i].SendMessage("LookUp", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePad.GetAxis(GamePad.Axis.LeftStick , GamePad.Index.One ).y < 0 )
			{
				gPlayer[i].SendMessage("Crouch", SendMessageOptions.DontRequireReceiver);
			}
			
			if( GamePad.GetButtonDown( strctPlayerInputs[0].bAttack , GamePad.Index.One ) )
			{
				gPlayer[i].SendMessage("Attack", SendMessageOptions.DontRequireReceiver);
			}
			
			//print ( strctPlayerInputs[0].bAttack.ToString() + "  " + strctPlayerInputs[0].bJump.ToString() + "  " + strctPlayerInputs[0].bSwap2.ToString() );
			if( GamePad.GetButtonDown( strctPlayerInputs[0].bJump , GamePad.Index.One ) )
			{
				gPlayer[i].SendMessage("Jump", SendMessageOptions.DontRequireReceiver);
			}
			
			if( GamePad.GetButtonUp( strctPlayerInputs[0].bJump , GamePad.Index.One) )
			{
				gPlayer[i].SendMessage("StoppedJumping", SendMessageOptions.DontRequireReceiver);
			}
			if(GamePad.GetButtonDown(strctPlayerInputs[0].bSwap1 , GamePad.Index.One ) || GamePad.GetButtonDown(strctPlayerInputs[0].bSwap2 , GamePad.Index.One ) || GamePad.GetButtonDown(strctPlayerInputs[0].bSwap3 , GamePad.Index.One ) || GamePad.GetButtonDown(strctPlayerInputs[0].bSwap4 , GamePad.Index.One ))
			{
				gPlayer[i].SendMessage("ChangeWeapon", SendMessageOptions.DontRequireReceiver);
			}
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
}
