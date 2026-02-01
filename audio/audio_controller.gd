extends Node2D

@export var mute: bool = false
@export var base_volume: float = 1.0
@export var low_volume: float = 0.0
@export var duration: float = 0.5
@export var duration_out: float = 0.5
@export var volume_curve: Curve

#@export var polyphonic_audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


var volume_time: float = 1.0
var is_falling: bool = false

func _shootDebug():
	#audio_stream_player_2d.play_sound_effect_from_library("Shoot2")
	$Shoot.play()
	$ShootImpack.play()

func _playAtmosphere():
	$Atmos.play()
	
func _changeAtmosphere():
	var AtmosPlayback: AudioStreamPlaybackInteractive = $Atmos.get_stream_playback()
	AtmosPlayback.switch_to_clip(1)
	
func _ChangeAtmosphereToEnd():
	var AtmosPlayback: AudioStreamPlaybackInteractive = $Atmos.get_stream_playback()
	AtmosPlayback.switch_to_clip(3)

func _mutantHitSounds():
	$MutantHit.play()
	#$Shoot.play()
func _mutantSpawn():
	$MutantDrop.play()
	
func _sidechain():
	is_falling = true
	
func _ready():
	
	#Change atmosphere when game starts
	GameState.game_started.connect(_changeAtmosphere)
	
	GameState.end_game.connect(_ChangeAtmosphereToEnd)
	
	#Shoot Gun
	if not mute:
		GameState.gun_clicked.connect(_shootDebug)
		GameState.gun_clicked.connect(_sidechain)
	
	#Mutant Hit
	if not mute:
		GameState.mutant_hit.connect(_mutantHitSounds)
		GameState.brain_hit.connect($MutantDead.play)
	
	if not mute:
		GameState.mutant_landed.connect(_mutantSpawn)
	
	#Play atmos at start of the game
	if not mute:
		_playAtmosphere()
	
	
	
	if not mute:
		GameState.toggle_exray.connect($Xray.play)

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
