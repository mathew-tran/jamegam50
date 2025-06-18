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
	CutSceneRef.GetNewCutSceneData(OptionInfo.CutScenes)
	
	
