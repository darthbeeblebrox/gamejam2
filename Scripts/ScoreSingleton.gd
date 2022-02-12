extends Node

export var TOTAL_SEWAGE = 1
export var TOTAL_FOOD = 0
export var TOTAL_FRIENDS = 0
export var FOOD_PER_FRIEND = 5
export var MAX_SEWAGE = 10

signal sewage_changed
signal food_changed
signal friends_changed


func add_food(num_to_add=1):
	TOTAL_FOOD = TOTAL_FOOD + num_to_add
	emit_signal("food_changed")


func add_sewage(num_to_add=1):
	TOTAL_SEWAGE = TOTAL_SEWAGE + num_to_add
	emit_signal("sewage_changed")


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
