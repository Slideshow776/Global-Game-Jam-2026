extends Node
signal gun_clicked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gun_clicked.connect(gun_play_sound)
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func helloWorld():
	print_debug("hello world")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func gun_play_sound():
	print_debug("Pang :-")
