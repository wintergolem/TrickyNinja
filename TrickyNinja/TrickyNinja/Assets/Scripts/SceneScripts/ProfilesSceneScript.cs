//Built by: Steven Hoover
//Last Edited by: Steven Hoover

using UnityEngine;
using System.Collections;
using System.Collections.Generic;
//using System.Collections.Generic.Dictionary;
using GamepadInput;
using System.Xml;
using System.Xml.Serialization;

//public enum ProfileSceneState {CreateLoad, Edit};
public enum Button { A, B, Y, X, RightShoulder, LeftShoulder, RightStick, LeftStick, Back, Start, LeftTrigger, RightTrigger , None};

public class Profile
{
	[XmlAttribute("name")]
	public string name;
	[XmlAttribute("atttack")]
	public Button kAttack;
	[XmlAttribute("jump")]
	public Button kJump;
	[XmlAttribute("pause")]
	public Button kPause;
	[XmlAttribute("Swap1")]
	public Button kSwap1;
	[XmlAttribute("Swap2")]
	public Button kSwap2;
	[XmlAttribute("Swap3")]
	public Button kSwap3;
	[XmlAttribute("Swap4")]
	public Button kSwap4;

	//used to prevent multi-tasking buttons
	Dictionary<Button , bool > buttonsUsed;
	Button tempHolder; //used when checking for ducpliates commands, holds button to be changed

	public Profile()
	{
		buttonsUsed = new Dictionary<Button, bool>();
		
		buttonsUsed.Add( Button.A , false );
		buttonsUsed.Add( Button.B , false );
		buttonsUsed.Add( Button.X , false );
		buttonsUsed.Add( Button.Y , false );
		buttonsUsed.Add( Button.RightShoulder , false );
		buttonsUsed.Add( Button.RightTrigger , false );
		buttonsUsed.Add( Button.LeftShoulder , false );
		buttonsUsed.Add( Button.LeftTrigger , false );
		buttonsUsed.Add( Button.Back , false );
		buttonsUsed.Add( Button.Start , false );
	}
	public void SwapKeys( string asWhichKeyCode , Button akNewCode )
	{
		//check key used

		if( CheckButtonUsed( akNewCode ) )
		{
			//code already used, so change existing use
			ChangeKeyToUnused(tempHolder);
		}

		switch( asWhichKeyCode )
		{
		case "Attack":
			kAttack = akNewCode;
			break;
		case "Jump":
			kJump = akNewCode;
			break;
		case "Pause":
			kPause = akNewCode;
			break;
		case "Swap1":
			kSwap1 = akNewCode;
			break;
		case "Swap2":
			kSwap2 = akNewCode;
			break;
		case "Swap3":
			kSwap3 = akNewCode;
			break;
		case "Swap4":
			kSwap4 = akNewCode;
			break;
		}
		UpdateDictionary();
	}

	void UpdateDictionary()
	{
		ResetDict();
		buttonsUsed[ kAttack ] = true;
		buttonsUsed[ kJump ] = true;
		buttonsUsed[ kPause ] = true;
		buttonsUsed[ kSwap1 ] = true;
		buttonsUsed[ kSwap2 ] = true;
		buttonsUsed[ kSwap3 ] = true;
		buttonsUsed[ kSwap4 ] = true;
	}

	void ResetDict()
	{
		buttonsUsed[ Button.A ] = false;
		buttonsUsed[ Button.B ] = false;
		buttonsUsed[ Button.X ] = false;
		buttonsUsed[ Button.Y ] = false;
		buttonsUsed[ Button.LeftShoulder ] = false;
		buttonsUsed[ Button.LeftTrigger ] = false;
		buttonsUsed[ Button.RightShoulder ] = false;
		buttonsUsed[ Button.RightTrigger ] = false;
		buttonsUsed[ Button.Back ] = false;
		buttonsUsed[ Button.Start ] = false;
	}

