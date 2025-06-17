extends Node2D

var TextLimit = 150
@export var Data : Array[CutSceneData]

signal CutsceneComplete

var RemainingText = []

func _enter_tree() -> void:
	$CanvasLayer/Panel.visible = false
	$CanvasLayer/OwnerImage.visible = false
	$CanvasLayer/Panel/RichTextLabel.text = ""
	
func Setup(newData):
	Data = newData.duplicate()
	
func _ready() -> void:
	get_tree().paused = true

	$CanvasLayer/AnimationPlayer.play("animate")
	$CanvasLayer/Panel.visible = true
	PlayNextScene()

func PlayNextScene():
	RemainingText.clear()
	if len(Data) > 0:
		var newData = Data.pop_front() as CutSceneData
		$CanvasLayer/TextureRect.texture = newData.BackgroundImage
		
		Jukebox.PlayMusic(newData.MusicType)
		
		Jukebox.PlaySFX(newData.SFX)
		
		for child in $CanvasLayer/Options.get_children():
			child.queue_free()
			
		await get_tree().process_frame

		$CanvasLayer/Options.visible = false
		if len(newData.Options) > 0:
			$CanvasLayer/TextureRect2.visible = false
			var optionClass = load("res://Prefabs/UI/OptionButton.tscn")
			for option in newData.Options:
				var instance = optionClass.instantiate()
				instance.Setup(option, self)
				$CanvasLayer/Options.add_child(instance)
				await get_tree().process_frame
			
		if newData.Owner:
			$CanvasLayer/OwnerImage.texture = newData.Owner.OwnerImage
			$CanvasLayer/OwnerImage/Label.text = newData.Owner.OwnerName
			$CanvasLayer/OwnerImage.visible = true
		else:
			$CanvasLayer/OwnerImage.visible = false
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
		$CanvasLayer/Options.visible = false
	else:
		if HasOptions() == false:
			PlayNextScene()
		else:
			$CanvasLayer/Options.visible = true
		
func HasOptions():
	return $CanvasLayer/Options.get_child_count() > 0
	
func Destroy():
	get_tree().paused = false
	CutsceneComplete.emit()
	queue_free()

	
