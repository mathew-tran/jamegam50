extends CanvasLayer

func _ready() -> void:
	$AnimationPlayer.play("animIn")
	
	Jukebox.PlayMusic(JukeboxPlayer.MUSIC_TYPE.ENDING)
