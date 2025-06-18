extends CanvasLayer

class_name TransitionSceneManager

var bHasTransitioned = true

func TransitionToScene(newPackedScene : PackedScene):
	var sceneToTransitionTo = newPackedScene.duplicate()
	bHasTransitioned = false
	$AnimationPlayer.speed_scale = 1
	$AnimationPlayer.play("animateIn")
	$AudioStreamPlayer2D.pitch_scale = randf_range(1, 1.3)
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(sceneToTransitionTo)
	$AnimationPlayer.speed_scale = 2
	$AnimationPlayer.play_backwards("animateIn")
	bHasTransitioned = true
	print("====[Moved to scene: " + newPackedScene.resource_path + "]")
