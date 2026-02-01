extends Area2D

# Called when the node enters the scene tree for the first time.
var mouse_is_over = false
func _ready() -> void:
	GameState.gun_clicked.connect(check_mutant_hit)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _mouse_enter() -> void:
	mouse_is_over = true

func _mouse_exit() -> void:
	mouse_is_over = false

func check_mutant_hit():
	if mouse_is_over:
		GameState.mutant_hit.emit()
		 
