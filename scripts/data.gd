extends Node

var data_score = 0 setget set_bestscore
var score = 0
#faz o caminho para a criaçao de um arquivo no diretorio padrao do sistema
const filepath = "user://data_score_pet.txt"

func _ready():
	load_bestscore()
	
	pass
#funçao que mostra o que tem no arquivo
func load_bestscore():
	#cria um novo arquivo
	var file = File.new()
	#verifica se já existe o arquivo 
	if file.file_exists(filepath) ==  false: return
	#abre um arquivo de leitura 
	file.open(filepath, File.READ)
	#pega o que tem no arquivo e coloca na variavel
	data_score = file.get_as_text()
	file.close()
	pass
#função que salva o score
func save_bestscore():
	var file = File.new()
	#abre um arquivo para alteração
	file.open(filepath, File.WRITE)
	#função que salva no arquivo o que tem na variavel de paramtro
	file.store_var(data_score)
	file.close()
	pass
#função que seta o score
func set_bestscore(value):
	data_score = value
	save_bestscore()
	pass

