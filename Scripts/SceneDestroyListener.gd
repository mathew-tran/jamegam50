extends Node2D

@export var ObjectsToListenTo : Array[InteractableItem]

var ObjectsLeft = 0

@export_file("*.tscn") var SceneToChangeTo

func _ready() -> void:
	ObjectsLeft = len(ObjectsToListenTo)
	for object in ObjectsToListenTo:
		object.Destroyed.connect(OnObjectDestroyed)

func OnObjectDestroyed():
	ObjectsLeft -= 1
	if ObjectsLeft <= 0:
		TransitionScene.TransitionToScene(load(SceneToChangeTo))
