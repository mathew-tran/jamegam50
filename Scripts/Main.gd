extends Node2D

@export var StartingCutScene : Array[CutSceneData]
@export var Delay = .25
@export var PostTransitionScene : PackedScene
func _ready() -> void:
	if Delay > 0:
		await get_tree().create_timer(Delay).timeout
	var scene = load("res://Scenes/Cutscene.tscn")
	var instance = scene.instantiate()
	instance.Setup(StartingCutScene)
	add_child(instance)
	
	if is_instance_valid(PostTransitionScene):
		await instance.CutsceneComplete
		TransitionScene.TransitionToScene(PostTransitionScene)
