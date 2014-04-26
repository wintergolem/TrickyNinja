using TC;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof (TCParticleSystem))]
public class TCParticleSystemEditor : TCEdtiorBase<TCParticleSystem>
{
	[SerializeField] private OpenClose o;

	private TCWireframeDrawer m_drawer;

	protected override void OnTCEnable() {
		o = GetOpenClose();

		m_drawer = new TCWireframeDrawer(Target);
	}


	private void OnDisable() {
		m_drawer.Release();
	}

	private enum DampingPopup
	{
		Constant,
		Curve
	}

	private void Space() {
		GUILayout.Space(10.0f);
	}


	// Update is called once per frame
	public override void OnTCInspectorGUI() {
		if (o.ToggleArea("Particle System", new Color(1.0f, 0.8f, 0.8f))) {
			GUI.enabled = !EditorApplication.isPlaying;
			PropField("_manager._duration", "System Life");
			PropField("_manager.looping");
			PropField("_manager.prewarm");
			PropField("_manager.playOnAwake");
			PropField("_manager.delay", "Start Delay");
			PropField("_manager._maxParticles");

			foreach (TCParticleSystem t in targets) {
				t.MaxParticles = Mathf.Clamp(t.MaxParticles, 0, 5000000);
			}

			GUI.enabled = true;

			Space();

			PropField("_manager._simulationSpace");
			PropField("_emitter._inheritVelocity");
			PropField("_manager.shurikenFallback");
		}
		o.ToggleAreaEnd("Particle System");


		if (o.ToggleArea("Emission", new Color(0.8f, 1.0f, 0.8f))) {
			PropField("_emitter.emit");

			GUILayout.BeginHorizontal();

			PropField("_emitter._emissionRate");



			PropField("_emitter.m_emissionType", "", GUILayout.Width(70.0f));


			GUILayout.EndHorizontal();

			foreach (TCParticleSystem t in targets) {
				t.Emitter.EmissionRate = Mathf.Clamp(t.Emitter.EmissionRate, 0, 5000000);
			}


			SerializedProperty bursts = GetProperty("_emitter.bursts");
			EditorGUILayout.BeginHorizontal();
			GUILayout.Label("Bursts", GUILayout.Width(80.0f));
			const float width = 51.0f;
			GUILayout.Label("Time", GUILayout.Width(width));
			GUILayout.Label("Particles", GUILayout.Width(width));
			EditorGUILayout.EndHorizontal();


			int del = -1;
			for (int i = 0; i < bursts.arraySize; ++i) {
				GUILayout.BeginHorizontal();
				GUILayout.Space(85.0f);
				EditorGUILayout.PropertyField(CheckBurstProp("time", i), new GUIContent(""), GUILayout.Width(width));
				EditorGUILayout.PropertyField(CheckBurstProp("amount", i), new GUIContent(""), GUILayout.Width(width));
				GUILayout.Space(10.0f);

				if (GUILayout.Button("", "OL Minus", GUILayout.Width(24.0f))) {
					del = i;
				}

				GUILayout.EndHorizontal();
			}
			GUILayout.BeginHorizontal();
			GUILayout.Space(103.0f + 2 * width);
			if (GUILayout.Button("", "OL Plus", GUILayout.Width(24.0f))) {
				bursts.InsertArrayElementAtIndex(bursts.arraySize);
			}
			GUILayout.EndHorizontal();

			if (del != -1) {
				bursts.DeleteArrayElementAtIndex(del);
			}


			Space();


			PropField("_emitter.pes.shape");


			int s = GetProperty("_emitter.pes.shape").enumValueIndex;

			switch (s) {
				case (int) EmitShapes.HemiSphere:
				case (int) EmitShapes.Sphere:
					PropField("_emitter.pes.radius");
					break;
				case (int) EmitShapes.Box:
					PropField("_emitter.pes.cubeSize");
					break;
				case (int) EmitShapes.Cone:
					PropField("_emitter.pes.coneRadius");
					PropField("_emitter.pes.coneHeight");
					PropField("_emitter.pes.coneAngle");
					break;
				case (int) EmitShapes.Ring:
					PropField("_emitter.pes.ringRadius");
					PropField("_emitter.pes.ringOuterRadius");
					break;
				case (int) EmitShapes.Line:
					PropField("_emitter.pes.lineLength");
					PropField("_emitter.pes.lineRadius");
					break;
				case (int) EmitShapes.Mesh:
					PropField("_emitter.pes.emitMesh");
					PropField("_emitter.pes.spawnOnMeshSurface");
					break;
			}


			GUILayout.Space(10.0f);


			PropField("_emitter.pes.startDirectionType");

			int type = GetProperty("_emitter.pes.startDirectionType").enumValueIndex;
			if (type == (int) StartDirectionType.Vector) {
				PropField("_emitter.pes.startDirectionVector");
				PropField("_emitter.pes.startDirectionRandomAngle");
			}
		}
		o.ToggleAreaEnd("Emission");


		if (o.ToggleArea("Particles", new Color(0.0f, 0.8f, 1.0f))) {
			PropField("_emitter._energy", "Lifetime");

			GUILayout.Space(10.0f);

			PropField("_emitter._speed", "Start Speed");
			PropField("_emitter._velocityOverLifetime");

			Space();

			PropField("_emitter._size", "Start Size");
			PropField("_emitter._sizeOverLifetime");

			Space();

			PropField("_emitter._rotation", "Start Rotation");
			PropField("_emitter._angularVelocity");

			GUILayout.Space(10.0f);


			GUILayout.BeginHorizontal();
			var mode = GetProperty("_particleRenderer.colourGradientMode");
			var colProp = GetProperty("_particleRenderer._colourOverLifetime");

			switch (mode.enumValueIndex) {
				case (int) ParticleColourGradientMode.OverLifetime:
					EditorGUILayout.PropertyField(colProp, new GUIContent("Colour over lifetime"), GUILayout.Width(260.0f));
					break;
				default:
					EditorGUILayout.PropertyField(colProp, new GUIContent("Colour over speed"), GUILayout.Width(260.0f));
					break;
			}

			EnumPopup(mode, (ParticleColourGradientMode) mode.enumValueIndex);

			GUILayout.EndHorizontal();


			if (mode.enumValueIndex != (int) ParticleColourGradientMode.OverLifetime) {
				EditorGUILayout.PropertyField(GetProperty("_particleRenderer.maxSpeed"));
			}
		}
		o.ToggleAreaEnd("Particles");


		if (o.ToggleArea("Forces", new Color(1.0f, 1.0f, 0.8f))) {
			PropField("_forcesManager._maxForces");
			PropField("_manager.gravityMultiplier");
			PropField("_emitter._constantForce");
			PropField("_forcesManager._massVariance");

			var fmanager = Target.ForceManager;


			EditorGUILayout.BeginHorizontal();
			PropField("_forcesManager._forceLayers");


			if (GUILayout.Button("", "OL Plus", GUILayout.Width(20.0f))) {
				fmanager.BaseForces.Add(null);
			}

			EditorGUILayout.EndHorizontal();


			if (fmanager.BaseForces != null) {
				int del = -1;
				for (int i = 0; i < fmanager.BaseForces.Count; ++i) {
					GUILayout.BeginHorizontal();
					GUILayout.Space(20.0f);
					fmanager.BaseForces[i] =
						EditorGUILayout.ObjectField("Link to ", fmanager.BaseForces[i], typeof (TCForce), true) as TCForce;

					if (GUILayout.Button("", "OL Minus", GUILayout.Width(20.0f))) {
						del = i;
					}

					GUILayout.EndHorizontal();
				}

				if (del != -1) {
					fmanager.BaseForces.RemoveAt(del);
				}

				fmanager.MaxForces = Mathf.Max(fmanager.MaxForces, fmanager.BaseForces.Count);
			}


			GUILayout.BeginHorizontal();
			SerializedProperty curveProp = GetProperty("_manager.dampingIsCurve");
			EditorGUILayout.PropertyField(
				curveProp.boolValue ? GetProperty("_manager.dampingCurve") : GetProperty("_manager.damping"),
				new GUIContent("Damping"));

			curveProp.boolValue =
				(DampingPopup)
				EditorGUILayout.EnumPopup("", curveProp.boolValue ? DampingPopup.Curve : DampingPopup.Constant, EditorStyles.toolbarPopup,
				                          GUILayout.Width(15.0f)) == DampingPopup.Curve;


			GUILayout.EndHorizontal();


			PropField("_forcesManager.useBoidsFlocking");

			if (GetProperty("_forcesManager.useBoidsFlocking").boolValue) {
				PropField("_forcesManager.boidsPositionStrength");
				PropField("_forcesManager.boidsVelocityStrength");
				PropField("_forcesManager.boidsCenterStrength");
			}
		}
		o.ToggleAreaEnd("Forces");


		if (o.ToggleArea("Collision", new Color(1.0f, 0.8f, 1.0f))) {
			PropField("_colliderManager._maxColliders");
			PropField("_colliderManager.overrideBounciness");

			if (GetProperty("_colliderManager.overrideBounciness").boolValue) {
				PropField("_colliderManager._bounciness");
			}

			PropField("_colliderManager.overrideStickiness");

			if (GetProperty("_colliderManager.overrideStickiness").boolValue) {
				PropField("_colliderManager._stickiness");
			}

			PropField("_colliderManager._particleThickness");

			TCParticleColliderManager cmanager = Target.ColliderManager;

			var baseColliders = cmanager.BaseColliders;

			EditorGUILayout.BeginHorizontal();
			PropField("_colliderManager._colliderLayers");

			if (GUILayout.Button("", "OL Plus", GUILayout.Width(20.0f))) {
				baseColliders.Add(null);
			}

			EditorGUILayout.EndHorizontal();

			int del = -1;
			for (int i = 0; i < baseColliders.Count; ++i) {
				GUILayout.BeginHorizontal();
				GUILayout.Space(20.0f);
				baseColliders[i] =
					EditorGUILayout.ObjectField("Link to ", baseColliders[i], typeof (TCCollider), true) as TCCollider;

				if (GUILayout.Button("", "OL Minus", GUILayout.Width(20.0f))) {
					del = i;
				}

				GUILayout.EndHorizontal();
			}

			if (del != -1) {
				baseColliders.RemoveAt(del);
			}

			cmanager.MaxColliders = Mathf.Max(cmanager.MaxColliders, baseColliders.Count);
		}
		o.ToggleAreaEnd("Collision");

		if (o.ToggleArea("Renderer", new Color(0.8f, 1.0f, 1.0f))) {
			PropField("_particleRenderer._material");
			PropField("_particleRenderer._renderMode");

			var renderMode = (RenderMode) GetProperty("_particleRenderer._renderMode").enumValueIndex;

			switch (renderMode) {
				case RenderMode.Mesh:
					PropField("_particleRenderer._mesh");
					break;
				case RenderMode.TailStretchBillboard:
				case RenderMode.StretchedBillboard:
					PropField("_particleRenderer._lengthScale");
					PropField("_particleRenderer._speedScale");
					if (renderMode == RenderMode.TailStretchBillboard) {
						PropField("_particleRenderer.tailUv");
					}
					break;
			}

			if (renderMode == RenderMode.Billboard || renderMode == RenderMode.StretchedBillboard || renderMode == RenderMode.TailStretchBillboard) {
				PropField("_particleRenderer.isPixelSize");
				PropField("_particleRenderer.spriteSheetAnimation");
			}

			if (GetProperty("_particleRenderer.spriteSheetAnimation").boolValue) {
				PropField("_particleRenderer.spriteSheetColumns");
				PropField("_particleRenderer.spriteSheetRows");
				PropField("_particleRenderer.spriteSheetCycles");
			}

			PropField("_particleRenderer.glow");
			PropField("_particleRenderer._useFrustumCulling");

			if (GetProperty("_particleRenderer._useFrustumCulling").boolValue) {
				SerializedProperty boundsProp = GetProperty("_particleRenderer._bounds");
				boundsProp.boundsValue = EditorGUILayout.BoundsField(boundsProp.boundsValue);

				PropField("_particleRenderer.culledSimulationMode");

				if (GetProperty("_particleRenderer.culledSimulationMode").enumValueIndex ==
				    (int) CulledSimulationMode.SlowSimulation) {
					PropField("_particleRenderer.cullSimulationDelta");
				}
			}
		}
		o.ToggleAreaEnd("Renderer");


		if (EditorApplication.isPlaying) {
			foreach (TCParticleSystem t in targets) {
				t.ParticleRenderer.UpdateColourOverLifetime();
				t.Emitter.UpdateSizeOverLifetime();
			}
		}


		if (GUI.changed) {
			EditorUtility.SetDirty(o);


			if (Target.Emitter.Shape == EmitShapes.Mesh) {
				m_drawer.UpdateMesh();
			}
		}
	}