	Button FindUnusedButton()
	{
		if( buttonsUsed[ Button.A ] == false )
			return Button.A;
		if( buttonsUsed[ Button.B ] == false )
			return Button.B;
		if( buttonsUsed[ Button.X ] == false )
			return Button.X;
		if( buttonsUsed[ Button.Y ] == false )
			return Button.Y;
		if( buttonsUsed[ Button.RightShoulder ] == false )
			return Button.RightShoulder;
		if( buttonsUsed[ Button.RightTrigger ] == false )
			return Button.RightTrigger;
		if( buttonsUsed[ Button.LeftShoulder ] == false )
			return Button.LeftShoulder;
		if( buttonsUsed[ Button.LeftTrigger ] == false )
			return Button.LeftTrigger;
		if( buttonsUsed[ Button.Back ] == false )
			return Button.Back;
		if( buttonsUsed[ Button.Start ] == false )
			return Button.Start;
		return Button.None;
	}

	//returns true if button is used, false is not
	bool CheckButtonUsed(Button aButton)
	{
		foreach( KeyValuePair< Button , bool > kvp in buttonsUsed )
		{
			if( kvp.Key == aButton )
			{
				if( kvp.Value == true )
				{
					tempHolder = kvp.Key;
					return true;
				}
				return false;
			}
		}
		Debug.Log("ERROR: ProfilesSceneScript - CheckButtonUsed - invalid button entered");
		return false;
	}

	void ChangeKeyToUnused(Button aButton)
	{
		if( kAttack == aButton )
		{
			kAttack = FindUnusedButton();
		}
		else if( kJump == aButton )
		{
			kJump = FindUnusedButton();
		}
		else if( kPause == aButton )
		{
			kPause = FindUnusedButton();
		}
		else if( kSwap1 == aButton )
		{
			kSwap1 = FindUnusedButton();
		}
		else if( kSwap2 == aButton )
		{
			kSwap2 = FindUnusedButton();
		}
		else if( kSwap3 == aButton )
		{
			kSwap3 = FindUnusedButton();
		}
		else if( kSwap4 == aButton )
		{
			kSwap4 = FindUnusedButton();
		}
	}

	public void ChangeName( string sNewName )
	{
		name = sNewName;
	}

	public static Profile Default()
	{
		Profile p = new Profile();
		p.name = "Default";
		p.kAttack = Button.B;
		p.kJump = Button.LeftTrigger;
		p.kPause = Button.X;
		p.kSwap1 = Button.Y;
		p.kSwap2 = Button.LeftShoulder;
		p.kSwap3 = Button.A;
		p.kSwap4 = Button.RightTrigger;
		return p;
	}
}

public class ProfilesSceneScript : MonoBehaviour {

	ControllerMenuInput controllerMenuInput;
	//ProfileSceneState state;
	Profile loadedProfile;
	Vector2 vSize;
	bool started = false;
	int mainColumn = 0;
	float fTimeSinceLastMove = 0;
	//varibales set by editor
	public float colWidth = 200;
	public float rowHeight = 50;
	public Texture texture;
	public int iDotSize = 50;
	public float fTimeBetweenMoves = 2;

	//rects used for textfields
	public Rect rNameText;
	public Rect rAttackDis;
	public Rect rJumpDis;
	public Rect rPauseDis;
	public Rect rSwap1Dis;
	public Rect rSwap2Dis;
	public Rect rSwap3Dis;
	public Rect rSwap4Dis;
	public Rect rExit;


	//buttons
		//createload
	sButton createProfileButton;
	sButton loadProfileButton;
	
