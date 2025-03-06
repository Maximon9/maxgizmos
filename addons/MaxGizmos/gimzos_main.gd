@tool
extends EditorPlugin

func _enter_tree():
    # Register the editor globals as a singleton
    # add_custom_type("GizmoSphere3D", "Gizmo", preload("./Classes/Gizmos/gizmo_sphere_3d.gd"), preload("../../icon.svg"))
    enable_plugin()
    add_autoload_singleton("Gizmo3D", "./Classes/gizmo_3d.gd")
    print("Gizmo3D registered")


func _exit_tree():
    # Unregister the singleton when the plugin is disabled
    # remove_custom_type("GizmoSphere3D")
    enable_plugin()
    remove_autoload_singleton("Gizmo3D")
    print("Gizmo3D unregistered")

func is_plugin_enabled(plugin_name: String) -> bool:
    var plugins := ProjectSettings.get("editor_plugins/enabled")
    if plugins != null:
        for plugin in plugins:
            if "MaxGizmos" in plugin:
                return true
    return false

func _ready() -> void:
    print("ok")

func enable_plugin() -> void:
    var plugin_name = "MaxGizmos"
    if is_plugin_enabled(plugin_name) == false:
        if Engine.is_editor_hint():
            var plugins = ProjectSettings.get("editor_plugins/enabled")
            if plugins == null:
                plugins = []
            var dir_path = "res://addons/MaxGizmos/"
            if DirAccess.dir_exists_absolute(dir_path):
                var file_path = dir_path + "plugin.cfg"
                if FileAccess.file_exists(dir_path + "plugin.cfg"):
                    (plugins as Array).append(file_path)
                    ProjectSettings.set("editor_plugins/enabled", plugins)
                    ProjectSettings.save()