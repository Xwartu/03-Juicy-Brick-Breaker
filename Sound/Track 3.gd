extends AudioStreamPlayer

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


	
