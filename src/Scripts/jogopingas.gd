extends Node

#declaracao de variaveis
export var SceneToGo= ""
var pontos_jogador_1 = 0
var pontos_jogador_2 = 0
var maximo_de_pontos = 5
#aparecer tutorial e variavel de controle
func _ready():
	$Tutorial.visible= true
	get_tree().paused= true
	Global.contador = 12
	Global.pingas_terminado = true

#adicionar pontos caso haja gol
func _on_Campo_gol_esquerda():
	pontos_jogador_2 += 1
	comeca_round_novo()
	
#adicionar pontos caso haja gol
func _on_Campo_gol_direita():
	pontos_jogador_1 += 1
	comeca_round_novo()

#HUD e checagem de pontos	
func _process(_delta):
	$Label.text = str(pontos_jogador_1)
	$Label2.text = str(pontos_jogador_2)
	
	if pontos_jogador_1 == 3:
		$Label3.text = "VITORIA"
		Global.DialogoPlacaVideo= true
		#Transicao.FadeInto(SceneToGo)
		get_tree().change_scene("res://Quarto_Plano.tscn")
	elif pontos_jogador_2 == 5:
		$Label3.text = "DERROTA"
		return get_tree().reload_current_scene()

#resetar posicoes e comeco de novo round
func comeca_round_novo():
	$Bola.reset()
	$Bola.set_direcao_inicial()
	$Raquete.resetar_raquete()
	$Raquete2.resetar_raquete2()
	
	
#acaba o jogo quando acaba o timer
func _on_Timer_timeout():
	acabou_jogo()
	
#nada fica visivel quando acaba o jogo
func acabou_jogo():
	$Raquete.visible = false
	$Bola.visible = false
	$Raquete2.visible = false
	$Label.visible = false
	$Label2.visible = false
	$Label3.visible = false

#tutorial sumir e comecar o jogo
func _on_Button_Play_pressed():
	$Tutorial.visible= false
	get_tree().paused= false
