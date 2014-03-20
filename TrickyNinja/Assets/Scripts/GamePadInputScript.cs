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
	
	public static bool IsButtonDown( PlayerIndex aIndex , string input)// A,B,X,Y LeftTrigger LeftShoulder RightTrigger RightShoulder Back Start
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
		case "LeftShouder":
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
			return false;
		}
	}

	public static bool IsButtonUp( PlayerIndex aIndex , string input)// A,B,X,Y LeftTrigger LeftShoulder RightTrigger RightShoulder Back Start
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
}

public struct sPlayerIndex
{
	public bool bSet;
	public PlayerIndex index;
	public GamePadState state;
	public GamePadState prevState;
}

public class GamePadInputScript : MonoBehaviour {

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
				agPlayer[i].SendMessage("MoveRight", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.GetAxis( "LeftStickX", (PlayerIndex)i ) > 0 )
			{
				agPlayer[i].SendMessage("MoveLeft", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePad.GetAxis( "LeftStickY" , (PlayerIndex)i  ) > 0 )
			{
				agPlayer[i].SendMessage("LookUp", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePad.GetAxis( "LeftStickY"  , (PlayerIndex)i ) < -.5f )
			{
				agPlayer[i].SendMessage("Crouch", SendMessageOptions.DontRequireReceiver);
			}

			//Attack and Jump
			if( GamePads.IsButtonDown( playerContInputs[i].sAttack , (PlayerIndex)i ) )
			{
				agPlayer[i].SendMessage("Attack", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonDown( playerContInputs[i].sJump , (PlayerIndex)i ) )
			{
				agPlayer[i].SendMessage("Jump", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonUp( playerContInputs[i].sJump , (PlayerIndex)i ) )
			{
				agPlayer[i].SendMessage("StoppedJumping", SendMessageOptions.DontRequireReceiver);
			}

			//swaps
			if( GamePads.IsButtonDown( playerContInputs[i].sSwap1 , (PlayerIndex)i ) )
			{
				agPlayer[i].SendMessage("Swap1", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonDown( playerContInputs[i].sSwap2 , (PlayerIndex)i ) )
			{
				agPlayer[i].SendMessage("Swap2", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonDown( playerContInputs[i].sSwap3 , (PlayerIndex)i ) )
			{
				agPlayer[i].SendMessage("Swap3", SendMessageOptions.DontRequireReceiver);
			}
			if( GamePads.IsButtonDown( playerContInputs[i].sSwap4 , (PlayerIndex)i ) )
			{
				agPlayer[i].SendMessage("Swap4", SendMessageOptions.DontRequireReceiver);
			}
		}

		PlayerContInputs ConvertToPlayerContInputs ( Profile p )
		{

		}
	}


}