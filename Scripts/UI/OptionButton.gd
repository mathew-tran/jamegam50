extends Button

var OptionInfo : OptionData
var CutSceneRef
func Setup(optionData : OptionData, cutSceneRef):
	OptionInfo = optionData
	$Label.text = optionData.OptionName
	CutSceneRef = cutSceneRef

func _on_button_up() -> void:
	if OptionInfo.StoryFlagSet:
		OptionInfo.StoryFlagSet.SetFlag()
	CutSceneRef.queue_free()
	var cutScene = load("res://Scenes/Cutscene.tscn")
	var instance = cutScene.instantiate()
	instance.Setup(OptionInfo.CutScenes)
	GameManager.add_child(instance)
	
