extends Node2D

export var friend_power = 1.0
export var friend_scene = preload("res://Scenes/PunchingRat.tscn")


func _ready():
	ScoreSingleton.connect("friends_changed", self, "add_new_friend")


func _on_PunchTimer_timeout():
	var num_friends = ScoreSingleton.TOTAL_FRIENDS
	ScoreSingleton.add_sewage(-num_friends * friend_power)


func add_new_friend():
	var new_friend = friend_scene.instance()
	var offset = randi() % 10
	new_friend.position.y = offset
	self.add_child(new_friend)
