extends Path2D

export var NPCSPEED = 25
onready var NPCLocation = get_node("NPCLocation")


func _ready():
	set_process(true)
	

func _process(delta):
	NPCLocation.set_offset(NPCLocation.get_offset() + NPCSPEED * delta)
