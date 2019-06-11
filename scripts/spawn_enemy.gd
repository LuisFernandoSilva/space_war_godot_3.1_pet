extends Node

const scn_enemy = preload("res://scenes/enemy_ship.tscn")

func _ready():
	$spaw_time.connect("timeout", self, "spawn")
	pass

func spawn():
	#função que ativa a randomização
	randomize()
	var enemy = scn_enemy.instance()
	var pos = Vector2()
	#posição randomizada em parte predeterminada
	pos.x = rand_range(0+30, 800-30) 
	pos.y = 0-30
	enemy.set_position(pos)
	#adiciona os objetos em node pra renderizar na tela
	get_node("container").add_child(enemy)
	$spaw_time.start()
	pass