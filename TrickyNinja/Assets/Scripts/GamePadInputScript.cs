using UnityEngine;
using System.Collections;
using XInputDotNetPure;

public static class GamePads
{

	static sPlayerIndex[] playerIndexes;

	static void VerifyIndexes()
	{
		if( playerIndexes == null )
			playerIndexes = new sPlayerIndex[4];
	}

	public static void Update()
	{
		VerifyIndexes();
		CheckControllerConnected();
		for ( int i = 0; i < playerIndexes.Length ; i++ ) //update states
		{
			if( playerIndexes[i].bSet )
			{
				playerIndexes[i].prevState = playerIndexes[i].state;
				playerIndexes[i].state = GamePad.GetState( playerIndexes[i].index );
			}
		}
	}

	static void CheckControllerConnected()
	{
		VerifyIndexes();
		for (int i = 0; i < 4; ++i)
		{
			if (!playerIndexes[i].bSet || !playerIndexes[i].prevState.IsConnected)
			{
				
				PlayerIndex testPlayerIndex = (PlayerIndex)i;
				GamePadState testState = GamePad.GetState(testPlayerIndex);
				if (testState.IsConnected)
				{
					Debug.Log(string.Format("GamePad found {0}", testPlayerIndex));
					playerIndexes[i].index = testPlayerIndex;
					playerIndexes[i].bSet = true;
				}
			}
		}
	}
	
	public static bool IsButtonDown( string input , PlayerIndex aIndex )// A,B,X,Y LeftTrigger LeftShoulder RightTrigger RightShoulder Back Start
	{
		VerifyIndexes();
		sPlayerIndex active = playerIndexes[(int)aIndex];
		switch (input)
		{
		case "A":
			if( active.state.Buttons.A == ButtonState.Pressed )
			{
				if( active.prevState.Buttons.A == ButtonState.Released )
				{
					return true;
				}
			}
			return false;
		case "B":
			if( active.state.Buttons.B == ButtonState.Pressed )
			{
				if( active.prevState.Buttons.B == ButtonState.Released )
				{
					return true;
				}
			}
			return false;
		case "X":
			if( active.state.Buttons.X == ButtonState.Pressed )
			{
				if( active.prevState.Buttons.X == ButtonState.Released )
				{
					return true;
				}
			}
			return false;
		case "Y":
			if( active.state.Buttons.Y == ButtonState.Pressed )
			{
				if( active.prevState.Buttons.Y == ButtonState.Released )
				{
					return true;
				}
			}
			return false;
		case "LeftShoulder":
			if( active.state.Buttons.LeftShoulder == ButtonState.Pressed )
			{
				if( active.prevState.Buttons.LeftShoulder == ButtonState.Released )
				{
					return true;
				}
			}
			return false;
		case "RightShoulder":
			if( active.state.Buttons.RightShoulder == ButtonState.Pressed )
			{
				if( active.prevState.Buttons.RightShoulder == ButtonState.Released )
				{
					return true;
				}
			}
			return false;
		case "Back":
			if( active.state.Buttons.Back == ButtonState.Pressed )
			{
				if( active.prevState.Buttons.Back == ButtonState.Released )
				{
					return true;
				}
			}
			return false;
		case "Start":
			if( active.state.Buttons.Start == ButtonState.Pressed )
			{
				if( active.prevState.Buttons.Start == ButtonState.Released )
				{
					return true;
				}
			}
			return false;
		case "LeftTrigger":
			if( active.state.Triggers.Left >= 0.5 ) //triggers go between 0 and 1
			{
				if( active.prevState.Triggers.Left <= 0.5)
				{
					return true;
				}
			}
			return false;
		case "RightTrigger":
			if( active.state.Triggers.Right >= 0.5)
			{
				if( active.prevState.Triggers.Right <= 0.5)
				{
					return true;
				}
			}
			return false;
		default:
			Debug.Log( "unknown input - IsButtonDown - GamePadInputScript " + input);
			return false;
		}
	}

