extends Node2D

func _ready():
	randomize()
	#seta a rotação do sprite,no parametro funçao que 
	#Converte graus para radianos.
	#randomiza num determinado arranjo de numeros
	rotate(deg2rad(rand_range(0,360)))
	#ativa a aemiçao das particulas
	$smoke.set_emitting(true)
	$flare.set_emitting(true)
	#ativa a animação de fade out
	$anim.play("fade_out")
		
	#Connect the signal
	$explosion_time.connect("timeout", self, "destroy")
	
	pass
	
func destroy():
	queue_free()
