extends Node2D
class_name Mutant

var originalyposition : float 
signal mutantHit
signal mutantDead

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	originalyposition = position.y
	position.y = -1000
	
	var mutantColor: Color = Color(randf_range(0.1, 1.0), randf_range(0.1, 1.0), randf_range(0.1, 1.0), 1)
	modulate = mutantColor
	
func _on_timer_timeout() -> void:
	var tween := create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "position:y", originalyposition, 0.7)

#func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
#	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
#		print("event click")
#		GameState.mutant_hit.emit()
		
