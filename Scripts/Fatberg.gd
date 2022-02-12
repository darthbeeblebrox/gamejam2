extends Node2D

export var max_scale = 4.0

func _ready():
	ScoreSingleton.connect("sewage_changed", self, "change_scale")
	change_scale()


func change_scale():
	var gamma = 0.25
	var scale = gamma + max_scale*(1.0-gamma)*ScoreSingleton.fraction_max_sewage()
	scale = clamp(scale, 0.1, max_scale)

	$Sprite.scale.x = scale
	$Sprite.scale.y = scale
