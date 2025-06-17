extends Node

var Flags = {}

func SetFlag(flagData : StoryFlagData):
	Flags[str(flagData.StoryFlagID)] = true
