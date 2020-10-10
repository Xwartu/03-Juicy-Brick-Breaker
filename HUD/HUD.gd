extends Control

onready var global = get_node("/root/Global")
var screen_shake = 50.0
onready var audio = get_node("res://Game.tscn/BackgroundMusic")

func _ready():
	update_score(0)
	update_lives(0)

	

func _on_Score_high():
	get_tree().change_scene("res://Levels/Level2.tscn")


func update_score(s):
	global.score += s
	$Score.text = "Score: " + str(global.score)
	if global.score >= 480:
		_on_Score_high()
		
func update_lives(l):
	global.lives += l
	$Lives.text = "Lives: " + str(global.lives)
	if global.lives<= 0:
		get_tree().change_scene("res://Menu/Die.tscn")
		

func _on_MusicON_pressed():
	pass # Replace with function body.


func _on_MusicOff_pressed():
	pass # Replace with function body.

