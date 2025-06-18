extends Node2D

@export var StartingCutScene : Array[CutSceneData]
@export var Delay = .25
@export_file("*.tscn") var PostTransitionScene
func _ready() -> void:
	if Delay > 0:
		await get_tree().create_timer(Delay).timeout
	var scene = load("res://Scenes/Cutscene.tscn")
	var instance = scene.instantiate()
	instance.Setup(StartingCutScene)
	add_child(instance)
	
	if PostTransitionScene != null:
		await instance.CutsceneComplete
		TransitionScene.TransitionToScene(load(PostTransitionScene))
