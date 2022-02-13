extends Area2D

export var player_near_text = "Friends for Food!"

func _on_NPCShop_body_entered(body):
	if body.name == "Player":
		body.can_recruit_friend = true
		$Speech.start_text_bubble(player_near_text)


func _on_NPCShop_body_exited(body):
	if body.name == "Player":
		body.can_recruit_friend = false
