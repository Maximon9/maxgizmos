@tool
class_name GizmoMeshData

var root: Node
var immediate_mesh := ImmediateMesh.new()
var mesh_instance := MeshInstance3D.new()

func _init(_root: Node, _casts_shadows = false, _immediate_mesh := ImmediateMesh.new(), _mesh_instance := MeshInstance3D.new()):
    apply(_root, _casts_shadows, _immediate_mesh, _mesh_instance)

func apply(_root: Node = root, _casts_shadows = false, _immediate_mesh := ImmediateMesh.new(), _mesh_instance := MeshInstance3D.new()):
    if immediate_mesh:
        immediate_mesh.clear_surfaces()
    if mesh_instance:
        mesh_instance.free()
    
    root = _root
    immediate_mesh = _immediate_mesh
    mesh_instance = _mesh_instance
    
    immediate_mesh = _immediate_mesh
    mesh_instance = _mesh_instance
    mesh_instance.name = "GizmoMeshInstance"
    mesh_instance.mesh = immediate_mesh
    if _casts_shadows == true:
        mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
    else:
        mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
    root.add_child(mesh_instance)

## This draw the mesh
func draw():
    pass