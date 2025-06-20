extends AudioStreamPlayer

class_name JukeboxPlayer

enum MUSIC_TYPE {
	SAD,
	DREAM,
	CONTINUE,
	ENDING,
	NONE,
	FACTORY
}

func PlayMusic(musicType : MUSIC_TYPE):
	print("PLAY: " + str(MUSIC_TYPE.keys()[musicType]))
	match musicType:
		MUSIC_TYPE.SAD:
			stream = load("res://Audio/Music/Jamgam-50sadM.ogg")
		MUSIC_TYPE.DREAM:
			stream = load("res://Audio/Music/Jamgam-50dream.ogg")
		MUSIC_TYPE.ENDING:
			stream = load("res://Audio/Music/JamGame50ending.ogg")
		MUSIC_TYPE.FACTORY:
			stream = load("res://Audio/Music/Jamegame-50Work (1).ogg")
		MUSIC_TYPE.NONE:
			stream = null
			stop()
		MUSIC_TYPE.CONTINUE:
			return
	play()

func PlayClickSound():
	$ClickSFX.pitch_scale = randf_range(1, 1.1)
	$ClickSFX.play()
	
func PlaySFX(audiostream : AudioStream):
	if audiostream:
		$SFX.stream = audiostream
		$SFX.play()
	
