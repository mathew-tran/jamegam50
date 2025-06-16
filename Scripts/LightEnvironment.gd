extends CanvasModulate

var bEnabled = true

func _ready() -> void:
	UpdateLight()
	
func DoInteraction():
	bEnabled = !bEnabled
	UpdateLight()
	
func UpdateLight():
	if bEnabled:
		color = Color.WHITE
	else:
		color = "1a1555"
