extends ColorRect

var c = 0
var colors = [
	Color8(134,46,156)			#Grape 9 to Grape 0
	,Color8(156,54,181)	
	,Color8(174,62,201)	
	,Color8(190,75,219)	
	,Color8(204,93,232)	
	,Color8(218,119,242)
	,Color8(229,153,247)
	,Color8(238,190,250)
	,Color8(243,217,250)
	,Color8(248,240,252)
	,Color8(243,217,250)
	,Color8(238,190,250)
	,Color8(229,153,247)
	,Color8(218,119,242)
	,Color8(204,93,232)
	,Color8(190,75,219)	
	,Color8(174,62,201)
	,Color8(156,54,181)
	,Color8(134,46,156)	   
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
