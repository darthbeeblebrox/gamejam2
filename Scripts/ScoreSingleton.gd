extends Node

export var TOTAL_SEWAGE = 50
export var TOTAL_FOOD = 10
export var TOTAL_FRIENDS = 5
export var FOOD_PER_FRIEND = 5
export var MAX_SEWAGE = 100

var current_level = 1

signal sewage_changed
signal max_sewage_reached
signal sewage_cleared
signal food_changed
signal friends_changed


func set_level(i):
	current_level = i
	
	if i == 2:
		TOTAL_SEWAGE = 80
		TOTAL_FOOD = 5
		TOTAL_FRIENDS = 2
	if i == 3:
		TOTAL_SEWAGE = 50
		TOTAL_FOOD = 0


func add_food(num_to_add=1):
	TOTAL_FOOD = TOTAL_FOOD + num_to_add
	emit_signal("food_changed")


func add_sewage(num_to_add=1):
	TOTAL_SEWAGE = clamp(TOTAL_SEWAGE + num_to_add, 0, MAX_SEWAGE)
	emit_signal("sewage_changed")
	
	if TOTAL_SEWAGE > MAX_SEWAGE:
		emit_signal("max_sewage_reached")
	elif TOTAL_SEWAGE <= 0:
		emit_signal("sewage_cleared")


func add_friend(num_to_add=1):
	TOTAL_FRIENDS = TOTAL_FRIENDS + num_to_add
	emit_signal("friends_changed")


func has_enough_food():
	return TOTAL_FOOD >= FOOD_PER_FRIEND
	

func recruit_friend_using_food(num_to_add):
	if has_enough_food():
		add_friend(1)
		add_food(-5)


func fraction_max_sewage():
	return float(TOTAL_SEWAGE) / float(MAX_SEWAGE)
