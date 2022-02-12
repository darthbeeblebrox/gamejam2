extends Area2D


func _ready():
	pass # Replace with function body.


func _on_Sewer_body_entered(body):
	print("Item touched Sewer")
	if "can_enter_sewer" in body and body.can_enter_sewer:
		body.add_trash_to_sewer()