		//edit
	sButton editNameButton;
	sButton editAttackButton;
	sButton editJumpButton;
	sButton editPauseButton;
	sButton editSwap1Button;
	sButton editSwap2Button;
	sButton editSwap3Button;
	sButton editSwap4Button;
	sButton exitButton;
	sButton saveButton;
	sButton editDeleteButton;
	List<sButton> profileButtons;
	// Use this for initialization
	void Start () 
	{
		started = true;
		FileIO.LoadProfiles();
		controllerMenuInput = new ControllerMenuInput();
		controllerMenuInput.Init( texture , 9 , iDotSize , fTimeBetweenMoves );
		controllerMenuInput.bActiveButtonConstantPressed = true;
		//state = new ProfileSceneState();
		vSize = new Vector2( colWidth, rowHeight );

		createProfileButton = new sButton();
		createProfileButton.Init("Create Profile", new Vector2( colWidth / 2, rowHeight * 2 ) , vSize , CreateProfileFunc , "None" );

		loadProfileButton = new sButton();
		loadProfileButton.Init("Load Profile", new Vector2(200,200) , vSize , CreateProfileFunc , "None" );

		exitButton = new sButton();
		exitButton.Init("Exit" , new Vector2( colWidth /2 , rowHeight * 4 ) , vSize , ExitProfileButtonFunc , "Exit" );

		saveButton = new sButton();
		saveButton.Init("Save" , new Vector2( colWidth /2 , rowHeight * 3 ) , vSize , SaveProfileButtonFunc , "Save" );
		profileButtons = new List<sButton>();
		MakeProfileButtons(false);

		//editButtons = new List<sButton>();
		editNameButton = new sButton();
		editNameButton.Init("Name: " , new Vector2( rNameText.x , rNameText.y ) , new Vector2( rNameText.width, rNameText.height ) , SwitchButton , "Name" );
		editAttackButton = new sButton();
		editAttackButton.Init("Attack: " , new Vector2( rAttackDis.x , rAttackDis.y ) , new Vector2( rAttackDis.width, rAttackDis.height ), SwitchButton , "Attack" );
		editJumpButton = new sButton();
		editJumpButton.Init("Jump: " , new Vector2( rJumpDis.x , rJumpDis.y ) , new Vector2( rJumpDis.width, rJumpDis.height ), SwitchButton , "Jump" );
		editPauseButton = new sButton();
		editPauseButton.Init("Pause: " ,new Vector2( rPauseDis.x , rPauseDis.y ) , new Vector2( rPauseDis.width, rPauseDis.height ), SwitchButton , "Pause" );
		editSwap1Button = new sButton();
		editSwap1Button.Init("Swap1: " , new Vector2( rSwap1Dis.x , rSwap1Dis.y ) , new Vector2( rSwap1Dis.width, rSwap1Dis.height ) , SwitchButton , "Swap1" );
		editSwap2Button = new sButton();
		editSwap2Button.Init("Swap2: " ,new Vector2( rSwap2Dis.x , rSwap2Dis.y ) , new Vector2( rSwap2Dis.width, rSwap2Dis.height ) , SwitchButton , "Swap2" );
		editSwap3Button = new sButton();
		editSwap3Button.Init("Swap3: " ,new Vector2( rSwap3Dis.x , rSwap3Dis.y ) , new Vector2( rSwap3Dis.width, rSwap3Dis.height ), SwitchButton , "Swap3" );
		editSwap4Button = new sButton();
		editSwap4Button.Init("Swap4: " ,new Vector2( rSwap4Dis.x , rSwap4Dis.y ) , new Vector2( rSwap4Dis.width, rSwap4Dis.height ) , SwitchButton , "Swap4" );
		editDeleteButton = new sButton();
		editDeleteButton.Init("Delete Profile " ,new Vector2( rSwap4Dis.x , rSwap4Dis.y + rowHeight) , new Vector2( rSwap4Dis.width, rSwap4Dis.height ) , DeleteActiveProfileButtonFunc , "Delete" );
	}

