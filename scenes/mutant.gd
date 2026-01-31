extends Sprite2D


@onready var originalyposition : float = position.y
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# originalyposition = position.y
	position.y = -1000 
	timer.timeout.connect(_on_timer_timeout)
	
func _on_timer_timeout() -> void:
	var tween := create_tween()
	tween.tween_property(self, "position:y", originalyposition, 0.2)
