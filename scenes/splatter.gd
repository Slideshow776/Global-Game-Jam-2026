extends Node2D
class_name Splatter

func _ready() -> void:
	rotation_degrees = randf_range(0, 360)
	scale = Vector2.ONE * randf_range(0.8, 1.2)
	modulate.a = randf_range(0.75, 1.0)
