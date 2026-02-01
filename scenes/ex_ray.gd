extends ColorRect

@onready var mutant: Sprite2D = $Sprite2D
@onready var exRayLight: PackedScene = preload("res://scenes/ex_ray_light.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = GameState.exray_enabled
	GameState.toggle_exray.connect(toggle_state)
	mutant.global_position = GameState.mutant_chair_anchor
	mutant.position.x = mutant.position.x + 600
	# var mutant = get_tree().get_first_node_in_group("mutant")

func toggle_state(state: bool):	
	if state:
		visible = true
		spawn_lights()
	else:
		visible = false
		get_tree().call_group("exraylights", "queue_free")


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT && event.pressed:
			if visible:
				GameState.toggle_exray.emit(false)
			else:
				GameState.toggle_exray.emit(true)
				

func spawn_lights():
	var brains: Array = get_tree().get_nodes_in_group("brains")
	for brain in brains:
		var pos = Vector2(brain.global_position)
		print_debug(brain)
		var tempLight = exRayLight.instantiate()
		mutant.add_child(tempLight)
		tempLight.global_position = pos
		tempLight.global_position.x += 600
		tempLight.add_to_group("exraylights")
		print_debug(pos)
		
		
