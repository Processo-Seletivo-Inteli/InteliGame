extends Node

class_name inputIA
#declaracao de variaveis
export (NodePath) var caminho_bola
onready var bola = get_node(caminho_bola)
var raquete
#pegar nodes
func _ready():
	raquete = get_parent()
	raquete.connect("atualizar",self,"input_movimento")
	
#movimento da raquete
func input_movimento():
	if not "direcao" in raquete:
		return
		
	raquete.direcao = Vector2(0, pegar_direcao_bola())
	
#logica de IA
func pegar_direcao_bola():
	#if abs(raquete.position.y - bola.position.y) > 0:
	if raquete.position.y < bola.position.y:
		return 1
	elif raquete.position.y > bola.position.y:
		return -1
		
	else:
		return 0
