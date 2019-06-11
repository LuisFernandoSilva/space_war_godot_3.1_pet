extends Area2D

#velocidade da nave
export var velocity = Vector2()

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	
	#quando sair da tela libera o node
	if get_position().y >= 900:
		queue_free()
	pass
