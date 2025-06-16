extends InteractableItem
class_name InteractableItemChangeSprite

@export var PostCutSceneTexture : Texture2D

func DoPostInteraction():
	texture = PostCutSceneTexture
