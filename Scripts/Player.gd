extends CharacterBody2D

class_name Player

var TargetPosition = Vector2.ZERO
var MoveSpeed = 500
var MovementDelta = Vector2.ZERO
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
		if $NavigationAgent2D.get_next_path_position().x > GetPlayerPosition().x:
			animName += "moveright"
		else:
			animName += "moveleft"
	else:
		animName += "idle"
		$AnimatedSprite2D.flip_h = false
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
	
func _physics_process(delta: float) -> void:
	UpdateAnim()
	MovementDelta = MoveSpeed * delta
	if Input.is_action_pressed("left_click") and TransitionScene.bHasTransitioned:
		TargetPosition = get_global_mouse_position()
		$NavigationAgent2D.set_target_position(TargetPosition)
		
	if TargetPosition != GetPlayerPosition():
		$Waypoint.global_position = TargetPosition
		$Waypoint.visible = true
		if IsCloseToTarget() == false:
			var direction = ($NavigationAgent2D.get_next_path_position() - GetPlayerPosition()).normalized()
			$AnimatedSprite2D.flip_h = $NavigationAgent2D.get_next_path_position().x > GetPlayerPosition().x
			var next_path_position: Vector2 = $NavigationAgent2D.get_next_path_position()
			var new_velocity: Vector2 = global_position.direction_to(next_path_position) * MovementDelta
			if $NavigationAgent2D.avoidance_enabled:
				$NavigationAgent2D.set_velocity(new_velocity)
			else:
				_on_navigation_agent_2d_velocity_computed(new_velocity)
		else:
			_on_navigation_agent_2d_navigation_finished()
	else:
		$Waypoint.visible = false
		
func IsCloseToTarget():
	return GetPlayerPosition().distance_to(TargetPosition) < 100

		
		
			

func GetPlayerPosition():
	return global_position + Vector2(0, 80)


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	global_position = global_position.move_toward(global_position + safe_velocity, MovementDelta)


func _on_navigation_agent_2d_path_changed() -> void:
	print(str($NavigationAgent2D.get_current_navigation_path()))


func _on_navigation_agent_2d_navigation_finished() -> void:
	print("finished")
	TargetPosition = GetPlayerPosition()		
	$NavigationAgent2D.set_velocity_forced(Vector2.ZERO)
	MovementDelta = 0
	Finder.GetInteractPanel().InteractWithObject()
