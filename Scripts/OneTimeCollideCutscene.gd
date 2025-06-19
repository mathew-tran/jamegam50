extends Area2D

@export var Cutscenes : Array[CutSceneData]

@export_file("*.tscn") var SceneToChangeTo

func _on_body_entered(body: Node2D) -> void:
	var cutScene = load("res://Scenes/Cutscene.tscn")
	var instance = cutScene.instantiate()
	instance.Setup(Cutscenes)
	Finder.GetPlayer().add_child(instance)
	if SceneToChangeTo != null:
		await instance.CutsceneComplete
		TransitionScene.TransitionToScene(load(SceneToChangeTo))
	queue_free()
