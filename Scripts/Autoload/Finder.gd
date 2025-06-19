extends Node

func GetPlayer() -> Player:
	var result = get_tree().get_nodes_in_group("Player")
	if result:
		return result[0]
	return null
	
func GetInteractPanel() -> InteractPanel:
	return get_tree().get_nodes_in_group("InteractPanel")[0]