	public static bool IsButtonUp( string input , PlayerIndex aIndex )// A,B,X,Y LeftTrigger LeftShoulder RightTrigger RightShoulder Back Start
	{
		VerifyIndexes();
		sPlayerIndex active = playerIndexes[(int)aIndex];
		switch (input)
		{
		case "A":
			if( active.state.Buttons.A == ButtonState.Released )
			{
				if( active.prevState.Buttons.A == ButtonState.Pressed )
				{
					return true;
				}
			}
			return false;
		case "B":
			if( active.state.Buttons.B == ButtonState.Released )
			{
				if( active.prevState.Buttons.B == ButtonState.Pressed )
				{
					return true;
				}
			}
			return false;
		case "X":
			if( active.state.Buttons.X == ButtonState.Released )
			{
				if( active.prevState.Buttons.X == ButtonState.Pressed )
				{
					return true;
				}
			}
			return false;
		case "Y":
			if( active.state.Buttons.Y == ButtonState.Released )
			{
				if( active.prevState.Buttons.Y == ButtonState.Pressed )
				{
					return true;
				}
			}
			return false;
		case "LeftShouder":
			if( active.state.Buttons.LeftShoulder == ButtonState.Released )
			{
				if( active.prevState.Buttons.LeftShoulder == ButtonState.Pressed )
				{
					return true;
				}
			}
			return false;
		case "RightShoulder":
			if( active.state.Buttons.RightShoulder == ButtonState.Released )
			{
				if( active.prevState.Buttons.RightShoulder == ButtonState.Pressed )
				{
					return true;
				}
			}
			return false;
		case "Back":
			if( active.state.Buttons.Back == ButtonState.Released )
			{
				if( active.prevState.Buttons.Back == ButtonState.Pressed )
				{
					return true;
				}
			}
			return false;
		case "Start":
			if( active.state.Buttons.Start == ButtonState.Released )
			{
				if( active.prevState.Buttons.Start == ButtonState.Pressed )
				{
					return true;
				}
			}
			return false;
		case "LeftTrigger":
			if( active.state.Triggers.Left <= 0.5 )
			{
				if( active.prevState.Triggers.Left >= 0.5 )
				{
					return true;
				}
			}
			return false;
		case "RightTrigger":
			if( active.state.Triggers.Right <= 0.5 )
			{
				if( active.prevState.Triggers.Right >= 0.5)
				{
					return true;
				}
			}
			return false;
		default:
			Debug.Log( "unknown input - IsButtonUp - GamePadInputScript");
			return false;
		}
	}

	public static bool IsButtonPressed( string input , PlayerIndex aIndex )
	{
		switch ( input )
		{
		case "A":
			return playerIndexes[(int)aIndex].state.Buttons.A == ButtonState.Pressed;
		case "B":
			return playerIndexes[(int)aIndex].state.Buttons.B == ButtonState.Pressed;
		case "X":
			return playerIndexes[(int)aIndex].state.Buttons.A == ButtonState.Pressed;
		case "Y":
			return playerIndexes[(int)aIndex].state.Buttons.A == ButtonState.Pressed;
		case "LeftShoulder":
			return playerIndexes[(int)aIndex].state.Buttons.A == ButtonState.Pressed;
		case "RightShoulder":
			return playerIndexes[(int)aIndex].state.Buttons.A == ButtonState.Pressed;
		case "Back":
			return playerIndexes[(int)aIndex].state.Buttons.A == ButtonState.Pressed;
		case "Start":
			return playerIndexes[(int)aIndex].state.Buttons.A == ButtonState.Pressed;
		case "LeftTrigger":
			return playerIndexes[(int)aIndex].state.Triggers.Left != 0;
		case "RightTrigger":
			return playerIndexes[(int)aIndex].state.Triggers.Right != 0;
		default:
			Debug.Log( "unknown input - IsButtonPressed - GamePadInputScript");
			return false;
		}
	}

	public static float GetAxis( string sWhichAxis ,  PlayerIndex aIndex  )// LeftStickX LeftStickY RightStickX RightStickY
	{
		sPlayerIndex active = playerIndexes[(int)aIndex];
		switch ( sWhichAxis )
		{
		case "LeftStickX":
			return active.state.ThumbSticks.Left.X;
		case "LeftStickY":
			return active.state.ThumbSticks.Left.Y;
		case "RightStickX":
			return active.state.ThumbSticks.Right.X;
		case "RightStickY":
			return active.state.ThumbSticks.Right.Y;
		default:
			Debug.Log( "Unknown axis");
			return 0;
		}
	}

	public static void SetVibration( PlayerIndex aIndex , float afRightMotor , float afLeftMotor ) //floats between 0 and 1
	{
		GamePad.SetVibration( aIndex , afLeftMotor , afRightMotor );
	}
}

public struct sPlayerIndex
{
	public bool bSet;
	public PlayerIndex index;
	public GamePadState state;
	public GamePadState prevState;
}

public class GamePadInputScript : MonoBehaviour 
{

	public struct PlayerContInputs
	{
		public string sAttack;
		public string sJump;
		public string sPause;
		public string sSwap1;
		public string sSwap2;
		public string sSwap3;
		public string sSwap4;
	}

