extends Node2D


func _ready():
	ScoreSingleton.connect("sewage_changed", self, "update_sewer_score")
	

func update_sewer_score():
#	$SewerScoreCounter.text = "YAY"
	print(str(ScoreSingleton.TOTAL_SEWAGE))
	$SewerScoreCounter.text = str(ScoreSingleton.TOTAL_SEWAGE)
	$SewerScoreCounter.show()


func _on_sewage_changed():
	update_sewer_score()
