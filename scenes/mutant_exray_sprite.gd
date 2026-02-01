extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.mutant_sprite_updated.connect(set_new_texture)
	
func set_new_texture():
	var mutant = get_tree().get_first_node_in_group("mutant")
	var spritepath = mutant.get_node("Area2D/BackBufferCopy/Sprite2D")
	self.texture = spritepath.texture