	// Update is called once per frame
	void Update ()
	{
		if( !started ) Start();

		SendActiveButton();

		controllerMenuInput.Update();

		fTimeSinceLastMove += Time.deltaTime;
		if( fTimeSinceLastMove > fTimeBetweenMoves)
		{
			fTimeSinceLastMove = 0;
			if( GamePad.GetAxis( GamePad.Axis.LeftStick , GamePad.Index.Any ).x > 0 )
			{
//				if( mainColumn == 2 )
//					mainColumn = 0;
			
				if( mainColumn == 0 ) 
					mainColumn = 2;
			}
			if( GamePad.GetAxis( GamePad.Axis.LeftStick , GamePad.Index.Any ).x < 0 )
			{
				//mainColumn--;
				if( mainColumn == 2 )
					mainColumn = 0;
				
//				if( mainColumn == 0 ) 
//					mainColumn = 2;
			}
		}
		//if( loadedProfile != null) print ( loadedProfile.name );
	}

	void OnGUI()
	{
		if( !started ) Start();

		createProfileButton.Draw();
		//loadProfileButton.Draw();
		saveButton.Draw();
		editDeleteButton.Draw();

		controllerMenuInput.Draw();
		if(exitButton.Draw() ) ExitProfilePage();

		profileButtons.ForEach( delegate(sButton obj) 
		{
			obj.Draw();
		});

		//textboxes
		if( loadedProfile != null )
		{
			loadedProfile.name = GUI.TextField( rNameText , loadedProfile.name , 10 );
			GUI.Label( rAttackDis , loadedProfile.kAttack.ToString()  );
			GUI.Label( rJumpDis , loadedProfile.kJump.ToString()  );
			GUI.Label( rPauseDis , loadedProfile.kPause.ToString()  );
			GUI.Label( rSwap1Dis , loadedProfile.kSwap1.ToString()  );
			GUI.Label( rSwap2Dis , loadedProfile.kSwap2.ToString()  );
			GUI.Label( rSwap3Dis , loadedProfile.kSwap3.ToString()  );
			GUI.Label( rSwap4Dis , loadedProfile.kSwap4.ToString()  );
		}
	}

	void AddButtonsToList( List<sButton> buttonList , params sButton [] buttons )
	{
		foreach( sButton b in buttons )
		{
			buttonList.Add(b);
		}
	}

	void MakeProfileButtons(bool clearList)
	{
		if(clearList) profileButtons.Clear();

		float f = 0;
		float a = 5; // point that these start at
		foreach( Profile p in FileIO.profileContainer.profiles )
		{
			sButton b = new sButton();
			b.Init( "Load: " + p.name , new Vector2( colWidth / 2 , rowHeight * (a + f ) ), vSize , LoadProfile , p.name );
			profileButtons.Add(b);
			f++;
		}
	}

	void SendActiveButton ()
	{
		if( mainColumn == 2 )
		{
			switch( controllerMenuInput.GetIndex() % 9 )
			{
			case 0:
				controllerMenuInput.SetActiveButton( editNameButton );
				break;
			case 1:
				controllerMenuInput.SetActiveButton( editAttackButton );
				break;
			case 2:
				controllerMenuInput.SetActiveButton( editJumpButton );
				break;
			case 3:
				controllerMenuInput.SetActiveButton( editPauseButton );
				break;
			case 4:
				controllerMenuInput.SetActiveButton( editSwap1Button );
				break;
			case 5:
				controllerMenuInput.SetActiveButton( editSwap2Button );
				break;
			case 6:
				controllerMenuInput.SetActiveButton( editSwap3Button );
				break;
			case 7:
				controllerMenuInput.SetActiveButton( editSwap4Button );
				break;
			case 8:
				controllerMenuInput.SetActiveButton( editDeleteButton );
				break;
			}
		}
		else
		{ 
			switch( controllerMenuInput.GetIndex() % (3 + profileButtons.Count ) )
			{
			case 0:
				controllerMenuInput.SetActiveButton( createProfileButton );
				break;
			case 1:
				controllerMenuInput.SetActiveButton( saveButton );
				break;
			case 2:
				controllerMenuInput.SetActiveButton( exitButton );
				break;
			case 3:
				controllerMenuInput.SetActiveButton( profileButtons[0] );
				break;
			case 4:
				controllerMenuInput.SetActiveButton(  profileButtons[1]  );
				break;
			case 5:
				controllerMenuInput.SetActiveButton(  profileButtons[2]  );
				break;
			case 6:
				controllerMenuInput.SetActiveButton(  profileButtons[3]  );
				break;
			case 7:
				controllerMenuInput.SetActiveButton(  profileButtons[4]  );
				break;
			case 8:
				controllerMenuInput.SetActiveButton( exitButton );
				break;
			default:
				break;
			}
		}
	}

