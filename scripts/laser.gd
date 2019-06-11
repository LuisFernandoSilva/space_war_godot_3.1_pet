extends Area2D

#velocidade do disparo
export var velocity = Vector2()
#constante da scena flare(clarão), 
#faz o preload do recurso enquanto esse script estiver ativo
const scn_flare = preload("res://scenes/flare.tscn") 
const scn_explosion = preload("res://scenes/explosion.tscn")


func _ready():
	# chamada de uma função nativa que ativa a função de processamento
	set_process(true)
	#função que cria um flare na scene
	create_flare()
	#aciona o notifier pra verificar o posicionamento,
	# e emitConjuntos Numéricos  Parte e o sinal de saida como retorno
	$notifier.connect("screen_exited", self, "destroy")
	pass

func _process(delta):
	#função que faz a transformação do calculo para os valores do vector2
	# a cada frame ele multiplica os valores 
	translate(velocity * delta)
	pass
#função que vai renderizar o laser na tela
func create_flare():
	#variavel que carrega o objeto flare
	var flare = scn_flare.instance()
	#a posiçao do clarao e a mesma do laser
	flare.set_position(get_position()) 
	#add como seu filho na scene laser o flare
	#chama a função do script utils que se extende por toda as scenes.
	#podendo ser chamado apenas pelo seu nome sem precisar ser instanciado 
	utils.main_node.add_child(flare) 
	pass

func create_explosion():
	
	var explosion = scn_explosion.instance()
	explosion.set_position(get_position())
	utils.main_node.add_child(explosion)
	sounds.play("explosion")
	pass

func _on_laser_hero_area_entered(other):
		#se o objeto for do grupo
	if other.is_in_group("enemys"):
		sounds.play("hit_enemy")
		other.queue_free()
		#função que procura um node pelo seu nome 
		#especifico na arvore de nodes
		utils.find_myNode("score").score+=5
		#cria um clarao quando o inimigo e destroido
		create_flare()
		create_explosion()
	pass 
	
func destroy():
	queue_free()