extends RigidBody2D

class_name TrashClass

func add_trash_to_sewer():
	print("Item added to Sewer")
	ScoreSingleton.TOTAL_SEWAGE = ScoreSingleton.TOTAL_SEWAGE + 1
	ScoreSingleton.emit_signal("sewage_changed")
	queue_free()
	
