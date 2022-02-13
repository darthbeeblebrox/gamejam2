extends Area2D

export var food_resource = preload("res://Scenes/items/FoodResource.tscn")
export var trash_resource = preload("res://Scenes/items/TrashResource.tscn")

onready var parent_path = get_node("..")

export var sees_player_text = "A rat!"

export var currently_spawning = true
export var percent_food = 20
export var litter_time = 0.2


func _ready():
	randomize()
	setup_timer()


func disable_spawning():
	currently_spawning = false
	$LitteringTimer.stop()


func enable_spawning():
	currently_spawning = true
	setup_timer()


func get_random_resource():
	var i = randi() % 100
	if i < percent_food:
		return food_resource.instance()
	else:
		return trash_resource.instance()


func setup_timer():
	$LitteringTimer.start(litter_time)


func spawn_resource():
	# TODO: not just one resource
	var new_food = get_random_resource()
	# At the spawner location
	new_food.position = parent_path.position
	ScoreSingleton.add_child(new_food)


func _on_LitteringTimer_timeout():
	spawn_resource()


func _on_NPC_body_entered(body):
	if body.name == "Player":
		$Speech.start_text_bubble(sees_player_text)
	elif body.name == "Background":
		disable_spawning()


func _on_NPC_body_exited(body):
	if body.name == "Background":
		enable_spawning()
