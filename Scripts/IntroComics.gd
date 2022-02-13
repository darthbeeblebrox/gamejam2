extends Node2D

export var next_scene : PackedScene
var generator
var last_sprite
var next_sprite

export var text1 = "The sewers are filling up!"
export var text2 = "We are the only ones who can clean it!"
var current_text = 0


func _ready():
	for sprite in $Comics.get_children():
		sprite.visible = false
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
		
		yield()
	# After sprites are exhausted, actually change scene
	get_tree().change_scene_to(next_scene)


func do_screen_wipe():
	# Controls its own wipe end
	$ScreenWiper.start_wipe()


func _on_ScreenWiper_wipe_is_halfway_done():
	swap_sprites()
	current_text += 1
	print(current_text)
	if current_text == 1:
		$Speech.start_text_bubble(text1)
	elif current_text == 2:
		$Speech.start_text_bubble(text2)


func _on_ScreenWiper_wipe_finished():
	swap_sprites()


func swap_sprites():
	next_sprite.visible = true
	if last_sprite:
		last_sprite.visible = false
