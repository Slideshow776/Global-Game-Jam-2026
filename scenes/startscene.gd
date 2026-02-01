extends Node2D

@onready var mutant_array: Array[PackedScene] = [
	preload("res://scenes/mutant.tscn")
]

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var mutantCell: Node2D = $mutantCell
@onready var mutant: PackedScene = preload("res://scenes/mutant.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	animation_player.play("addmask")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
		get_tree().change_scene_to_file("res://scenes/game.tscn")
