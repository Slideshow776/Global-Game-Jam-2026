extends Node
signal gun_clicked
signal mutant_hit
signal brain_hit
signal mutant_spawn
signal mutant_died

signal brain_remove

signal change_health(health)
signal end_game

var mutant_chair_anchor = Vector2(289, 501)

var current_health = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gun_clicked.connect(gun_play_sound)
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	brain_hit.connect(hello_world)
	change_health.connect(update_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func gun_play_sound():
	#print_debug("Pang :-")
	pass

func hello_world():
	print_debug("Hello world")
	
func update_health(health):
	current_health += health
	if current_health <= 0:
		end_game.emit()
