extends Node2D

@export var FlagToListenTo : StoryFlagData
@export var SceneToGoTo : PackedScene
func _ready() -> void:
	GameManager.FlagSet.connect(OnFlagSet)
	
func OnFlagSet(flagData):
	if flagData == FlagToListenTo:
		TransitionScene.TransitionToScene(SceneToGoTo)
