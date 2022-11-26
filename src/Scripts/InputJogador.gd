extends Node

class_name inputJogador

var jogador_pong
#pegar nodes
func _ready():
	jogador_pong = get_parent()
	jogador_pong.connect("atualizar",self,"input_movimento")
	
#movimento da raquete
func input_movimento():
	if not "direcao" in jogador_pong:
		return
		
	jogador_pong.direcao = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		jogador_pong.direcao.y -= 1
		
	if Input.is_action_pressed("ui_down"):
		jogador_pong.direcao.y += 1
		
		
