extends CanvasLayer

func _ready() -> void:
	TransitionScene.TransitionToScene(load("res://Scenes/Main.tscn"))
