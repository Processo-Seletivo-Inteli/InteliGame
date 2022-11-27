extends Node2D

#declaração de variáveis
var LiberaPorta= false 
onready var popup_E= $Popup_tecla_E


#Define a variavel de controle como true. E mostra o popup na tela
func _on_Area2D_body_entered(_body):
	LiberaPorta= true
	popup_E.visible= true
	popup_E.set_position(Vector2(698, 428))
	

#define variavel de controle como false ao sair da area 2D. E Deleta o popup da tela
func _on_Area2D_body_exited(_body):
	LiberaPorta= false
	popup_E.visible= false
	
# funçao que controla se a varivel é verdadeira e o botao foi pressionado para mudar de cena
func _unhandled_key_input(event):
	if LiberaPorta == true and Input.is_action_just_pressed("ui_e"):
		Transicao.FadeInto("res://Scenes/Levels/Inteli/Inteli.tscn")
		
func _ready():
	if Global.completouMinigame:
		get_tree().paused = true
		$FlashcardFrente.visible = true
		$Botoes.visible = false
	else:	
		add_child(Dialogic.start('timeline-1669497730.json'))
	
