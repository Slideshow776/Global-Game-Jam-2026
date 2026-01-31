extends Node2D


@onready var mutant_array: Array[PackedScene] = [
	preload("res://testScenes/mockMutant.tscn")
]
@onready var mutantCell: Node2D = $mutantCell
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.mutant_spawn.connect(create_mutant)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_mutant():
	var mutant = mutant_array[0].instantiate()
	print_debug("hello world")
	mutantCell.add_child(mutant)
