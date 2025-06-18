extends Node2D

@export var FlagToListenTo : StoryFlagData
@export_file("*.tscn") var SceneToGoTo

func _ready() -> void:
	GameManager.FlagSet.connect(OnFlagSet)
	
func OnFlagSet(flagData):
	if flagData == FlagToListenTo:
		TransitionScene.TransitionToScene(load(SceneToGoTo))
