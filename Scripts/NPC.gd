extends Node2D

export var food_resource = preload("res://Scenes/FoodResource.tscn")
export var trash_resource = preload("res://Scenes/TrashResource.tscn")

onready var parent_path = get_node("..")


func _ready():
	randomize()


func get_random_resource():
	var i = randi() % 100
	if i < 20:
		return food_resource.instance()
	else:
		return trash_resource.instance()


func spawn_resource():
	# TODO: not just one resource
	var new_food = get_random_resource()
	# At the spawner location
	new_food.position = parent_path.position
	ScoreSingleton.add_child(new_food)


func _on_LitteringTimer_timeout():
	spawn_resource()