	public PlayerContInputs[] playerContInputs = new PlayerContInputs[4];

	public GameObject[] agPlayers;
	Profile[] userProfiles;

	void Awake()
	{

	}
	// Use this for initialization
	void Start ()
	{
		if( GameObject.FindGameObjectWithTag("Profile") != null )
			userProfiles = GameObject.FindGameObjectWithTag("Profile").GetComponent<ProfileObjectScript>().profiles;
		else
		{
			print ( "using default");
			userProfiles = new Profile[4];
			userProfiles[0] = Profile.Default();
			userProfiles[1] = Profile.Default();
			userProfiles[2] = Profile.Default();
			userProfiles[3] = Profile.Default();
		}

		playerContInputs = new PlayerContInputs[4];
		playerContInputs[0] = ConvertToPlayerContInputs( userProfiles[0] );
		playerContInputs[1] = ConvertToPlayerContInputs( userProfiles[1] );
		playerContInputs[2] = ConvertToPlayerContInputs( userProfiles[2] );
		playerContInputs[3] = ConvertToPlayerContInputs( userProfiles[3] );
	}
	
	// Update is called once per frame
	void Update () 
	{
		GamePads.Update();

		for( int i = 0 ; i < agPlayers.Length ; i++ )
		{
			//movement
			if ( GamePads.GetAxis( "LeftStickX" , (PlayerIndex)i ) < 0 )
			{
				agPlayers[i].SendMessage("MoveRight", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.GetAxis( "LeftStickX", (PlayerIndex)i ) > 0 )
			{
				agPlayers[i].SendMessage("MoveLeft", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.GetAxis( "LeftStickY" , (PlayerIndex)i  ) > 0 )
			{
				agPlayers[i].SendMessage("LookUp", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.GetAxis( "LeftStickY"  , (PlayerIndex)i ) < -.5f )
			{
				agPlayers[i].SendMessage("Crouch", SendMessageOptions.DontRequireReceiver);
			}

			//Attack and Jump
			if( GamePads.IsButtonDown( playerContInputs[i].sAttack , (PlayerIndex)i ) )
			{
				agPlayers[i].SendMessage("Attack", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonPressed( playerContInputs[i].sJump , (PlayerIndex)i ) )
			{
				agPlayers[i].SendMessage("Jump", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonUp( playerContInputs[i].sJump , (PlayerIndex)i ) )
			{
				agPlayers[i].SendMessage("StoppedJumping", SendMessageOptions.DontRequireReceiver);
			}

			//swaps
			if( GamePads.IsButtonDown( playerContInputs[i].sSwap1 , (PlayerIndex)i ) )
			{
				agPlayers[i].SendMessage("Swap", 1, SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonDown( playerContInputs[i].sSwap2 , (PlayerIndex)i ) )
			{
				agPlayers[i].SendMessage("Swap", 2 , SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonDown( playerContInputs[i].sSwap3 , (PlayerIndex)i ) )
			{
				agPlayers[i].SendMessage("Swap", 3 , SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonDown( playerContInputs[i].sSwap4 , (PlayerIndex)i ) )
			{
				agPlayers[i].SendMessage("Swap", 4,  SendMessageOptions.DontRequireReceiver);
			}

			//sent angel
			agPlayers[i].SendMessage("SetYAxis", GamePads.GetAxis( "LeftStickY", (PlayerIndex)i ), SendMessageOptions.DontRequireReceiver);
			agPlayers[i].SendMessage("SetXAxis", GamePads.GetAxis( "LeftStickX", (PlayerIndex)i ), SendMessageOptions.DontRequireReceiver);

			//remove at any time
			if( GamePads.IsButtonPressed( "LeftTrigger" , (PlayerIndex)i ) )
			{
				GamePad.SetVibration( (PlayerIndex)i , 0.3f , 0.3f);
			}
			else
			{
				GamePad.SetVibration( (PlayerIndex)i , 0 , 0);
			}
		}
	}

	PlayerContInputs ConvertToPlayerContInputs ( Profile p )
	{
		PlayerContInputs pci = new PlayerContInputs();
		pci.sAttack = p.kAttack.ToString();
		pci.sJump = p.kJump.ToString();
		pci.sPause = p.kPause.ToString();
		pci.sSwap1 = p.kSwap1.ToString();
		pci.sSwap2 = p.kSwap2.ToString();
		pci.sSwap3 = p.kSwap3.ToString();
		pci.sSwap4 = p.kSwap4.ToString();
		return pci;
	}

}