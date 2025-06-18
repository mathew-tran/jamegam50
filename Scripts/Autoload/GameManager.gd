extends Node

var Flags = {}

signal GameProcess

signal FlagSet(flagData)
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func SetFlag(flagData : StoryFlagData):
	Flags[str(flagData.StoryFlagID)] = true
	FlagSet.emit(flagData)

func _process(delta: float) -> void:
	GameProcess.emit()
