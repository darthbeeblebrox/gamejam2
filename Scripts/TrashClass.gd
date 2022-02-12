extends RigidBody2D

class_name TrashClass

var can_enter_sewer = true

func add_trash_to_sewer():
	ScoreSingleton.add_sewage(1)
	queue_free()
	
