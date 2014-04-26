using TC;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof (TCCollider))]
[CanEditMultipleObjects]
public class TCColliderEditor : TCEdtiorBase<TCCollider>
{
	// Update is called once per frame
	public override void OnTCInspectorGUI()
	{
		var shape = (ColliderShape) GetProperty("shape").enumValueIndex;

		PropField("shape");

		switch (shape)
		{
			case ColliderShape.Disc:
				PropField("radius");
				PropField("rounding");
				PropField("discHeight");
				PropField("discType");
				break;

			case ColliderShape.Hemisphere:
				PropField("radius");
				break;

			case ColliderShape.RoundedBox:
				PropField("boxSize");
				PropField("rounding");
				break;
		}


		GUILayout.Space(10.0f);


		if (shape != ColliderShape.Terrain)
		{
			PropField("inverse");
			PropField("_inheritVelocity");
			PropField("_particleLifeLoss");
		}
		PropField("_bounciness");
		PropField("_stickiness");
	}


	public void OnSceneGUI()
	{
		var c = target as TCCollider;

		if (c == null) return;

		switch (c.shape)
		{
			case ColliderShape.Disc:
				if (c.radius == null)
					return;

				float rmin = c.radius.IsConstant ? 0.0f : c.radius.Min;
				float rmax = c.radius.Max;

				float round;
				DiscHandle(c.transform, rmin, rmax, c.discHeight, c.rounding, (int) c.discType, out rmin, out rmax, out round);

				c.rounding = round;

				c.radius.Min = rmin;
				c.radius.Max = rmax;

				break;

			case ColliderShape.Hemisphere:
				c.radius.Max = HemisphereHandle(c.transform, c.radius.Value);
				break;

			case ColliderShape.RoundedBox:
				Vector3 sz = c.boxSize;

				float r = c.rounding;
				c.rounding = Mathf.Clamp(c.rounding, 0.0f, Mathf.Min(c.boxSize.x, c.boxSize.y, c.boxSize.z) * 0.5f);
				c.boxSize = RoundedCubeHandle(sz, r, c.transform);

				break;
		}
	}
}