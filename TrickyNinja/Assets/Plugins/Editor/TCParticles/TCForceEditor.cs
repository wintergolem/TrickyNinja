using System.Collections.Generic;
using TC;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof (TCForce))]
[CanEditMultipleObjects]
public class TCForceEditor : TCEdtiorBase<TCForce>
{
	private TCForce m_forceTarget;
	private List<TCForce> m_forces;
	private TCForce m_primeForce;

	private OpenClose m_openClose;

	private TCNoiseForceGenerator m_forceGenerator;

	protected override void OnTCEnable() {
		m_forceTarget = target as TCForce;

		if (m_forceTarget != null) {
			m_forces = new List<TCForce>(m_forceTarget.GetComponents<TCForce>());
		}
		m_primeForce = m_forces[0];
		m_forces.RemoveAt(0);

		m_openClose = GetOpenClose();
		m_forceGenerator = new TCNoiseForceGenerator(m_forceTarget);
	}

	// Update is called once per frame

	public override void OnTCInspectorGUI() {
		int shape = GetProperty("shape").enumValueIndex;

		if (m_forceTarget != m_primeForce) {
			GetProperty("primary").boolValue = false;
			GetProperty("globalShape").boolValue = false;
		}
		else {
			GetProperty("primary").boolValue = true;
		}


		if (m_openClose.ToggleArea("TC Force", new Color(1.0f, 0.8f, 0.8f))) {
			PropField("power");

			if (shape != (int) ForceShape.Box && shape != (int) ForceShape.Constant) {
				PropField("_attenuation");
				PropField("attenuationType");
			}

			if (m_forceTarget == m_primeForce) {
				PropField("_inheritVelocity");
			}
		}
		m_openClose.ToggleAreaEnd("TC Force");

		if (!m_primeForce.IsGlobalShape || m_forceTarget == m_primeForce) {
			if (m_openClose.ToggleArea("Force Shape", new Color(0.8f, 0.8f, 1.0f))) {
				if (m_forceTarget == m_primeForce && m_forces.Count > 0) {
					GUILayout.BeginHorizontal();
					EditorGUILayout.PropertyField(GetProperty("shape"), new GUIContent("shape"), GUILayout.MinWidth(180.0f));
					GUILayout.Label("Global", GUILayout.Width(40.0f));
					GUI.enabled = !EditorApplication.isPlaying;
					EditorGUILayout.PropertyField(GetProperty("globalShape"), new GUIContent(""), GUILayout.Width(25.0f));
					GUI.enabled = true;
					GUILayout.Space(5.0f);
					GUILayout.EndHorizontal();
				}
				else {
					PropField("shape");
				}

				if (shape != (int) ForceShape.Box && shape != (int) ForceShape.Constant) {
					PropField("radius");
				}

				if (shape == (int) ForceShape.Capsule) {
					PropField("height");
				}
				else if (shape == (int) ForceShape.Box) {
					PropField("boxSize");
				}
				else if (shape == (int) ForceShape.Disc) {
					PropField("discHeight");
					PropField("discRounding");
					PropField("discType");
				}
			}
			m_openClose.ToggleAreaEnd("Force Shape");
		}


		int type = GetProperty("forceType").enumValueIndex;
		bool generate = false;

		if (m_openClose.ToggleArea("Force Type", new Color(0.8f, 1.0f, 0.8f))) {
			GUI.changed = false;
			PropField("forceType");
			if (GUI.changed) {
				SceneView.RepaintAll();
			}

			switch (type) {
				case (int) ForceType.Vortex:
					PropField("vortexAxis");
					PropField("inwardForce");
					break;

				case (int) ForceType.Vector:
					PropField("forceDirection");
					PropField("forceDirectionSpace");
					break;

				case (int) ForceType.Turbulence:
					PropField("resolution");
					PropField("turbulenceFrequency");
					PropField("turbulencePower");
					PropField("noiseType");
					PropField("frequency");
					if (GetProperty("noiseType").enumValueIndex != (int) NoiseType.Voronoi) {
						PropField("lacunarity");
						PropField("octaveCount");
					}
					PropField("seed");
					if (GUI.changed) {
						m_forceGenerator.NeedsPreview = true;
					}

					break;
			}

			if (type == (int) ForceType.Turbulence || type == (int) ForceType.TurbulenceTexture) {
				PropField("noiseExtents");
				PropField("smoothness");

				GUI.changed = false;

				m_forceGenerator.PreviewMode =
					(TCNoiseForceGenerator.PreviewModeEnum) EditorGUILayout.EnumPopup("Preview mode", m_forceGenerator.PreviewMode);

				EditorGUI.BeginChangeCheck();

				m_forceGenerator.PreviewSlice = EditorGUILayout.Slider("Preview slice", m_forceGenerator.PreviewSlice, 0.0f, 1.0f);

				if (EditorGUI.EndChangeCheck()) {
					m_forceGenerator.NeedsPreview = true;
				}


				if (GUI.changed) {
					SceneView.RepaintAll();
				}


				PropField("forceTexture");
			}


			if (type == (int) ForceType.Turbulence) {
				GUILayout.BeginHorizontal();
				GUILayout.FlexibleSpace();

				string btn = "Update Noise";

				if (m_forceTarget.forceTexture == null) {
					btn = "Generate Noise";
				}

				if (GUILayout.Button(btn, GUILayout.Width(150.0f))) {
					generate = true;
				}
				GUILayout.FlexibleSpace();
				GUILayout.EndHorizontal();
			}
		}
		m_openClose.ToggleAreaEnd("Force Type");

		if (generate) {
			m_forceGenerator.GenerateTexture();
		}
	}


	public void OnSceneGUI() {
		var f = target as TCForce;

		if (m_primeForce.IsGlobalShape && f != m_primeForce || f == null || f.radius == null) {
			return;
		}


		switch (f.shape) {
			case ForceShape.Sphere:
				f.radius.Max = RadiusHandle(f.transform, f.radius.Max);

				if (!f.radius.IsConstant) {
					f.radius.Min = RadiusHandle(f.transform, f.radius.Min);
				}

				break;
			case ForceShape.Box:
				f.boxSize = CubeHandle(f.transform, f.boxSize);
				break;


			case ForceShape.Capsule:
				float r = f.radius.IsConstant ? f.radius.Value : f.radius.Max;
				Vector2 c = CapsuleHandle(f.transform, r, f.height);

				if (f.radius.IsConstant) {
					f.radius.Value = c.x;
				}
				else {
					f.radius.Max = c.x;
				}
				f.height = c.y;
				break;

			case ForceShape.Disc:
				float rmin = f.radius.IsConstant ? 0.0f : f.radius.Min;
				float rmax = f.radius.Max;
				float round;
				DiscHandle(f.transform, rmin, rmax, f.discHeight, f.discRounding, (int) f.discType, out rmin, out rmax,
				           out round);
				f.discRounding = round;
				f.radius.Min = rmin;
				f.radius.Max = rmax;
				break;

			case ForceShape.Hemisphere:

				f.radius.Max = HemisphereHandle(f.transform, f.radius.Max);

				break;
		}

		if (f.forceType == ForceType.Turbulence || f.forceType == ForceType.TurbulenceTexture) {
			m_forceGenerator.DrawTurbulencePreview();
		}
	}
}