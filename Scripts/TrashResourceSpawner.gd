extends Area2D


func _on_TrashCan_body_entered(body):
	if "can_enter_sewer" in body and body.can_enter_sewer:
		body.remove_trash_no_sewer()

