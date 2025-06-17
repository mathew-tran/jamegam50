extends InteractableItem
class_name InteractableItemChangeScenes

@export var SceneToChangeTo : PackedScene

func DoPostInteraction():
	get_tree().change_scene_to_packed(SceneToChangeTo)
