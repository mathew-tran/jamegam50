extends Button

func _on_button_up() -> void:
	TransitionScene.TransitionToScene(load("res://Scenes/Part1-Home.tscn"))
	
	