	public void OnSceneGUI() {
		TCParticleEmitter e = Target.Emitter;

		if (e == null) {
			return;
		}


		var col = new Color(0.6f, 0.9f, 1.0f);

		Handles.color = col;

		switch (e.Shape) {
			case EmitShapes.Sphere:


				e.Radius.Max = RadiusHandle(Target.transform, e.Radius.Max, true);
				if (!e.Radius.IsConstant) {
					Handles.color = new Color(0.6f, 0.9f, 1.0f, 0.4f);
					if (e.Radius.Min != 0.0f) {
						e.Radius.Min = RadiusHandle(Target.transform, e.Radius.Min, true);
					}
					Handles.color = col;
				}


				break;

			case EmitShapes.Box:
				e.CubeSize = CubeHandle(Target.transform, e.CubeSize);
				break;

			case EmitShapes.HemiSphere:


				e.Radius.Value = HemisphereHandle(Target.transform, e.Radius.Max, true);

				if (!e.Radius.IsConstant) {
					if (e.Radius.Min != 0.0f) {
						e.Radius.Min = HemisphereHandle(Target.transform, e.Radius.Min, true);
					}
				}

				break;

			case EmitShapes.Cone:
				ConeHandle(GetProperty("_emitter.pes.coneAngle"), GetProperty("_emitter.pes.coneHeight"),
				           GetProperty("_emitter.pes.coneRadius"), Target.transform);
				break;

			case EmitShapes.Ring:
				TorusHandle(GetProperty("_emitter.pes.ringRadius"), GetProperty("_emitter.pes.ringOuterRadius"),
				            Target.transform);
				break;

			case EmitShapes.Line:
				SerializedProperty length = GetProperty("_emitter.pes.lineLength");

				length.floatValue = LineHandle(length.floatValue, Target.transform);


				break;

			case EmitShapes.Mesh:
				if (e.EmitMesh == null) {
					break;
				}

				m_drawer.DrawWireMesh();

				break;
		}

		serializedObject.ApplyModifiedProperties();
	}


	[DrawGizmo(GizmoType.SelectedOrChild)]
	private static void RenderGizmo(TCParticleSystem syst) {
		if (syst.ParticleRenderer == null) {
			return;
		}

		if (syst.ParticleRenderer.UseFrustumCulling) {
			Gizmos.DrawWireCube(syst.transform.position + syst.ParticleRenderer.Bounds.center,
			                    syst.ParticleRenderer.Bounds.extents);
		}
	}
}