extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.mutant_sprite = texture.resource_path
	GameState.toggle_exray.connect(update_the_sprite)
	update_the_sprite()

func update_the_sprite():
	GameState.mutant_sprite = texture.resource_path
	GameState.mutant_sprite_updated.emit()
