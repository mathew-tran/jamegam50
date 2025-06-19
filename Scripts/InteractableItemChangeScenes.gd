extends InteractableItem
class_name InteractableItemChangeScenes

@export_file("*.tscn") var SceneToChangeTo

func DoPostInteraction():
	TransitionScene.TransitionToScene(load(SceneToChangeTo))
