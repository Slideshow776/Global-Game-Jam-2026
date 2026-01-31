extends Node2D
class_name Mutant

var originalyposition : float 
signal mutantHit
signal mutantDead

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	originalyposition = position.y
	position.y = -1000 
	
	pass
	
func _on_timer_timeout() -> void:
	
	var tween := create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "position:y", originalyposition, 0.7)
	
	
	pass # Replace with function body.

#func _on_area_2d_area_entered(area: Area2D) -> void:
	#print("area 2d entered")
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
	#	mutantHit.emit()
	#pass # Replace with function body.

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
		print("event click")
		#arja.mutant_hit.emit()
		
