extends CharacterBody2D

class_name Player

var TargetPosition = Vector2.ZERO
var MoveSpeed = 3000

enum AREA {
	HOME,
	STREET,
	FACTORY,
	HALLUCINATION
}

@export var CurrentArea = AREA.HOME

func _ready() -> void:
	TargetPosition = global_position
	StopMoving()
	

func StopMoving():
	TargetPosition = GetPlayerPosition()
	
func UpdateAnim():
	var animName = GetAnimType()
	if TargetPosition != GetPlayerPosition():
		animName += "moveleft"
	else:
		animName += "idle"
	$AnimatedSprite2D.play(animName)
	
func GetAnimType():
	match CurrentArea:
		AREA.HOME:
			return ""
		AREA.STREET:
			return "street"
		AREA.FACTORY:
			return "factory"
		AREA.HALLUCINATION:
			return "hallucination"
	
func _process(delta: float) -> void:
	UpdateAnim()
	if Input.is_action_pressed("left_click") and TransitionScene.bHasTransitioned:
		TargetPosition = get_global_mouse_position()
		
	if TargetPosition != GetPlayerPosition():
		$Waypoint.global_position = TargetPosition
		$Waypoint.visible = true
	else:
		$Waypoint.visible = false
		
	if TargetPosition.distance_to(GetPlayerPosition()) > 5:
		velocity *= .90
		var direction = (TargetPosition - GetPlayerPosition()).normalized()
		velocity += direction * MoveSpeed * delta
		$AnimatedSprite2D.flip_h = TargetPosition.x > GetPlayerPosition().x
		
		if move_and_slide():
			TargetPosition = GetPlayerPosition()
			velocity = Vector2.ZERO
	else:
		TargetPosition = GetPlayerPosition()
		
		Finder.GetInteractPanel().InteractWithObject()
			

func GetPlayerPosition():
	return global_position + Vector2(0, 80)
