extends Node2D
class_name Chair

var originalxposition : float 
@onready var splat = $Splatter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	originalxposition = position.x
	position.x = -1000 
	var tween := create_tween()
	tween.tween_property(self, "position:x", originalxposition, 1.0)
	GameState.mutant_hit.connect(_on_mutant_hit_do_splat)
	GameState.brain_hit.connect(_clean_splatter)
	GameState.end_game.connect(_clean_splatter)
	
func _on_mutant_hit_do_splat ():
	spawn_splat(get_global_mouse_position())
	
	# Preload the scene to be spawned
var splatter_scene = preload("res://scenes/splatter.tscn")

func spawn_splat(location: Vector2):
	await get_tree().create_timer(0.2).timeout
	
	# 1. Instantiate the scene
	var new_sprite = splatter_scene.instantiate()
	new_sprite.add_to_group("splatter")
	
	# 2. Set the position
	new_sprite.position = location
	
	# 3. Add to the scene tree
	add_child(new_sprite)
	
func _clean_splatter(): 
	for node in get_tree().get_nodes_in_group("splatter"):
		var tween = create_tween()
		tween.tween_property(node, "modulate:a", 0.0, 0.9)
		
		
		#get_tree().call_group("splatter", "queue_free")
	
