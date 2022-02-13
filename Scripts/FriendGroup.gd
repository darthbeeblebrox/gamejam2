extends Node2D

export var friend_scene = preload("res://Scenes/npcs/PunchingRat.tscn")


func _ready():
	ScoreSingleton.connect("friends_changed", self, "add_new_friend")


func _on_PunchTimer_timeout():
	var num_friends = ScoreSingleton.TOTAL_FRIENDS
	ScoreSingleton.add_sewage(-num_friends)


func add_new_friend():
	var new_friend = friend_scene.instance()
	new_friend.randomize_animation()
	new_friend.randomize_offset()
	
	self.add_child(new_friend)
	
