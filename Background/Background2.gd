extends ColorRect

var c = 0
var colors = [
	Color8(54,79,199)			#Indigo 9 to Grape 0
	,Color8(59,91,219)		
	,Color8(66,99,235)		
	,Color8(76,110,245)	
	,Color8(92,124,250)
	,Color8(116,143,252)
	,Color8(145,167,255)
	,Color8(186,200,255)
	,Color8(219,228,255)
	,Color8(237,242,255)
	,Color8(219,228,255)
	,Color8(186,200,255) 
	,Color8(145,167,255) 
	,Color8(116,143,252)
	,Color8(92,124,250)
	,Color8(76,110,245)
	,Color8(66,99,235)
	,Color8(59,91,219)
	,Color8(54,79,199)
]

func _ready():
	update_color()
	
func update_color():
	$Tween.interpolate_property(self, "color", color, colors[c], $Timer.wait_time-0.01, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Timer_timeout():
	c += 1
	c %= colors.size()
	update_color()
