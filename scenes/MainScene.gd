extends Node2D


@onready var mutant_array: Array[PackedScene] = [
	preload("res://scenes/mutant.tscn"),	preload("res://scenes/mutant2.tscn"),preload("res://scenes/mutant3.tscn"),preload("res://scenes/mutant4.tscn"),preload("res://scenes/mutant5.tscn")
]

@onready var mutantCell: Node2D = $mutantCell
@onready var mutant: PackedScene = preload("res://scenes/mutant.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.mutant_spawn.connect(create_mutant)
	var tempMutant = mutant.instantiate()
	mutantCell.add_child(tempMutant)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_mutant():
	var mutant = mutant_array.pick_random().instantiate()
	mutantCell.add_child(mutant)
