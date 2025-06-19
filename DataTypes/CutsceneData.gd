extends Resource

class_name CutSceneData

@export_multiline var TextToSay = """"""
@export var BackgroundImage : Texture2D


@export var Owner : OwnerData

@export  var MusicType = JukeboxPlayer.MUSIC_TYPE.CONTINUE
@export var SFX : AudioStream

@export var Options : Array[OptionData]

@export var ScreenEffect : TransitionSceneManager.SCREEN_EFFECT
