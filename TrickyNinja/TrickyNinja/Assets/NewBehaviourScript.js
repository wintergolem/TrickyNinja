#pragma strict

import System.IO;

function Start () {

}

function Update () {
	//Directory.CreateDirectory("Death");
	File.WriteAllText("../Death" , "sword > pen ");
}