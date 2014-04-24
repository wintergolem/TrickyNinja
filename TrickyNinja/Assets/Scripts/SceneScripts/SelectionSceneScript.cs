//Builted by: Steven Hoover
//Last Edited by: Steven Hoover

using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SelectionSceneScript : MonoBehaviour {
//
//	ControllerMenuInput menuInputPlayerOne;
//	ControllerMenuInput menuInputPlayerTwo;
//	ControllerMenuInput menuInputPlayerThree;
//	ControllerMenuInput menuInputPlayerFour;
//
//	//set by editor
//	public string sFirstLevelName;
//	public Texture texture;
//	public int iDotSize = 50;
//	public float fTimeBetweenMoves = 2;
//	public float fSecondRowDropPercent = .5f;
//		//rects
//	public Rect	standardButton;
//	List<sButton> lP1Buttons;
//	List<sButton> lP2Buttons;
//	List<sButton> lP3Buttons;
//	List<sButton> lP4Buttons;
//	//variables for passing profile selections between scenes
//	GameObject profile;
//	Profile playerOneSelectedProfile;
//	Profile playerTwoSelectedProfile;
//	Profile playerThreeSelectedProfile;
//	Profile playerFourSelectedProfile;
//
//	// Use this for initialization
//	void Start ()
//	{
//		CreateProfile ();
//		FileIO.LoadProfiles();
//		menuInputPlayerOne = new ControllerMenuInput();
//		menuInputPlayerTwo = new ControllerMenuInput();
//		menuInputPlayerThree = new ControllerMenuInput();
//		menuInputPlayerFour = new ControllerMenuInput();
//		menuInputPlayerOne.Init( texture , FileIO.profileContainer.profiles.Count -1 , iDotSize , fTimeBetweenMoves , GamepadInput.GamePad.Index.One);
//		menuInputPlayerTwo.Init( texture , FileIO.profileContainer.profiles.Count -1 , iDotSize , fTimeBetweenMoves , GamepadInput.GamePad.Index.Two);
//		menuInputPlayerThree.Init (texture, FileIO.profileContainer.profiles.Count - 1, iDotSize, fTimeBetweenMoves, GamepadInput.GamePad.Index.Three);
//		menuInputPlayerFour.Init( texture , FileIO.profileContainer.profiles.Count -1 , iDotSize , fTimeBetweenMoves , GamepadInput.GamePad.Index.Four);
//		lP1Buttons = new List<sButton>();
//		lP2Buttons = new List<sButton>();
//		lP3Buttons = new List<sButton>();
//		lP4Buttons = new List<sButton>();
//
//		//add buttons
//		//need four sets of buttons
//		int count = 0; // temp way to move buttons
//		//upper left ( player 1 )
//		foreach( Profile p in FileIO.profileContainer.profiles )
//		{
//			sButton b = new sButton();
//			b.Init( p.name , new Vector2( (Screen.width / 4) - standardButton.width/2 , standardButton.y + count*30) , new Vector2( standardButton.width, standardButton.height ) , LoadProfileP1 , p.name );
//			lP1Buttons.Add( b );
//			count++;
//		}
//		count = 0;
//		//upper right ( player 2 )
//		foreach( Profile p in FileIO.profileContainer.profiles )
//		{
//			sButton b = new sButton();
//			b.Init( p.name , new Vector2( (Screen.width / 2 + Screen.width / 4) - standardButton.width/2 , standardButton.y + count*30) , new Vector2( standardButton.width, standardButton.height ) , LoadProfileP2 , p.name );
//			lP2Buttons.Add( b );
//			count++;
//		}
//		//lower left ( player 3 )
//		count = 0;
//		foreach( Profile p in FileIO.profileContainer.profiles )
//		{
//			sButton b = new sButton();
//			b.Init( p.name , new Vector2( (Screen.width / 4) - standardButton.width/2 , standardButton.y + (Screen.height * fSecondRowDropPercent) + count*30) , new Vector2( standardButton.width, standardButton.height ) , LoadProfileP3 , p.name );
//			lP3Buttons.Add( b );
//			count++;
//		}
//		//lower right ( player 4 )
//		count = 0;
//		foreach( Profile p in FileIO.profileContainer.profiles )
//		{
//			sButton b = new sButton();
//			b.Init( p.name , new Vector2( (Screen.width / 2 + Screen.width / 4) - standardButton.width/2 , standardButton.y + (Screen.height * fSecondRowDropPercent) + count*30) , new Vector2( standardButton.width, standardButton.height ) , LoadProfileP4 , p.name );
//			lP4Buttons.Add( b );
//			count++;
//		}
//	}
//	
//	// Update is called once per frame
//	void Update () 
//	{
//		//if profile is selected, stop updating
//		menuInputPlayerOne.SetActiveButton( lP1Buttons[ menuInputPlayerOne.GetIndex() ] );
//		if( playerOneSelectedProfile == null )
//			menuInputPlayerOne.Update();
//
//		menuInputPlayerTwo.SetActiveButton( lP2Buttons[ menuInputPlayerTwo.GetIndex() ] );
//		if( playerTwoSelectedProfile == null )
//			menuInputPlayerTwo.Update();
//
//		menuInputPlayerThree.SetActiveButton( lP3Buttons[ menuInputPlayerThree.GetIndex() ] );
//		if( playerThreeSelectedProfile == null )
//			menuInputPlayerThree.Update();
//
//		menuInputPlayerFour.SetActiveButton( lP4Buttons[ menuInputPlayerFour.GetIndex() ] );
//		if( playerFourSelectedProfile == null )
//			menuInputPlayerFour.Update();
//
//		CheckProfilesLoaded ();
//	}
//
//	void OnGUI()
//	{
//		menuInputPlayerOne.Draw();
//		menuInputPlayerTwo.Draw();
//		menuInputPlayerThree.Draw();
//		menuInputPlayerFour.Draw();
//		foreach( sButton b in lP1Buttons )
//		{
//			b.Draw();
//		}
//		foreach( sButton b in lP2Buttons )
//		{
//			b.Draw();
//		}
//		foreach( sButton b in lP3Buttons )
//		{
//			b.Draw();
//		}
//		foreach( sButton b in lP4Buttons )
//		{
//			b.Draw();
//		}
//
//	}
//
//	void CheckProfilesLoaded()
//	{
//		if (playerOneSelectedProfile != null)
//			if( playerTwoSelectedProfile != null)
//				if( playerThreeSelectedProfile != null )
//					if( playerFourSelectedProfile != null )
//					{
//						profile.GetComponent<ProfileObjectScript>().FillArray( playerOneSelectedProfile , playerTwoSelectedProfile , playerThreeSelectedProfile , playerFourSelectedProfile );
//						Application.LoadLevel( sFirstLevelName );
//					}
//	}
//
//	void CreateProfile()
//	{
//		profile = new GameObject();
//		profile.tag = "Profile";
//		profile.AddComponent<ProfileObjectScript>();
//		//profile.GetComponent<ProfileObjectScript>().FillArray( p , null , null , null );
//		DontDestroyOnLoad( profile );
//	}
//
//	void LoadProfileP1()
//	{
//		Profile p = FileIO.GetProfileByName( menuInputPlayerOne.active.GetLevel() );
//		if( p.name == "" )
//		{
//			print( "Load failed" );
//			return;
//		}
//		playerOneSelectedProfile = p;
//		//Application.LoadLevel( sFirstLevelName );
//	}
//	void LoadProfileP2()
//	{
//		Profile p = FileIO.GetProfileByName( menuInputPlayerTwo.active.GetLevel() );
//		if( p.name == "" )
//		{
//			print( "Load failed" );
//			return;
//		}
//		playerTwoSelectedProfile = p;
//		//Application.LoadLevel( sFirstLevelName );
//	}
//	void LoadProfileP3()
//	{
//		Profile p = FileIO.GetProfileByName( menuInputPlayerThree.active.GetLevel() );
//		if( p.name == "" )
//		{
//			print( "Load failed" );
//			return;
//		}
//		playerThreeSelectedProfile = p;
//		//Application.LoadLevel( sFirstLevelName );
//	}
//	void LoadProfileP4()
//	{
//		Profile p = FileIO.GetProfileByName( menuInputPlayerFour.active.GetLevel() );
//		if( p.name == "" )
//		{
//			print( "Load failed" );
//			return;
//		}
//		playerFourSelectedProfile = p;
//		//Application.LoadLevel( sFirstLevelName );
//	}
}
