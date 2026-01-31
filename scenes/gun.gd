extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var gun_pos = $arm/Gunpoint
func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print_debug(event.position, gun_pos.global_position)
			GameState.gun_clicked.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
