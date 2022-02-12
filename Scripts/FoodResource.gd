extends TrashClass

var is_food = true

func add_food_to_player():
	ScoreSingleton.add_food(1)
	queue_free()
	
func _on_PickUpArea_body_entered(body):
	if body.name == "Player":
		add_food_to_player()
