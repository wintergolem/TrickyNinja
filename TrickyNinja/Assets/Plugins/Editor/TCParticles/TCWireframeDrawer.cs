using UnityEngine;
using System.Collections;

public class TCWireframeDrawer
{
	private TCParticleSystem m_partSyst;

	private Material m_lineMat;
	private Vector3[] m_lines;

	private void BuildLineMesh()
	{
		if (m_partSyst.Emitter == null || m_partSyst.Emitter.EmitMesh == null) {
			return;
		}

		var vertices = m_partSyst.Emitter.EmitMesh.vertices;
		var triangles = m_partSyst.Emitter.EmitMesh.triangles;

		m_lines = new Vector3[triangles.Length];

		for (int i = 0; i < triangles.Length; i += 3) {
			m_lines[i + 0] = vertices[triangles[i]];
			m_lines[i + 1] = vertices[triangles[i + 1]];
			m_lines[i + 2] = vertices[triangles[i + 2]];
		}
	}

	public TCWireframeDrawer(TCParticleSystem system)
	{
		m_partSyst = system;
		m_lineMat =
			new Material(
				"Shader \"Lines/Colored Blended\" { SubShader { Pass { Blend SrcAlpha OneMinusSrcAlpha ZWrite Off Cull Front Fog { Mode Off } } } }")
			{
				hideFlags = HideFlags.HideAndDontSave,
				shader = {hideFlags = HideFlags.HideAndDontSave}
			};

		BuildLineMesh();
	}

	public void UpdateMesh()
	{
		BuildLineMesh();
	}

	public void DrawWireMesh()
	{
		if (m_lines == null || m_lines.Length == 0) {
			return;
		}

		m_lineMat.SetPass(0);

		GL.PushMatrix();
		GL.MultMatrix(Matrix4x4.TRS(m_partSyst.transform.position, m_partSyst.transform.rotation,
		                            m_partSyst.transform.localScale));
		GL.Begin(GL.LINES);
		GL.Color(new Color(1.0f, 1.0f, 1.0f, 0.4f));

		for (int i = 0; i < m_lines.Length / 3; i++) {
			GL.Vertex(m_lines[i * 3]);
			GL.Vertex(m_lines[i * 3 + 1]);

			GL.Vertex(m_lines[i * 3 + 1]);
			GL.Vertex(m_lines[i * 3 + 2]);

			GL.Vertex(m_lines[i * 3 + 2]);
			GL.Vertex(m_lines[i * 3]);
		}

		GL.End();
		GL.PopMatrix();
	}

	public void Release()
	{
		if (m_lineMat.shader != null) {
			Object.DestroyImmediate(m_lineMat.shader);
		}

		Object.DestroyImmediate(m_lineMat);
	}
}