extends InteractableItemChangeSprite

class_name InteractableItemChangeSpriteToggle


@export var ToggledCutScene : Array[CutSceneData]
var OriginalCutScene : Array[CutSceneData]
var OriginalTexture : Texture2D

func _ready() -> void:
	OriginalCutScene = CutScenes
	OriginalTexture = texture
	
func DoPostInteraction():	
	if texture == PostCutSceneTexture:
		texture = OriginalTexture
	else:
		texture = PostCutSceneTexture
	
	if CutScenes == OriginalCutScene:
		CutScenes = ToggledCutScene
	else:
		CutScenes = OriginalCutScene
	
