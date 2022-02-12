extends Node2D


signal wipe_finished
signal wipe_is_halfway_done

onready var location = get_node("Path2D/ScreenWipeLocation")
export var wipe_speed = 250
var is_wiping = false
var wipe_is_halfway = false


func _ready():
	set_process(false)
	

func _process(delta):
	if location.unit_offset > 0.5:
		emit_signal("wipe_is_halfway_done")
	location.set_offset(location.get_offset() + wipe_speed * delta)
	if location.unit_offset > 0.99:
		end_wipe()


func start_wipe():
	set_process(true)
	is_wiping = true
	wipe_is_halfway = false


func end_wipe():
	set_process(false)
	is_wiping = false
	$Path2D/ScreenWipeLocation.offset = 0
	emit_signal("wipe_finished")


func _on_Node2D_wipe_is_halfway_done():
	wipe_is_halfway = true
