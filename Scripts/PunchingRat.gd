extends Node2D

const possible_animations = ["type1", "type2", "type3", "type4"]


func randomize_animation():
	var random_str = possible_animations[randi() % possible_animations.size()]
	$AnimatedSprite.animation = random_str


func randomize_offset():
	var offset = randi() % 30 - 15
	position.y = offset
	
	offset = randi() % 30 - 15
	position.x = offset
