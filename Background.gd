extends ColorRect

var c = 0
var colors = [
	Color8(0,0,0)			#black
	,Color8(33,37,41)		#gray 9
	,Color8(52,58,64)		#gray 8
	,Color8(33,37,41)		#gray 9
]

func _ready():
	update_color()
	
func update_color():
	color = Color(0,0,0,1)
	$Tween.interpolate_property(self, "color", color, colors[c], $Timer.wait_time-0.01, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Timer_timeout():
	c += 1
	c %= colors.size()
	update_color()
