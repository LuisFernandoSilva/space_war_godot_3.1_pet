extends Sprite
#vai ser executado todas as vezes que for acionado
func _ready():
	#pega o node, da play na animação
	get_node("anim").play("fade_out")
	#conecta um sinal, que ao terminar a animação era chamar a função
	$anim.connect("animation_finished", self, "destroy")
	pass
#passa como parametro o anim e verifica se o fade out
func destroy(anim):
	if anim == "fade_out":
		queue_free()
