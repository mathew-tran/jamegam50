extends Resource

class_name StoryFlagData

@export var StoryFlagID = "001"

func SetFlag():
	GameManager.SetFlag(self)
