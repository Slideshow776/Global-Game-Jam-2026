extends Node2D
class_name MockMutant

var originalyposition : float 
signal mutantHit
signal mutantDead
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = GameState.mutant_chair_anchor
	originalyposition = position.y
	position.y = -1000 
	print_debug("mutant says skjera tjommi")
	GameState.mutant_died.connect(on_death)	
	
	# REMOVE ME!!
	GameState.gun_clicked.connect(mock_function)
	
func _on_timer_timeout() -> void:
	
	var tween := create_tween()
	tween.tween_property(self, "position:y", originalyposition, 0.3)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
		print("event click")
		#arja.mutant_hit.emit()
		
func mock_function():
	GameState.mutant_died.emit()

func on_death():
	var tweenY := create_tween()
	var time = 0.3
	tweenY.set_trans(Tween.TRANS_BOUNCE)
	tweenY.tween_property(self, "position:y", position.y - 300, time*1.5)
	await tweenY.finished
	var tweenXY := create_tween()
	var tweenRot := create_tween()
	tweenRot.tween_property(self, "rotation_degrees", 360.0, time).as_relative()
	tweenXY.tween_property(self, "position", Vector2(position.x + 1000, position.y - 300), time)
	await tweenXY.finished
	GameState.mutant_spawn.emit()
	queue_free()
