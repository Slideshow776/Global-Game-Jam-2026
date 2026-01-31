extends Node2D

@export var mute: bool = false
@export var base_volume: float = 1.0
@export var low_volume: float = 0.0
@export var duration: float = 0.5
@export var duration_out: float = 0.5
@export var volume_curve: Curve

var volume_time: float = 1.0
var is_falling: bool = false

#var ShootGun: Array = [$Shoot.play,$MutantHit.play]

func _mutantHitSounds():
	$MutantHit.play()
	$Shoot.play()
	
func _sidechain():
	is_falling = true
	

	
func _ready():
	#Shoot Gun
	if not mute:
		GameState.gun_clicked.connect($Shoot.play)
		GameState.gun_clicked.connect(_sidechain)
	#Mutant Hit
	if not mute:
		GameState.mutant_hit.connect(_mutantHitSounds)
	
	#Play atmos at start of the game
	if not mute:
		$Atmos.play()
		await get_tree().create_timer(2.0).timeout
		
		#Enviroment change
		var AtmosPlayback: AudioStreamPlaybackInteractive = $Atmos.get_stream_playback()
		if AtmosPlayback.is_playing():
			AtmosPlayback.switch_to_clip(1)
			print("Switched to clip 1")

func _process(delta: float) -> void:
	if is_falling:
		volume_time -= delta / duration
		if volume_time < 0:
			volume_time = 0
			is_falling = false
	else:
		volume_time += delta / duration_out
		if volume_time > 1:
			volume_time = 1
	AudioServer.set_bus_volume_linear(1, lerp(low_volume, base_volume, volume_curve.sample(1-volume_time)))

func easeInOutExpo(x: float) -> float:
	return (0 if x <= 0 
		else 1 if x >= 1
		else pow(2, 20 * x - 10) / 2 if x < 0.5
		else (2 - pow(2, -20 * x + 10)) / 2
	)
