extends Node2D

onready var bar_life = get_node("markers") setget lost_life
#variavel do percentual de vida que e deslocado sendo 1 igual a 100%
var percent = 1
#cria um sinal de perdeu
signal lose

func _ready():
	pass
#função de perda de vida passando um dano especifico
func lost_life(damage):
	#se o dano for maior que 0
	if percent > 0:
		#dano - 0.1 mult pelo dano
		percent -= 0.1*damage
		#seta a region rect do markers com os valore 
		#de rect(pos, width,height)
		bar_life.set_region_rect(Rect2(0,0, percent*188, 23))
		#faz o deslocamento da barra pra esquerda
		bar_life.set_position(Vector2(-(1-percent)*188/2, 0))
	else:
		#emite o sinal de lose para ser usado
		emit_signal("lose")
		
	pass
