extends InteractableItem
class_name InteractableItemChangeScenes

@export_file("*.tscn") var SceneToChangeTo
@export var bHideIfCantBeInteracted = false

func _ready() -> void:
	if bHideIfCantBeInteracted:
		if TriggerState == TRIGGER_STATE.CANNOT_BE_TRIGGERED:
			visible = false

func DoPostInteraction():
	TransitionScene.TransitionToScene(load(SceneToChangeTo))
