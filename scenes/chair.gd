extends Sprite2D

var originalxposition : float 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	originalxposition = position.x
	position.x = -1000 
	var tween := create_tween()
	tween.tween_property(self, "position:x", originalxposition, 1.0)
	
	pass # Replace with function body.


	
