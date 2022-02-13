extends TrashClass

var is_food = false
const possible_animations = ["type1", "type2"]


func randomize_animation():
	var random_str = possible_animations[randi() % possible_animations.size()]
	$AnimatedSprite.animation = random_str

	
func _on_PickUpArea_body_entered(body):
	if body.name == "Player":
		pass
