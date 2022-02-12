extends KinematicBody2D

class_name Player

# Basic motion
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var screen_size
export var speed = 200
export var GODMODE = true
export var can_recruit_friend = false


func _ready():
	screen_size = get_viewport_rect().size


func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("Trying to recruit friend")
		if can_recruit_friend:
			ScoreSingleton.recruit_friend_using_food(1)

		
#func _process(delta):


func _physics_process(delta):
	
	var current_direction = handle_direction_input()
	
	velocity = speed * current_direction #* delta
#	var body = move_and_collide(velocity)
	velocity = move_and_slide(velocity)
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, 0.8*screen_size.y)

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
