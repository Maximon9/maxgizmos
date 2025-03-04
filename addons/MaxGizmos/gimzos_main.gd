@tool
extends EditorPlugin

func _enter_tree():
    # Register the editor globals as a singleton
    # add_custom_type("GizmoSphere3D", "Gizmo", preload("./Classes/Gizmos/gizmo_sphere_3d.gd"), preload("../../icon.svg"))
    add_autoload_singleton("Gizmo3D", "./Classes/gizmo_3d.gd")
    print("Gizmo3D registered")

func _exit_tree():
    # Unregister the singleton when the plugin is disabled
    # remove_custom_type("GizmoSphere3D")
    remove_autoload_singleton("Gizmo3D")
    print("Gizmo3D unregistered")