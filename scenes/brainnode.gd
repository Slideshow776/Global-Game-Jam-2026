extends Node2D
class_name brain_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("brains")
	print("adding to group")
	GameState.mutant_died.connect(func(): remove_from_group("brains"))
