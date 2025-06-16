extends Sprite2D


func _on_area_2d_mouse_entered() -> void:
	material = load("res://Shaders/InteractableShaderMaterial.tres")


func _on_area_2d_mouse_exited() -> void:
	material = null
