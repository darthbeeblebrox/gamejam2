extends Node2D

export var max_scale = 4.0

func _ready():
	ScoreSingleton.connect("sewage_changed", self, "change_scale")
	change_scale()


func change_scale():
	var gamma = 0.25
	var fraction = ScoreSingleton.fraction_max_sewage()
	var scale = gamma + max_scale*(1.0-gamma)*fraction
	scale = clamp(scale, 0.1, max_scale)

	$AnimatedSprite.scale.x = scale
	$AnimatedSprite.scale.y = scale
	
	if fraction < 0.33:
		$AnimatedSprite.frame = 0
	elif fraction < 0.67:
		$AnimatedSprite.frame = 1
	else:
		$AnimatedSprite.frame = 2