	void CreateProfileFunc()
	{
		if( GamePad.GetButtonDown( GamePad.Button.A , GamePad.Index.Any ) )
		{
			loadedProfile = new Profile();
			loadedProfile.name = "Default";
			loadedProfile.kAttack = Button.A;
			loadedProfile.kJump = Button.B;
			loadedProfile.kPause = Button.X;
			loadedProfile.kSwap1 = Button.Y;
			loadedProfile.kSwap2 = Button.LeftTrigger;
			loadedProfile.kSwap3 = Button.LeftShoulder;
			loadedProfile.kSwap4 = Button.RightShoulder;
		}
	}

	void SwitchButton()
	{
		GamepadState state = GamePad.GetState( GamePad.Index.One );
		if( state.A || state.B || state.X || state.Y || state.LeftTrigger != 0 || state.RightTrigger != 0 || state.LeftShoulder || state.RightShoulder )
		{
			Button buttonPressed = PullButton( state );
			string activeButton = controllerMenuInput.GrabActiveButton().GetLevel();
			loadedProfile.SwapKeys( activeButton , buttonPressed );
		}
	}

	Button PullButton( GamepadState aState )
	{
		if( aState.A ) return Button.A;
		if( aState.B ) return Button.B;
		if( aState.X ) return Button.X;
		if( aState.Y ) return Button.Y;
		if( aState.LeftShoulder ) return Button.LeftShoulder;
		if( aState.RightShoulder ) return Button.RightShoulder;
		if( aState.LeftTrigger != 0 ) return Button.LeftTrigger;
		if( aState.RightTrigger != 0 ) return Button.RightTrigger;
		if( aState.Start ) return Button.Start;
		else
		{
			return Button.None;
		}
	}

	void LoadProfile()
	{
		if( GamePad.GetButtonDown( GamePad.Button.A , GamePad.Index.Any ) )
		{
			//if( FileIO.profileContainer.profiles.Find( x => x.name == controllerMenuInput.active.GetLevel() ) == null ) print ("Its null");
			//print(  controllerMenuInput.active.GetLevel() );
			loadedProfile = FileIO.profileContainer.profiles.Find( x => x.name == controllerMenuInput.active.GetLevel() );
		}
	}

	void SaveProfileButtonFunc()
	{
		if( GamePad.GetButtonDown( GamePad.Button.A , GamePad.Index.Any ) )
		{
			FileIO.AddToContainer(loadedProfile);
			FileIO.SaveProfiles();
			MakeProfileButtons(true);
		}
	}

	void DeleteActiveProfileButtonFunc()
	{
		if( GamePad.GetButtonDown( GamePad.Button.A , GamePad.Index.Any ) )
		{
			DeleteActiveProfile();
		}
	}

	void DeleteActiveProfile()
	{
		if( loadedProfile != null ) // check that there is a profile
		{
			FileIO.DeleteProfileFromList( loadedProfile.name );
			MakeProfileButtons (true);
		}
	}

	void ExitProfileButtonFunc()
	{
		if( GamePad.GetButtonDown( GamePad.Button.A, GamePad.Index.One ) )
		{
			ExitProfilePage();
		}
	}

	void ExitProfilePage()
	{
		FileIO.SaveProfiles();
		Application.LoadLevel("MainMenu");
	}

}
