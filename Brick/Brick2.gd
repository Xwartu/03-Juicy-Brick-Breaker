extends KinematicBody2D

onready var needBool = true
onready var target_y = position.y

var row = 0
var col = 0

export var appear_speed = 3
export var fall_speed = 1.0

var dying = false

var colors = [
	Color8(201,42,42)		#Starts with Red 9
	,Color8(224,49,49)		
	,Color8(240,62,62)		
	,Color8(250,82,82)	
	,Color8(255,107,107)		
	,Color8(255,135,135)		
	,Color8(255,168,168)			#Ends with Red 3
]
onready var textures = load("res://Assets/Coin.png")

func _ready():
	randomize()
	update_color()

func _process(_delta):
	if  dying and not $Particles2D.emitting and not $Tween.is_active() and not $Color_Tween.is_active():
		queue_free()


func start_brick():
	if needBool:
		var target_pos = position
		var appear_duration = randf()*appear_speed + 1.0
		position.y = -100
		$Tween.interpolate_property(self, "position", position, target_pos, appear_duration, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		position = Vector2(position.x,target_y)





func update_color():
	if needBool:
		if row >= 0 and row < colors.size():
			$Color.color = colors[row]
	else:
		$Color.color = Color(1,1,1,1)

func emit_particle(pos):
	if needBool:
		$Particles2D.texture = textures
		$Particles2D.emitting = true
		$Particles2D.global_position = pos
	


func die():
	dying = true
	var target_color = $Color.color.darkened(0.75)
	target_color.a = 0
	var fall_duration = randf()*fall_speed + 1

	if needBool:
		var target_pos = position
		target_pos.y = 1000
		$Tween.interpolate_property(self, "position", position, target_pos, fall_duration, Tween.TRANS_CUBIC, Tween.EASE_IN)
		$Tween.start()
	if needBool:
		$Tween.interpolate_property($Color, "color", $Color.color, target_color, fall_duration-0.25, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()
	if needBool == false:
		$Color.color = target_color


	collision_layer = 0
	collision_mask = 0
