extends Sprite2D

class_name InteractableItem

@export var InteractText = "INTERACT"
@export var CutScenes : Array[CutSceneData]
@export var ToggleObject : NodePath

enum HOVER_STATE {
	HOVERED,
	UNHOVERED
}

enum TRIGGER_STATE {
	CAN_BE_TRIGGERED_MULTIPLE,
	CAN_BE_TRIGGERED_ONCE,
	CANNOT_BE_TRIGGERED
}

var State = HOVER_STATE.UNHOVERED
@export var TriggerState = TRIGGER_STATE.CAN_BE_TRIGGERED_MULTIPLE

@export var bHideItemWhileInteracting = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		if State == HOVER_STATE.HOVERED:
			Finder.GetInteractPanel().SelectObject(self)
			
func _on_area_2d_mouse_entered() -> void:
	if TriggerState == TRIGGER_STATE.CANNOT_BE_TRIGGERED:
		return
		
	material = load("res://Shaders/InteractableShaderMaterial.tres")
	State = HOVER_STATE.HOVERED
	Finder.GetInteractPanel().ShowText(InteractText)


func _on_area_2d_mouse_exited() -> void:
	material = null
	
	Finder.GetInteractPanel().Hide()
	State = HOVER_STATE.UNHOVERED

func DoInteraction():
	if bHideItemWhileInteracting:
		visible = false
	var cutScene = load("res://Scenes/Cutscene.tscn")
	var instance =  cutScene.instantiate()
	instance.Setup(CutScenes)
	add_child(instance)
	
	if TriggerState == TRIGGER_STATE.CAN_BE_TRIGGERED_ONCE:
		TriggerState = TRIGGER_STATE.CANNOT_BE_TRIGGERED
		_on_area_2d_mouse_exited()

	await instance.CutsceneComplete
	DoPostInteraction()
	
	if get_node_or_null(ToggleObject):
		get_node(ToggleObject).DoInteraction()
	if bHideItemWhileInteracting:
		visible = true
		
func DoPostInteraction():
	pass
	
