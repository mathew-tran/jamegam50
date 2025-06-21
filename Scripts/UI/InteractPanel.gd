extends Panel

class_name InteractPanel

var ObjectPressed
func ShowText(newText):
	if TransitionScene.bHasTransitioned == false:
		return
	$Label.text = newText.to_upper()
	visible = true
	$AnimationPlayer.play("animateIn")

func SelectObject(object):
	ObjectPressed = object
	await get_tree().create_timer(.1).timeout
	Finder.GetPlayer().SetTargetPosition(object.global_position)
	$Click.play()
	
func Hide():
	$AnimationPlayer.play_backwards("animateIn")
	visible = false

func _process(delta: float) -> void:
	global_position = get_global_mouse_position() + Vector2(-100, -50)

func IsObjectPressed(object):
	if is_instance_valid(ObjectPressed) == false:
		return false
	return ObjectPressed == object
	
func InteractWithObject():
	if is_instance_valid(ObjectPressed):
		if Finder.GetPlayer().global_position.distance_to(ObjectPressed.global_position) < 400:
			print("Interact with object: [" + ObjectPressed.name + "]")
			ObjectPressed.DoInteraction()
			ObjectPressed = null
		
