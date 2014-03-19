using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System.Xml.Serialization;
using System.IO;
using System.Text;
using System;


public static class FileIO 
{

	static bool bWebBuild = false;
	static bool bCheckedWebBuild = false;

	static string profilesPath;

	public static ProfileContainer profileContainer;

	public static void AddToContainer( Profile aProfile )
	{
		if( profileContainer == null)
		{
			profileContainer = new ProfileContainer();
		}
		if( profileContainer.profiles.Find( x => x.name == aProfile.name ) != null )
		{//profile already exist, replace it by deleting old one
			profileContainer.profiles.Remove( profileContainer.profiles.Find(  x => x.name == aProfile.name ) );
		}
		profileContainer.profiles.Add( aProfile );
	}

	public static void LoadProfiles()
	{
		if( bWebBuild )
		{
			profileContainer = new ProfileContainer();
			profileContainer.profiles = new List<Profile>();
			profileContainer.profiles.Add( Profile.Default() );
		}
		else if( ! bCheckedWebBuild )
		{
			GetProfilesPath();
			LoadProfiles();
		}
		else if( profileContainer == null)
		{
			profileContainer = new ProfileContainer();
		}
		profileContainer = profileContainer.Load( GetProfilesPath() );
	}

	public static void SaveProfiles()
	{
		if( profileContainer == null)
		{
			profileContainer = new ProfileContainer();
		}
		profileContainer.Save( GetProfilesPath() );
	}

	public static string GetProfilesPath()
	{

		//check if webbuild
		bCheckedWebBuild = true;
		if( Application.platform == RuntimePlatform.WindowsWebPlayer )
		{
			bWebBuild = true;
		}
		if( profilesPath == null || profilesPath == "" )
		{
			Debug.Log("Profilespath not set");
			//Application.dataPath.
			return  Application.dataPath + "/Profiles.xml";
		}
		return profilesPath;
	}

	public static void SetProfilesPath(string aPath)
	{
		profilesPath = aPath;
	}

	public static Profile GetProfileByName( string aName)
	{
		foreach( Profile p in profileContainer.profiles )
		{
			if( p.name == aName )
			{
				return p;
			}
		}
		return new Profile();
	}

	public static void DeleteProfileFromList(string aName)
	{
		if( profileContainer.profiles.Find( x => x.name == aName ) != null )
			profileContainer.profiles.Remove( profileContainer.profiles.Find( x => x.name == aName ) );
	}
}

public class ProfileContainer
{
	[XmlArray("Profiles")]
	[XmlArrayItem("Profile")]

//	public ProfileContainer() //this code breaks XmlArray code above
//	{
//		profiles = new List<Profile>();
//	}

	public List<Profile> profiles = new List<Profile>();

	public ProfileContainer Load( string path )
	{
		var serializer = new XmlSerializer( typeof( ProfileContainer ) );

		if(!File.Exists( path ) )
		{
			var	stream2 = new FileStream(path ,FileMode.Create,FileAccess.ReadWrite);
			stream2.Close();
			profiles.Add( Profile.Default() );
			Save( path );

		}
		var	stream = new FileStream( path , FileMode.Open );
		var container = serializer.Deserialize(stream) as ProfileContainer;
		stream.Close();
		return container;

	}

	public void Save( string path)
	{
		var serializer = new XmlSerializer( typeof( ProfileContainer ) );
		var stream = new FileStream( path , FileMode.Open) ;
		serializer.Serialize( stream, this);
		stream.Close();

	}
}