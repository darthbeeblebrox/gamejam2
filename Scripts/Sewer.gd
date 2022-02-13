extends Area2D


const possible_animations = ["type1", "type2", "type3", "type4"]


func _ready():
	self.randomize_animation()


func randomize_animation():
	var random_str = possible_animations[randi() % possible_animations.size()]
	$AnimatedSprite.animation = random_str


func _on_Sewer_body_entered(body):
	if "can_enter_sewer" in body and body.can_enter_sewer:
		body.add_trash_to_sewer()
