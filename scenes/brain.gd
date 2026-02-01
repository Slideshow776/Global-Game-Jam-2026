extends Area2D

@onready var brain_sprite: Sprite2D = $BrainSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.brain_remove.connect(free)
	z_index = -1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
		z_index = 0
		GameState.brain_hit.emit()

func free():
	queue_free()
