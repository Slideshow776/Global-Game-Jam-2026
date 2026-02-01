extends Node
signal gun_clicked
signal mutant_hit
signal brain_hit
signal mutant_spawn
signal mutant_died

signal brain_remove

signal toggle_exray(state: bool)

var exray_enabled = false

var mutant_chair_anchor = Vector2(289, 501)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gun_clicked.connect(gun_play_sound)
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	brain_hit.connect(hello_world)
	toggle_exray.emit(false)

func flip_exray(state: bool):
	exray_enabled = state

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func gun_play_sound():
	#print_debug("Pang :-")
	pass

func hello_world():
	print_debug("Hello world")
