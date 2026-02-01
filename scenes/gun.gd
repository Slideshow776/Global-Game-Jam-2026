extends Node2D

# Called when the node enters the scene tree for the first time.
@onready var gun_pos = $gun/gunpoint
@onready var gun = $gun
@onready var timer = $Timer

@export var health = 500

func _ready() -> void:
	GameState.mutant_hit.connect(tank_hit)
	GameState.brain_hit.connect(brain_hit)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and timer.is_stopped():
			GameState.gun_clicked.emit()
			timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gun.global_position = get_global_mouse_position()

func tank_hit():
	await get_tree().create_timer(0.1).timeout
	GameState.change_health.emit(-100)

func brain_hit():
	GameState.change_health.emit(300)
