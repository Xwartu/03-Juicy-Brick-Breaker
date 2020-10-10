extends AudioStreamPlayer

onready var Track = get_node("/root/Global/BackgroundMusic/Track 3")
onready var needBool = true


func _ready():
	play_music()

func play_music():
	if needBool and playing:
		pass
	elif needBool and not playing:
		playing = true
	else:
		playing = false

func _on_Track_1_finished():
	_on_Track_3_ready()
	

func _on_Track_3_finished():
	_on_Track_2_finished()
	
func _on_Track_2_ready():
	Track.playing = true


func _on_Track_2_finished():
	Track.playing = true


func _on_Track_3_ready():
	Track.playing = true
