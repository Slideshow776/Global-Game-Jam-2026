extends Node2D

@onready var mutant_array: Array[PackedScene] = [
	preload("res://scenes/mutant.tscn")
]

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var mutantCell: Node2D = $mutantCell
@onready var mutant: PackedScene = preload("res://scenes/mutant.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.mutant_spawn.connect(create_mutant)
	var tempMutant = mutant.instantiate()
	mutantCell.add_child(tempMutant)
	await get_tree().create_timer(2).timeout
	animation_player.play("removemask")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_mutant():
	var mutant = mutant_array[0].instantiate()
	mutantCell.add_child(mutant)
