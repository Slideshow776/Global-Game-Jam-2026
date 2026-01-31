extends Node2D


@onready var timer = $DeathTimer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(_on_death_timer_expired)

func _on_death_timer_expired():
	queue_free()
