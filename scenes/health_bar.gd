extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.change_health.connect(update_health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value = GameState.current_health

func update_health(health):
	value = GameState.current_health
