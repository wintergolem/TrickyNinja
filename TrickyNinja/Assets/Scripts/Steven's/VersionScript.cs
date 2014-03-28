using UnityEngine;
using System.Collections;

public class VersionScript : MonoBehaviour {

	public GUIText text;
	public string Warning = "Change BEFORE a pull request";
	public int iMainVersion = 1;
	public int iDevenVersion = 0;
	public int iJasonVersion = 0;
	public int iStevenVersion = 0;

	// Use this for initialization
	void Start ()
	{
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		text.text = string.Format("Version: 0.{0}.{1}.{2}.{3} " , iMainVersion , iDevenVersion , iJasonVersion , iStevenVersion);
	}
}
