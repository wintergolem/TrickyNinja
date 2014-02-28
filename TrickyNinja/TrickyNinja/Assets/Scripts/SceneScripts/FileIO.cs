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
		if( profileContainer == null)
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

	public List<Profile> profiles = new List<Profile>();

	public ProfileContainer Load( string path )
	{
		var serializer = new XmlSerializer( typeof( ProfileContainer ) );

		if(File.Exists( path ) )
		{
		var	stream = new FileStream( path , FileMode.Open );
			var container = serializer.Deserialize(stream) as ProfileContainer;
			stream.Close();
			return container;
		}
		else
		{
		var	stream = new FileStream(path ,FileMode.Create,FileAccess.Write);

//			string s = " <?xml version=\"1.0\" encoding=\"Windows-1252\"?>\n<ProfileContainer xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">\n"
//					+ "<Profiles>\n"
//					+"<Profile name=\"Deven\" atttack=\"A\" jump=\"B\" pause=\"X\" Swap1=\"Y\" Swap2=\"LeftTrigger\" Swap3=\"LeftShoulder\" Swap4=\"RightShoulder\" /> \n"
//					+ "</Profiles>\n"
//					+ "</ProfileContainer>";
			string s = "hi";
			System.IO.StreamWriter file = new System.IO.StreamWriter( "@" + path , true);
			file.WriteLine(s);
			var container = serializer.Deserialize(stream) as ProfileContainer;
			stream.Close();
			return container;

		}

	}

	public void Save( string path )
	{
		//System.IO.File.WriteAllText( path , string.Empty );
		var serializer = new XmlSerializer( typeof( ProfileContainer ) );
		var stream = new FileStream( path , FileMode.OpenOrCreate) ;
		serializer.Serialize( stream, this);
		stream.Close();

		Load( path );
	}
}