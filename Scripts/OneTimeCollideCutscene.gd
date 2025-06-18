extends Area2D

@export var Cutscenes : Array[CutSceneData]

func _on_body_entered(body: Node2D) -> void:
	var cutScene = load("res://Scenes/Cutscene.tscn")
	var instance = cutScene.instantiate()
	instance.Setup(Cutscenes)
	GameManager.add_child(instance)
	queue_free()
