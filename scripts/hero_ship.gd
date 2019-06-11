extends Area2D

#velocidade da nave
var velocity = Vector2()

var screensize

#constante da scene do laser do hero, faz o preload do
# recurso enquanto esse script estiver ativo
const scn_lasers = preload("res://scenes/laser_hero.tscn")
const scn_explosion= preload("res://scenes/explosion.tscn")

func _ready():
	set_process(true)
	screensize = Vector2(800,600)
	
	#Conectar timer
	$shot_time.connect("timeout", self, "shot")
	pass
func _process(delta):
	velocity = Vector2()
	# pega a posiçao do mouse no x menos a posiçao atual mult
	# pelo valor frame
	var motion = (utils.mouse_pos.x - get_position().x) * 0.2
#	var up = (utils.mouse_pos.y - get_position().y) * 0.2
	translate(Vector2(motion, 0))
	
	var pos = get_position()
	pos += velocity*delta
	#prende dos valores em um intervalo
	pos.x   = clamp(pos.x,0, 800)
	set_position(pos)
	pass

func shot():
	var cannon = get_node("cannon/laser").get_global_position()
	create_laser(cannon)
	#cria os laser nessa quantidade de tempo
	$shot_time.start()
	pass

#tiros de varias posicoes
func create_laser(pos):
	var laser = scn_lasers.instance()
	laser.velocity.y = -500
	laser.set_position(pos)
	sounds.play("laser_ship")
	utils.main_node.add_child(laser)

	pass

func _on_hero_ship_area_entered( other ):
	if other.is_in_group("enemys") or other.is_in_group("enemy_laser"):
		utils.find_myNode("bar_life").bar_life = 1
		sounds.play("hit_ship")
		other.queue_free()
	
	pass 


func _on_bar_life_lose():
	sounds.stop("bg")
	sounds.play("lost")
	transition.put_above("res://scenes/game_over.tscn")
	pass




