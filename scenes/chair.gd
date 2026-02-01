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
	
func _on_mutant_hit_do_splat ():
	spawn_splat(get_global_mouse_position())
	
	# Preload the scene to be spawned
var splatter_scene = preload("res://scenes/splatter.tscn")

func spawn_splat(location: Vector2):
	
	print("splat spawn")
	# 1. Instantiate the scene
	var new_sprite = splatter_scene.instantiate()
	
	# 2. Set the position
	new_sprite.position = location
	
	# 3. Add to the scene tree
	add_child(new_sprite)
	
