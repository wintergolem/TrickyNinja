using UnityEngine;
using System.Collections;

[RequireComponent(typeof(AudioSource))]
public class mt_EmitRotate_dm : MonoBehaviour { //put me on same transform as animator object

  private Transform xform    ;
  private Vector3   spawnPos ;
  private Quaternion   spawnRot ;
  public  float     spinScale = 90.0f;

	public bool bRotate = true;

  void Awake(){
    xform = transform;
		spawnPos = xform.position;
		spawnRot = xform.rotation;
  }
  
	void Update(){
		float magDist = (spawnPos - xform.position).magnitude + 3.5f;
		if(bRotate){
			xform.Rotate((Vector3.right * spinScale * Time.deltaTime)*(magDist)); // * magDist);
		}
		xform.Translate(Vector3.forward * Time.deltaTime);
	}

}
