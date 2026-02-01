extends Node2D

# Called when the node enters the scene tree for the first time.
@onready var gun_pos = $gun/gunpoint
@onready var gun = $gun

#Cannot be shorten than 0.6
@onready var timer: Timer = %Timer

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
		if timer.is_stopped():
			timer.start()
			GameState.gun_clicked.emit()
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gun.global_position = get_global_mouse_position()
