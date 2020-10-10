extends RigidBody2D

export var max_speed = 400.0
export var min_speed = 100.0
onready var NeedBool = true
onready var camera = get_node("/root/Game/Camera")
onready var Lives = get_node("/root/Game/Ball/")
onready var HUD = get_node("/root/Game/HUD")

onready var effect_paddle = get_node("/root/Game/Sound_Effects/Paddle_Sound")
onready var effect_wall = get_node("/root/Game/Sound_Effects/Wall_Sound")
onready var effect_brick = get_node("/root/Game/Sound_Effects/Brick_Sound")

var wall_trauma = 0.005
var paddle_trauma = 0.008
var brick_trauma = 0.01

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	update_color()


func update_color():
	if NeedBool:
		$Color.color = Color8(34,184,207)
	else:
		$Color.color = Color(1,1,1,1)
	if NeedBool:
		$Particles2D.emitting = true
	else:
		$Particles2D.emitting = false




func screen_shake(amount):
	if HUD.screen_shake > 0:
		camera.add_trauma(amount*HUD.screen_shake)

func play_sound(sound):
	if NeedBool:
		sound.play()


func _physics_process(_delta):
	var c = $Color.duplicate()
	c.rect_global_position = global_position
	c.color = c.color.darkened(0.4)
	get_node("/root/Game/Trail").add_child(c)
	if global_position.y > 778:
		queue_free()
		HUD.update_lives(-1)
		Lives.create_ball()


	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.name == "Walls":
			#screen_shake(wall_trauma)
			play_sound(effect_wall)
		if body.name == "Paddle":
			#screen_shake(paddle_trauma)
			play_sound(effect_paddle)
		if body.is_in_group("Brick"):
			#screen_shake(brick_trauma)
			play_sound(effect_brick)
			
		if body.has_method("emit_particle"):
			body.emit_particle(global_position)
		if body.is_in_group("Brick"):
			body.die()
			HUD.update_score(10)

func _integrate_forces(state):
	if abs(state.linear_velocity.x) < min_speed:
		state.linear_velocity.x = sign(state.linear_velocity.x) * min_speed
	if abs(state.linear_velocity.y) < min_speed:
		state.linear_velocity.y = sign(state.linear_velocity.y) * min_speed
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed
		
	
