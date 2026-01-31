extends Control

@export var bar_size := Vector2(360, 26)
@export var bar_pos := Vector2(40, 40)

@export var green_start_px := 140.0
@export var green_width_px := 90.0

@export var needle_width := 22.0
@export var needle_height := 28.0

@export var speed := 520.0
@export var max_attempts := 5

var dir := 1
var active := true
var attempts := 0
var score := 0

var red_bg: ColorRect
var green_zone: ColorRect
var needle: Polygon2D

func _ready() -> void:
	if size == Vector2.ZERO:
		size = Vector2(480, 160)

	# Red bar
	red_bg = ColorRect.new()
	red_bg.color = Color(0.85, 0.05, 0.05)
	red_bg.position = bar_pos
	red_bg.size = bar_size
	add_child(red_bg)

	# Green zone
	green_zone = ColorRect.new()
	green_zone.color = Color(0.05, 0.85, 0.05)
	green_zone.position = bar_pos + Vector2(green_start_px, 0)
	green_zone.size = Vector2(green_width_px, bar_size.y)
	add_child(green_zone)

	# Needle
	needle = Polygon2D.new()
	needle.color = Color(1, 0.95, 0.2)
	needle.polygon = PackedVector2Array([
		Vector2(0, needle_height),
		Vector2(needle_width * 0.5, 0),
		Vector2(needle_width, needle_height),
	])
	add_child(needle)

	reset_needle()

func _process(delta: float) -> void:
	if not active:
		return

	needle.position.x += speed * dir * delta

	var left := bar_pos.x
	var right := bar_pos.x + bar_size.x - needle_width

	if needle.position.x <= left:
		needle.position.x = left
		dir = 1
	elif needle.position.x >= right:
		needle.position.x = right
		dir = -1

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and active:
		resolve_attempt()

func resolve_attempt() -> void:
	active = false
	attempts += 1

	if is_in_green():
		score += 1
		print("SUCCESS")
	else:
		score -= 1
		print("FAIL")

	print("Attempts:", attempts, "/", max_attempts, " Score:", score)

	if attempts >= max_attempts:
		print("GAME OVER — Final Score:", score)
		return

	reset_needle()
	active = true

func reset_needle() -> void:
	needle.position = Vector2(
		bar_pos.x,
		bar_pos.y + bar_size.y + 4
	)
	dir = 1

func is_in_green() -> bool:
	var needle_center_x := needle.global_position.x + needle_width * 0.5
	var g0 := green_zone.global_position.x
	var g1 := g0 + green_zone.size.x
	return needle_center_x >= g0 and needle_center_x <= g1
