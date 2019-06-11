extends Node2D

func _ready():
	
#	$hiScore/points.set_text(str(data.data_score))
	$hiScore/points.set_text(str(data.score))
	print(data.data_score)
	pass


func _on_play_button_pressed():
	transition.fade_to("res://scenes/game.tscn")
	
	pass 



