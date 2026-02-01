extends Node
signal gun_clicked
signal mutant_hit
signal brain_hit
signal mutant_spawn
signal mutant_landed
signal mutant_died

signal brain_remove
signal mutant_sprite_updated

signal update_score

signal toggle_exray(state: bool)

var exray_enabled = false
var mutant_sprite
var score = 0
signal change_health(health)
signal end_game

var mutant_chair_anchor = Vector2(289, 501)

var current_health = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gun_clicked.connect(gun_play_sound)
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	brain_hit.connect(inc_score)
	toggle_exray.emit(false)
	change_health.connect(update_health)
	toggle_exray.connect(flip_exray)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func flip_exray():
	if exray_enabled:
		exray_enabled = false
	else:
		exray_enabled = true

func gun_play_sound():
	#print_debug("Pang :-")
	pass

func inc_score():
	score += 1
	update_score.emit()
	
	
func update_health(health):
	print(current_health)
	current_health += health
	if current_health <= 0:
		end_game.emit()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT && event.pressed:
			toggle_exray.emit()
