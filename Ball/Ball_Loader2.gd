extends Node2D

onready var Ball = load("res://Ball/Ball.tscn")
onready var Ball2 = get_node("/root/Game/Ball")
onready var Cdown = get_node("/root/Game/Signifier/Level")
onready var HUD = get_node("/root/Game/HUD")
onready var timer = get_node("/root/Game/Signifier/Timer")
var countdown = 5
var c = 0

func _ready():
	start_ball()

func _physics_process(_delta):
	if Ball2.global_position.y > 778:
		queue_free()
		HUD.update_lives(-1)
		create_ball()		


func start_ball():
	for ch in get_children():
		ch.queue_free()
	c = countdown
	Cdown.show()
	Cdown.text = "Level 2"
	timer.start()

func create_ball():
	var ball = Ball.instance()
	ball.position = Vector2(512, 650)
	ball.name = "Ball"
	ball.apply_central_impulse(Vector2(250,-250))
	add_child(ball)


func _on_Timer_timeout():
	c -= 1
	if c > 0:
		Cdown.text = "Level 2"
	else:
		Cdown.text = ""
		Cdown.hide()
		create_ball()
		timer.stop()
