extends Control

onready var global = get_node("/root/Global")
var screen_shake = 50.0

func _ready():
	update_score(0)
	update_lives(0)

	

func _on_Score_high():
	get_tree().change_scene("res://Menu/Win.tscn")


func update_score(s):
	global.score += s
	$Score.text = "Score: " + str(global.score)
	if global.score >= 1120:
		_on_Score_high()
		
func update_lives(l):
	global.lives += l
	$Lives.text = "Lives: " + str(global.lives)
	if global.lives<= 0:
		get_tree().change_scene("res://Menu/End.tscn")
		
