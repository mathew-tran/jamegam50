extends Node2D

var TextLimit = 200
@export var Data : Array[CutSceneData]

signal CutsceneComplete

var RemainingText = []

func Setup(newData):
	Data = newData.duplicate()
	
func _ready() -> void:
	get_tree().paused = true
	PlayNextScene()

func PlayNextScene():
	RemainingText.clear()
	if len(Data) > 0:
		var newData = Data.pop_front() as CutSceneData
		$CanvasLayer/TextureRect.texture = newData.BackgroundImage
		var textToUse = newData.TextToSay
		print(textToUse)
		textToUse = textToUse.strip_edges()
		var textInSentences = Array(textToUse.split("\n"))
		var textLeft = []
		for textInSentence in textInSentences:
			textLeft.append_array(textInSentence.split(" "))
			textLeft.append("<br>")

		while len(textLeft) != 0:
			var textToAdd = ""
			while len(textToAdd) < TextLimit and len(textLeft) != 0:
				var constructedString = textLeft[0] + textToAdd
				if len(constructedString) > TextLimit:
					break
				var currentText = textLeft.pop_front()
				if currentText == "<br>":
					break
				else:
					textToAdd += currentText + " "
			textToAdd = textToAdd.strip_edges()
			if len(textToAdd) > 0:
				RemainingText.append(textToAdd)
		
		PlayNextText()
	else:
		Destroy()
		
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		PlayNextText()
		
func PlayNextText():
	if len(RemainingText) > 0:
		$CanvasLayer/Panel/RichTextLabel.text = RemainingText.pop_front()
	else:
		PlayNextScene()
		
func Destroy():
	get_tree().paused = false
	CutsceneComplete.emit()
	queue_free()

	
