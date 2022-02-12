extends Area2D


func _on_NPCShop_body_entered(body):
	if body.name == "Player":
		body.can_recruit_friend = true


func _on_NPCShop_body_exited(body):
	if body.name == "Player":
		body.can_recruit_friend = false
