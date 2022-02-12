extends Node2D


signal wipe_finished

onready var location = get_node("Path2D/ScreenWipeLocation")
export var wipe_speed = 500
var is_wiping = false


func _ready():
	set_process(false)
	

func _process(delta):
	location.set_offset(location.get_offset() + wipe_speed * delta)


func start_wipe():
	$WipeTimer.start()
	set_process(true)
	is_wiping = true


func end_wipe():
	set_process(false)
	is_wiping = false
	$Path2D/ScreenWipeLocation.offset = 0


func _on_WipeTimer_timeout():
	# Reset
	end_wipe()
	emit_signal("wipe_finished")
