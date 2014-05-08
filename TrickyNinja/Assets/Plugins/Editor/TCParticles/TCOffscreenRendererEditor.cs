using UnityEditor;
using UnityEngine;

[CustomEditor(typeof (TCOffscreenRenderer))]
public class TCOffscreenRendererEditor : TCEdtiorBase<TCOffscreenRenderer>
{

	// Update is called once per frame
	public override void OnTCInspectorGUI()
	{
		PropField("offscreenLayer");
		PropField("downsampleFactor");
		PropField("compositeMode");

		if (!serializedObject.isEditingMultipleObjects)
		{
			switch ((TCOffscreenRenderer.CompositeMode) GetProperty("compositeMode").enumValueIndex)
			{
				case TCOffscreenRenderer.CompositeMode.Gradient:
					PropField("compositeGradient");
					PropField("tint");
					PropField("gradientScale");
					break;

				case TCOffscreenRenderer.CompositeMode.Distort:
					PropField("distortStrength");
					break;
			}
		}


		if (EditorApplication.isPlaying)
		{
			foreach (TCOffscreenRenderer t in targets)
			{
				t.UpdateCompositeGradient();
			}
		}
		EditorGUILayout.HelpBox("This feature is still experimental! For more info, refer to the manual", MessageType.Warning);
	}
}