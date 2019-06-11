extends Label
#cria uma variavel score vazia e a aponta como um atalho para uma função
var score = 0 setget set_score
onready var score_label = get_node("points")

func _ready():
	
	pass

func set_score(value):
	#adiciona o valor passado para a variavel score
	score = value
	#seta na tela o label de score função str converte um numero em string
	score_label.set_text(str(score))
	print("score:"+str(score))
	
	if score > data.score:
		data.score = score
		
	if score > int(data.data_score):
		print(score)
		data.data_score = str(score)
	pass