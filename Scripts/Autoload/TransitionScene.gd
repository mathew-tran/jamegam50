extends CanvasLayer

class_name TransitionSceneManager

var bHasTransitioned = true

enum SCREEN_EFFECT {
	NONE,
	BLACK_BLINK,

}

func PlayScreenEffect(screenEffect : SCREEN_EFFECT):
	match screenEffect:
		SCREEN_EFFECT.BLACK_BLINK:
			$AnimationPlayer.play("BlackBlink")
		SCREEN_EFFECT.NONE:
			return
	await $AnimationPlayer.animation_finished
	
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
