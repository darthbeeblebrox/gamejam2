extends Node2D

export var object = preload("res://Scenes/FoodResource.tscn")
onready var parent_path = get_node("..")


func spawn_resource():
	# TODO: not just one resource
	var new_food = object.instance()
	# At the spawner location
	new_food.position = parent_path.position
	ScoreSingleton.add_child(new_food)


func _on_LitteringTimer_timeout():
	spawn_resource()
