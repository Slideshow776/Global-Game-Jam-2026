extends Node2D
class_name mutant

var originalyposition : float 
signal mutantHit
signal mutantDead

@onready var back_buffer_copy: BackBufferCopy = %BackBufferCopy
@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var timer: Timer = $Timer

@onready var hole: PackedScene = preload("res://scenes/hole_mask.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mutantColor: Color = Color(randf_range(0.1, 1.0), randf_range(0.1, 1.0), randf_range(0.1, 1.0), 1)
	sprite_2d.modulate = mutantColor
	add_to_group("mutant")
	position = GameState.mutant_chair_anchor
	originalyposition = position.y
	position.y = -1000 
	print_debug("mutant says skjera tjommi")
	timer.timeout.connect(_on_timer_timeout)
	
	# REMOVE ME!!
	GameState.gun_clicked.connect(mock_function)
	GameState.brain_hit.connect(on_death)
	GameState.end_game.connect(on_death)
	
	
func _on_timer_timeout() -> void:
	var tween := create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "position:y", originalyposition, 0.7)
	await tween.finished
	spawn_brain()
	GameState.mutant_sprite_updated.emit()

#func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
#	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
#		print("event click")
#		GameState.mutant_hit.emit()
		
func mock_function():
	var temp: Sprite2D = hole.instantiate()
	back_buffer_copy.add_child(temp)
	temp.rotation_degrees = randf_range(0, 360)
	temp.scale = Vector2.ONE * randf_range(0.1, 0.15)
	temp.global_position = get_global_mouse_position()
	
	
func on_death():
	var tweenY := create_tween()
	var time = 0.3
	tweenY.set_trans(Tween.TRANS_BOUNCE)
	tweenY.set_ease(Tween.EASE_OUT)
	tweenY.tween_property(self, "position:y", position.y - 300, time*1.5)
	await tweenY.finished
	var tweenXY := create_tween().set_ease(Tween.EASE_OUT)
	var tweenRot := create_tween()
	tweenRot.tween_property(self, "rotation_degrees", 360.0, time).as_relative()
	tweenXY.tween_property(self, "position", Vector2(position.x + 1000, position.y - 300), time)
	await tweenXY.finished

	GameState.mutant_spawn.emit()
	GameState.brain_remove.emit()
	queue_free()
	

var brain_scene = preload("res://scenes/brain.tscn")
	
func spawn_brain():
	var brain_spots = get_tree().get_nodes_in_group("brains")
	var rng = RandomNumberGenerator.new()
	
	var randomNumber = rng.randi_range(0, brain_spots.size() - 1)
	var new_brain = brain_scene.instantiate()
	
	# 3. Add to the scene tree
	var spot = brain_spots.pick_random()
	spot.add_child(new_brain)
	
	
	
