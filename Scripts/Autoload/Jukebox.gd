extends AudioStreamPlayer

class_name JukeboxPlayer

enum MUSIC_TYPE {
	SAD,
	DREAM,
	CONTINUE,
	NONE
}

func PlayMusic(musicType : MUSIC_TYPE):
	print("PLAY: " + str(MUSIC_TYPE.keys()[musicType]))
	match musicType:
		MUSIC_TYPE.SAD:
			stream = load("res://Audio/Music/Jamgam-50sadM.ogg")
		MUSIC_TYPE.DREAM:
			stream = load("res://Audio/Music/Jamgam-50dream.ogg")
		MUSIC_TYPE.NONE:
			stream = null
			stop()
		MUSIC_TYPE.CONTINUE:
			return
	play()

func PlaySFX(audiostream : AudioStream):
	if audiostream:
		$SFX.stream = audiostream
		$SFX.play()
	
