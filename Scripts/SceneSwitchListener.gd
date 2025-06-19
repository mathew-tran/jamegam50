extends Node2D

@export var FlagToListenTo : StoryFlagData
@export_file("*.tscn") var SceneToGoTo

func _ready() -> void:
	GameManager.FlagSet.connect(OnFlagSet)
	
func OnFlagSet(flagData):
	if flagData == FlagToListenTo:
		await get_tree().create_timer(0.5).timeout
		TransitionScene.TransitionToScene(load(SceneToGoTo))
