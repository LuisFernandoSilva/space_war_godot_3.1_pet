extends Node2D

func _ready():
	
	pass
	
func _on_home_button_pressed():
	get_node("anim").play("hide")
	#pega a animaçao e espera um sinal, 
	#so executa os comandos a baixo quando o sinal aparecer
	yield(get_node("anim"), "animation_finished")
	transition.fade_to("res://scenes/main.tscn")
	transition.clear_above()
	sounds.play("bg")
	sounds.stop("lost")
	pass 


func _on_restart_button_pressed():
	get_node("anim").play("hide")
	yield(get_node("anim"), "animation_finished")
	transition.fade_to("res://scenes/game.tscn")
	transition.clear_above()
	sounds.play("bg")
	sounds.stop("lost")
	pass 