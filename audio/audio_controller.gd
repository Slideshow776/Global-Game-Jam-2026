extends Node2D

@export var mute: bool = false
func testfunction():
	print("Test Function")
	$Shoot.play()

func _ready():
	GameState.gun_clicked.connect(testfunction)
	
	
	if not mute:
		$Atmos.play()
		await get_tree().create_timer(2.0).timeout
		#Enviroment change
		var AtmosPlayback: AudioStreamPlaybackInteractive = $Atmos.get_stream_playback()
		if AtmosPlayback.is_playing():
			AtmosPlayback.switch_to_clip(1)
			print("Switched to clip 1")
			
	
	
	
