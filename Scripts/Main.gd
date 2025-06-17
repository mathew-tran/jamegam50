extends Node2D

@export var StartingCutScene : Array[CutSceneData]
func _ready() -> void:
	var scene = load("res://Scenes/Cutscene.tscn")
	var instance = scene.instantiate()
	instance.Setup(StartingCutScene)
	add_child(instance)
