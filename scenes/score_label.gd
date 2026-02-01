extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.update_score.connect(update_text)
	add_theme_font_size_override("normal_font_size", 20)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_text():
	var score = GameState.score
	text = "Score: [color=Yellow]%s[/color]" % score
