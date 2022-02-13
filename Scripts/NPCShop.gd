extends Area2D

export var player_not_enough_food_text = "Need more food!"
export var player_enough_food_text = "Use food to recruit help!"


func _on_NPCShop_body_entered(body):
	if body.name == "Player":
		body.can_recruit_friend = true
		if ScoreSingleton.TOTAL_FOOD >= ScoreSingleton.FOOD_PER_FRIEND:
			$Speech.start_text_bubble(player_enough_food_text)
		else:
			$Speech.start_text_bubble(player_not_enough_food_text)


func _on_NPCShop_body_exited(body):
	if body.name == "Player":
		body.can_recruit_friend = false
