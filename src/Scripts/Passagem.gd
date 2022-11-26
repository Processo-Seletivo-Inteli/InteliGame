extends Area2D

var LiberaPorta= false

onready var popup_E= $Popup_tecla_E
onready var popup_elevador= $painel_elevador

export var SceneToGo= ""

#Define a variavel de controle como true. E mostra o popup na tela
func _on_Area2D_body_entered(_body):
	LiberaPorta= true
	popup_E.visible= true
	popup_E.set_global_position(Vector2(1070, 340))
	
#define variavel de controle como false ao sair da area 2D. E Deleta o popup da tela
func _on_Area2D_body_exited(_body):
	LiberaPorta= false
	popup_E.visible= false

#funçao que verifica se a variavel é verdadeira e o botao foi pressionado para liberar uma mecanica de mudança de cena
func _physics_process(_delta):
	if LiberaPorta == true and Input.is_action_just_pressed("ui_e"):
		#return get_tree().change_scene("res://painelpreto.tscn")
		#Transicao.FadeInto(SceneToGo)
		popup_elevador.visible= true
		popup_elevador.set_global_position(Vector2(70, 15))
		
	elif Global.portaElevador == false and Input.is_action_just_pressed("ui_e"):
		popup_elevador.visible= false
	
