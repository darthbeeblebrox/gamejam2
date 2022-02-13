extends Node2D

export var bubble_text = "Don't flush wipes or oils!!!!!"
export var auto_display = true
var bubble_text_length = 0
var bubble_text_index = 0
var current_text = ""
var do_close = false
var currently_playing = false

onready var lbl_text = $VBoxContainer/Label
onready var ninerect = $VBoxContainer/Label/NinePatchRect

onready var timer = $Timer


func _ready():
	reset_text_vars()
	self.visible = false
	if auto_display:
		timer.start(1)


func reset_text_vars():
	bubble_text_length = bubble_text.length()
	bubble_text_index = 0
	current_text = ""
	do_close = false
	

func _on_Timer_timeout():
	start_text_bubble()


func start_text_bubble(new_text=""):
	self.visible = true
	self.currently_playing = true
	if new_text.length() > 0:
		print("Bubble called with new text: ", new_text)
		bubble_text = new_text
		reset_text_vars()
		
		
	if not do_close:
		current_text += bubble_text[bubble_text_index]
		lbl_text.text = current_text
		if bubble_text_index < (bubble_text_length-1):
			timer.start(0.08)
			bubble_text_index += 1
		else:
			if not do_close:
				do_close = true
				timer.start(1)
	else:
		if bubble_text_length > 0:
			current_text.erase(bubble_text_length -1, 1)
			lbl_text.text = current_text
			bubble_text_length -= 1
			
			timer.start(0.06)
		else:
			timer.stop()
			do_close = false
			self.visible = false
			self.currently_playing = false
#			queue_free()
