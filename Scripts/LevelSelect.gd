extends Node2D

export var level1 = preload("res://Scenes/levels/IntroComic.tscn")
export var level2 = preload("res://Scenes/levels/IntroComic.tscn")
export var level3 = preload("res://Scenes/levels/IntroComic.tscn")


func load_level1():
	get_tree().change_scene_to(level1)


func load_level2():
	get_tree().change_scene_to(level2)
	
	
func load_level3():
	get_tree().change_scene_to(level3)
