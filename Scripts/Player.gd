extends CharacterBody2D

class_name Player

var TargetPosition = Vector2.ZERO
var MoveSpeed = 1800


func _ready() -> void:
	TargetPosition = global_position
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		TargetPosition = get_global_mouse_position()
		
func _process(delta: float) -> void:
	if TargetPosition != GetPlayerPosition():
		$Waypoint.global_position = TargetPosition
		$Waypoint.visible = true
	else:
		$Waypoint.visible = false
		
	if TargetPosition.distance_to(GetPlayerPosition()) > 5:
		velocity *= .90
		var direction = (TargetPosition - GetPlayerPosition()).normalized()
		velocity += direction * MoveSpeed * delta
		$AnimatedSprite2D.flip_h = TargetPosition.x < GetPlayerPosition().x
		
		if move_and_slide():
			TargetPosition = GetPlayerPosition()
			velocity = Vector2.ZERO
	else:
		TargetPosition = GetPlayerPosition()
		
		Finder.GetInteractPanel().InteractWithObject()
			

func GetPlayerPosition():
	return global_position + Vector2(0, 80)
