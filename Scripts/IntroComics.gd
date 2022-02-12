extends Node2D

export var next_scene : PackedScene
var generator


func _ready():
	# Turns on first sprite
	$ScreenWiper.set_process(false)
	generator = update_sprite_generator()

func _input(event):
	if event.is_action_pressed("ui_accept") and not $ScreenWiper.is_wiping:
		# Turn on next sprite
		generator = generator.resume()


func update_sprite_generator():
	for sprite in $Comics.get_children():
		print("Turning on a sprite")
		do_screen_wipe()
		sprite.visible = true
		yield()
	# After sprites are exhausted, actually change scene
	get_tree().change_scene_to(next_scene)


func do_screen_wipe():
	# Controls its own wipe end
	$ScreenWiper.start_wipe()
