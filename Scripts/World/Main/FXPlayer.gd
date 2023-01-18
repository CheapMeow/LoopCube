extends Node2D

class_name FXPlayer

export var fx_players_count := 10

# Bug: AudioStreamPlayer2D does not work when it is inside a Viewport
# So here use AudioStreamPlayer
func _ready():
	for i in range(fx_players_count):
		add_child(AudioStreamPlayer.new())

func _get_fx_player() -> AudioStreamPlayer:
	for element in get_children():
		var player := element as AudioStreamPlayer
		if not player.playing:
			return player
	return null

func enable(state: bool):
	for element in get_children():
		var player := element as AudioStreamPlayer
		if state:
			player.volume_db = 0
		else:
			player.volume_db = -100
		#player.stream_paused = not state
	
func play(stream: AudioStream):
	var player := _get_fx_player()
	if player:
		player.stream = stream
		player.playing = true
	else:
		print("All FX players busy, can't play stream", stream)
	
