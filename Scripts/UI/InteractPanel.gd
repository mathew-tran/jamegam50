extends Panel

class_name InteractPanel

var ObjectPressed
func ShowText(newText):
	$Label.text = newText.to_upper()
	visible = true

func SelectObject(object):
	ObjectPressed = object
	
func Hide():
	visible = false

func _process(delta: float) -> void:
	global_position = get_global_mouse_position()

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
		
