#region Main
@tool
extends Node3D

#region Creating Lines
func create_line_transform(
	color := Color.GREEN,
	from := Vector3.ZERO,
	to := Vector3.ZERO,
	_transform := Transform3D(),
	size := Vector3.ONE,
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := false,
	material: Material = null,
):
	var gizmo = GizmoLine3D.new(
		_get_scene_root(),
		color,
		from,
		to,
		size,
		_transform,
		cast_shadow,
		smooth_shading,
		[material]
	)
	return gizmo

func create_multiline_transform(
	color := Color.GREEN,
	points := PackedVector3Array(),
	_transform := Transform3D(),
	size := Vector3.ONE,
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := false,
	material: Material = null,
	colors := PackedColorArray(),
):
	var gizmo = GizmoMultiline3D.new(
		_get_scene_root(),
		color,
		points,
		_transform,
		size,
		cast_shadow,
		smooth_shading,
		[material],
		colors,
	)
	return gizmo
#endregion

#region Creating Boxes
func create_box(
	color := Color.GREEN,
	size := Vector3(1., 1., 1.),
	_position: Vector3 = Vector3.ZERO,
	_rotation := Vector3.ZERO,
	_scale := Vector3.ONE,
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := true,
	material: Material = null,
) -> GizmoBox3D:
	return create_box_transform(
		color,
		size,
		create_transform_from_values(_position, _rotation, _scale),
		cast_shadow,
		smooth_shading,
		material
	)

func create_box_transform(
	color := Color.GREEN,
	size := Vector3(1., 1., 1.),
	_transform := Transform3D(),
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := false,
	material: Material = null,
) -> GizmoBox3D:
	var gizmo = GizmoBox3D.new(
		_get_scene_root(),
		color,
		size,
		_transform,
		cast_shadow,
		smooth_shading,
		[material]
	)
	return gizmo

func create_box_outline(
	color := Color.GREEN,
	size := Vector3(1., 1., 1.),
	_position: Vector3 = Vector3.ZERO,
	_rotation := Vector3.ZERO,
	_scale := Vector3.ONE,
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := true,
	material: Material = null,
	colors := PackedColorArray(),
) -> GizmoBoxOutline3D:
	return create_box_outline_transform(
		color,
		size,
		create_transform_from_values(_position, _rotation, _scale),
		cast_shadow,
		smooth_shading,
		material,
		colors,
	)

func create_box_outline_transform(
	color := Color.GREEN,
	size := Vector3(1., 1., 1.),
	transform := Transform3D(),
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := false,
	material: Material = null,
	colors := PackedColorArray(),
) -> GizmoBoxOutline3D:
	var gizmo = GizmoBoxOutline3D.new(
		_get_scene_root(),
		color,
		size,
		transform,
		cast_shadow,
		smooth_shading,
		[material],
		colors,
	)
	return gizmo
#endregion

#region Creating Spheroids
func create_spheroid(
	color := Color.GREEN,
	size := Vector3(1., 1., 1.),
	_position: Vector3 = Vector3.ZERO,
	_rotation := Vector3.ZERO,
	_scale := Vector3.ONE,
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := true,
	material: Material = null,
	radial_segments := 64,
	rings := 32,
) -> GizmoSpheroid3D:
	return create_spheroid_transform(
		color,
		size,
		create_transform_from_values(_position, _rotation, _scale),
		cast_shadow,
		smooth_shading,
		material,
		radial_segments,
		rings,
	)

func create_spheroid_transform(
	color := Color.GREEN,
	size := Vector3(1., 1., 1.),
	_transform := Transform3D(),
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := true,
	material: Material = null,
	radial_segments := 64,
	rings := 32,
) -> GizmoSpheroid3D:
	var gizmo = GizmoSpheroid3D.new(
		_get_scene_root(),
		color,
		size,
		_transform,
		cast_shadow,
		smooth_shading,
		[material],
		radial_segments,
		rings,
	)
	return gizmo

func create_spheroid_outline(
	color := Color.GREEN,
	size := Vector3(1., 1., 1.),
	_position: Vector3 = Vector3.ZERO,
	_rotation := Vector3.ZERO,
	_scale := Vector3.ONE,
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := true,
	material: Material = null,
	vertical_segments := 4,
	horizontal_rings := 1,
	vertical_rings := 64,
	horizontal_segments := 64,
) -> GizmoSpheroidOutline3D:
	return create_spheroid_outline_transform(
		color,
		size,
		create_transform_from_values(_position, _rotation, _scale),
		cast_shadow,
		smooth_shading,
		material,
		vertical_segments,
		horizontal_rings,
		vertical_rings,
		horizontal_segments
	)

func create_spheroid_outline_transform(
	color := Color.GREEN,
	size := Vector3(1., 1., 1.),
	_transform := Transform3D(),
	cast_shadow := GeometryInstance3D.SHADOW_CASTING_SETTING_OFF,
	smooth_shading := true,
	material: Material = null,
	vertical_segments := 4,
	horizontal_rings := 1,
	vertical_rings := 64,
	horizontal_segments := 64,
) -> GizmoSpheroidOutline3D:
	var gizmo = GizmoSpheroidOutline3D.new(
		_get_scene_root(),
		color,
		size,
		_transform,
		cast_shadow,
		smooth_shading,
		[material],
		vertical_segments,
		horizontal_rings,
		vertical_rings,
		horizontal_segments,
	)
	return gizmo

#endregion

#region Utility Functions
## Gets the center of a triangle
func get_triangle_centroid(triangle: PackedVector3Array) -> Vector3:
	return (triangle[0] + triangle[1] + triangle[2]) / 3.0

## Calculates face normals of a triangle
func _calculate_face_normal(vertex_1: Vector3, vertex_2: Vector3, vertex_3: Vector3) -> Vector3:
	var edge1 = vertex_2 - vertex_1
	var edge2 = vertex_3 - vertex_1
	var normal = edge2.cross(edge1).normalized() # Cross product and normalize
	return normal

## Function to group an array into subarrays of a fixed size
func _group_array(array: Array, group_size: int) -> Array:
	var grouped_array = []
	var group = []
	
	for i in range(array.size()):
		group.append(array[i])
		
		# If the group has reached the desired size, push it to the grouped array
		if group.size() == group_size:
			grouped_array.append(group)
			group = []
			
	# If there are any leftover elements, add them as a smaller group
	if group.size() > 0:
		grouped_array.append(group)
	
	return grouped_array

## Turns values such as position, rotation, and scale into a transform
func create_transform_from_values(_position: Vector3 = Vector3.ZERO, _rotation := Vector3.ZERO, _scale := Vector3.ONE) -> Transform3D:
	var _transform = Transform3D()
	_transform = _transform.scaled(_scale)
	_transform = _transform.rotated(Vector3.RIGHT, deg_to_rad(_rotation.x))
	_transform = _transform.rotated(Vector3.UP, deg_to_rad(_rotation.y))
	_transform = _transform.rotated(Vector3.FORWARD, deg_to_rad(_rotation.z))
	_transform = _transform.translated(_position)
	return _transform

# Function to compute a point on the spheroid surface
func spheroid_point(theta: float, phi: float, radius: Vector3) -> Vector3:
	return Vector3(
		radius.x * sin(theta) * cos(phi),
		radius.y * cos(theta), # Scale Y-axis for height control
		radius.z * sin(theta) * sin(phi)
	)

func _get_scene_root():
	_get_scene_root() if Engine.is_editor_hint() else get_tree().root
#endregion

#endregion
