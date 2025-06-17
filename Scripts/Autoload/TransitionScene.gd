extends CanvasLayer

class_name TransitionSceneManager

func TransitionToScene(newPackedScene : PackedScene):
	$AnimationPlayer.speed_scale = 1
	$AnimationPlayer.play("animateIn")
	$AudioStreamPlayer2D.pitch_scale = randf_range(1, 1.3)
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(newPackedScene)
	$AnimationPlayer.speed_scale = 2
	$AnimationPlayer.play_backwards("animateIn")
