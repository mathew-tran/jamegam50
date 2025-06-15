extends Node2D

func _ready() -> void:
	var scene = load("res://Scenes/Cutscene.tscn")
	var instance = scene.instantiate()
	add_child(instance)
