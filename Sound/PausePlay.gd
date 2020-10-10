extends Node2D


func _on_MusicOff_pressed():
	if $Track1.playing == true:
		$Track1.stop()


func _on_MusicON_pressed():
	if $Track1.playing == false:
		$Track1.play()
		




