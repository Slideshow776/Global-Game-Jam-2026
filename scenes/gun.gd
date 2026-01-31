extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var gun_pos = $gun/gunpoint
@onready var gun = $gun
@onready var test_object = preload("res://scenes/test_object.tscn")

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			GameState.gun_clicked.emit()
			var obj = test_object.instantiate() as Node2D
			add_child(obj)
			obj.global_position = get_global_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gun.global_position = get_global_mouse_position()
