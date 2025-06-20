extends Panel

@export var FlagToListenTo : StoryFlagData
func _ready() -> void:
	GameManager.FlagSet.connect(OnFlagSet)
	
func OnFlagSet(flagData):
	if FlagToListenTo == flagData:
		visible = true
