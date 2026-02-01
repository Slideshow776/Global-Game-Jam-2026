extends Node2D


@onready var tool_container = $".."
@onready var scanner = $"scanner"
# Called when the node enters the scene tree for the first time.

@export var range = 300
	
func _ready() -> void:
	### Listen for initial signal, then request brain
	GameState.signal_direction_tool.connect(request_brain)
	
	### Listen for brain position
	GameState.signal_brain_pos.connect(recieved_brain)
	pass # Replace with function body.
### When to draw the arrow
	###

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Request the brain position
func request_brain():
	GameState.request_brain_pos.emit()

# Update direction to the brain
func recieved_brain(pos):
	reveal_if_in_range((get_global_mouse_position() - pos).length())

func reveal_if_in_range(distance):
	var new_scale = Vector2(range / scanner.texture.get_size().x, range / scanner.texture.get_size().y)
	print_debug("scale: ", scanner.scale)
	scanner.scale = new_scale
	print_debug("scale: ", scanner.scale)
	if distance <= range:
		GameState.reveal_brain.emit()
	
