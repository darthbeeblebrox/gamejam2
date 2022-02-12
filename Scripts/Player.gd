extends KinematicBody2D

class_name Player

# Basic motion
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
export var speed = 200


func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	
	var current_direction = handle_direction_input()
		
	# Apply
	velocity = speed * current_direction * delta
	move_and_collide(velocity)
#	move_and_slide(velocity)

	animate_walking()


func animate_walking():
	if velocity.length() > 0.05:
		if direction.x > 0.1:
			$AnimatedSprite.play("rightWalk")
		elif direction.x < -0.1:
			$AnimatedSprite.play("leftWalk")
		elif direction.y < 0.1:
			$AnimatedSprite.play("backWalk")
		elif direction.y > -0.1:
			$AnimatedSprite.play("frontWalk")
	else:
		$AnimatedSprite.play("frontDefault")


func handle_direction_input():
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	return direction
