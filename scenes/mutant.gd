extends Sprite2D


var originalyposition : float 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	originalyposition = position.y
	position.y = -1000 
	
	pass
	
func _on_timer_timeout() -> void:
	
	var tween := create_tween()
	tween.tween_property(self, "position:y", originalyposition, 0.2)
	
	pass # Replace with function body.
