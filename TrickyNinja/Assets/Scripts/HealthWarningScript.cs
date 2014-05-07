using UnityEngine;
using System.Collections;

public class HealthWarningScript : MonoBehaviour 
{
	public Renderer rMyRender;
	public PlayerScriptDeven playerScript;

	void Update()
	{
		if(playerScript.fHealth <= 50.0f)
			rMyRender.material.SetFloat("_AlphaLevel", (50.0f - playerScript.fHealth)/5 + 1  );
		else
			rMyRender.material.SetFloat("_AlphaLevel", 0);
	}

	
}
