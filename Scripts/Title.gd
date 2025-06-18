extends CanvasLayer

@export_file("*.tscn") var SceneToChangeTo

func _ready() -> void:
	TransitionScene.TransitionToScene(load(SceneToChangeTo))
