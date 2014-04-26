using TC.Internal;
using UnityEditor;
using UnityEngine;

[CustomPropertyDrawer(typeof (MinMaxRandom))]
public class MinMaxRandomDrawer : PropertyDrawer
{
	private Rect rect;
	private string[] options = {"Constant", "Curve", "Random Between Two Constants", "Random Between Two Curves"};

	private Rect GetRect(float width)
	{
		Rect ret = new Rect(rect.x, rect.y, width, rect.height);
		rect.x += width;
		return ret;
	}

	// Here you can define the GUI for your property drawer. Called by Unity.
	public override void OnGUI(Rect position, SerializedProperty prop, GUIContent label)
	{
		EditorGUI.BeginProperty(position, label, prop);
		position.x += 5.0f;
		rect = position;
		
		var mode = (MinMaxRandom.MinMaxMode) prop.FindPropertyRelative("modeProp").enumValueIndex;

		if (mode == MinMaxRandom.MinMaxMode.Constant)
			EditorGUI.PropertyField(GetRect(260.0f), prop.FindPropertyRelative("valueProp"), label);
		else if (mode == MinMaxRandom.MinMaxMode.RandomBetween)
		{
			EditorGUI.PropertyField(GetRect(190.0f), prop.FindPropertyRelative("minProp"), label);
			EditorGUI.PropertyField(GetRect(70.0f), prop.FindPropertyRelative("maxProp"), new GUIContent(""));
		}
		else if (mode == MinMaxRandom.MinMaxMode.Curve)
			EditorGUI.PropertyField(GetRect(260.0f), prop.FindPropertyRelative("valueCurve"), label);
		else if (mode == MinMaxRandom.MinMaxMode.RandomBetweenCurves)
		{
			EditorGUI.PropertyField(GetRect(188.0f), prop.FindPropertyRelative("minCurve"), label);
			GetRect(4.0f);
			EditorGUI.PropertyField(GetRect(68.0f), prop.FindPropertyRelative("maxCurve"), new GUIContent(""));
		}


		GUIStyle s = EditorStyles.toolbarPopup;
		s.contentOffset = new Vector2(100.0f, 100.0f);
		s.fixedWidth = 12.0f;

		prop.FindPropertyRelative("modeProp").enumValueIndex =
			EditorGUI.Popup(GetRect(100.0f), (int) mode, options, s);
		EditorGUI.EndProperty();
	}
}