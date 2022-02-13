extends Area2D

export var food_resource = preload("res://Scenes/items/FoodResource.tscn")
export var trash_resource = preload("res://Scenes/items/TrashResource.tscn")

onready var parent_path = get_node("..")

export var sees_player_text = "A rat!"

export var currently_spawning = true
export var percent_food = 80
export var litter_time = 2.0
export var num_items_per_spawn = 5


func _ready():
	randomize()
	setup_timer()
	
	# Set up difficulties
	if ScoreSingleton.current_level == 2:
		percent_food = 50
		litter_time = 1.0
	elif ScoreSingleton.current_level == 3:
		percent_food = 20
		litter_time = 0.5
		num_items_per_spawn = 10


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
		var new_trash = trash_resource.instance()
		new_trash.randomize_animation()
		return new_trash


func setup_timer():
	$LitteringTimer.start(litter_time)


func spawn_resource():
	for i in range(num_items_per_spawn):
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
