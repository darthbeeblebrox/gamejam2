extends Node


# Quit screen?

export var level_number = 1


func _ready():
	ScoreSingleton.connect("max_sewage_reached", self, "game_over")
	ScoreSingleton.connect("sewage_cleared", self, "level_complete")


func game_over():
	pass


func level_complete():
	pass
