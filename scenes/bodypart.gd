extends Area2D

var mouseEntered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.gun_clicked.connect(checkIfHit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func checkIfHit():
	print(mouseEntered)
	if mouseEntered:
		GameState.mutant_hit.emit()

func _on_mouse_entered() -> void:
	mouseEntered = true
	
func _on_mouse_exited() -> void:
	mouseEntered = false
