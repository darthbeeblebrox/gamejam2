extends Node2D

export var next_scene : PackedScene
var generator
var last_sprite
var next_sprite


func _ready():
	# Turns on first sprite
	$ScreenWiper.set_process(false)
	generator = update_sprite_generator()


func _input(event):
	if event.is_action_pressed("ui_accept"):
		if $ScreenWiper.is_wiping:
			$ScreenWiper.end_wipe()
		# Turn on next sprite
		generator = generator.resume()


func update_sprite_generator():
	for sprite in $Comics.get_children():
		print("Turning on a sprite")
		do_screen_wipe()
		# Is actually turned visible when event is triggered
		last_sprite = next_sprite
		next_sprite = sprite
#		sprite.visible = true
		yield()
	# After sprites are exhausted, actually change scene
	get_tree().change_scene_to(next_scene)


func do_screen_wipe():
	# Controls its own wipe end
	$ScreenWiper.start_wipe()


func _on_ScreenWiper_wipe_is_halfway_done():
	swap_sprites()


func _on_ScreenWiper_wipe_finished():
	
	swap_sprites()
	

func swap_sprites():
	next_sprite.visible = true
	if last_sprite:
		last_sprite.visible = false
