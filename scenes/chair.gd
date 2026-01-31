extends Node2D
class_name Chair

var originalxposition : float 
@onready var splat = $Splatter
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.mutant_died.connect(clean_chair)
	originalxposition = position.x
	position.x = -1000 
	var tween := create_tween()
	tween.tween_property(self, "position:x", originalxposition, 1.0)
	GameState.mutant_hit.connect(_on_mutant_hit_do_splat)
	
func _on_mutant_hit_do_splat ():
	splat.visible = true
	
	
