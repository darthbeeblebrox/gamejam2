extends Node

export var level_number = 1

export var game_over_scene = preload("res://Scenes/levels/GameOver.tscn")
export var win_scene = preload("res://Scenes/levels/LevelComplete.tscn")


func _ready():
	ScoreSingleton.connect("max_sewage_reached", self, "game_over")
	ScoreSingleton.connect("sewage_cleared", self, "level_complete")

func game_over():
	get_tree().change_scene_to(game_over_scene)


func level_complete():
	get_tree().change_scene_to(win_scene)
