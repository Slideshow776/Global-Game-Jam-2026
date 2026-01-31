extends Area2D

@onready var brain_sprite: Sprite2D = $BrainSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			print(name)
			brain_sprite.visible = true
			GameState.brain_hit.emit()
