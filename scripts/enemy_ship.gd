#faz a herança de tudo que tem no script enemy
extends "res://scripts/enemy.gd"

const scn_laser = preload("res://scenes/laser_enemy.tscn")

func _ready():
	
	set_process(true)
	#funcao do script q faz a escolha de direita ou esquerda
	velocity.x = utils.choose([velocity.x, -velocity.x])
	#apos fazer as direçoes cria um timer pra começar a disparar
	
	$shot_time.connect("timeout", self, "shoot")
	pass
	
	
func _process(delta):
	#para fazer o inimigo ir para um lado e pra outro
	if get_position().x <= 0 +16:
		#função abs pela o numero o arredonda
		velocity.x = abs(velocity.x)
	if get_position().x >= 800 - 16:
		velocity.x = -abs(velocity.x)
	
	pass

func shoot():
	#dispara os tiros continuos
	var laser = scn_laser.instance()
	laser.set_position(get_node("cannon").get_global_position())
	utils.main_node.call_deferred("add_child", laser)
	sounds.play("laser_enemy")
	$shot_time.start()

	pass
