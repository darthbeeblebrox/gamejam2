extends Node2D


func _ready():
	ScoreSingleton.connect("sewage_changed", self, "change_scale")
	change_scale()


func change_scale():
	var gamma = 0.25
	var scale = gamma + 2.0*(1.0-gamma)*ScoreSingleton.fraction_max_sewage()
	scale = clamp(scale, 0.1, 2.0)

	$Sprite.scale.x = scale
	$Sprite.scale.y = scale
