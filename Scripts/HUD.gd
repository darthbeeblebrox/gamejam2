extends Node2D


func _ready():
	ScoreSingleton.connect("sewage_changed", self, "update_sewer_score")
	ScoreSingleton.connect("food_changed", self, "update_food_score")
	ScoreSingleton.connect("friends_changed", self, "update_friend_score")


func update_sewer_score():
	$Sewage/SewerScoreCounter.text = str(ScoreSingleton.TOTAL_SEWAGE)
	$Sewage/SewerScoreCounter.show()


func update_food_score():
	$Food/FoodScoreCounter.text = str(ScoreSingleton.TOTAL_FOOD)
	$Food/FoodScoreCounter.show()


func update_friend_score():
	$Friends/FriendsScoreCounter.text = str(ScoreSingleton.TOTAL_FRIENDS)
	$Friends/FriendsScoreCounter.show()
