extends InteractableItem
class_name InteractableItemChangeScenes

@export var SceneToChangeTo : PackedScene

func DoPostInteraction():
	TransitionScene.TransitionToScene(SceneToChangeTo)
	queue_free()
