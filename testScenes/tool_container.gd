extends Node2D

# Called when the node enters the scene tree for the first time.
var gun_is_active
var direction_is_active
var direction_to_brain

func _ready() -> void:
	gun_is_active = true
	direction_is_active = true
	
	
	
	GameState.gun_clicked.connect(perform_tool_job)
	
	# Set a random value to avoid nullpointer
	direction_to_brain = Vector2(0, 0)

func perform_tool_job():
	if direction_is_active:
		GameState.signal_direction_tool.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
