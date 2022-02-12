extends Area2D

export var object = preload("res://Scenes/FoodResource.tscn")

#
#func _ready():
#	connect("body_entered", self, "_on_player_body_enter")


func spawn_resource():
	# TODO: not just one resource
	var new_food = object.instance()
	# At the spawner location
	self.add_child(new_food)
#	new_food.linear_velocity = Vector2.ZERO
#	new_food.apply_impulse_towards_player()


func _on_TrashCan_body_entered(body):
	print("Hit trash can")
	if body.name == "Player":
		spawn_resource()
