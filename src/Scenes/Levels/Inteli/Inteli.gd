extends Node2D

#criação de variáveis
var DialogControl= false
var NewDialog= Dialogic.start('Dialogo_recepcionista')
onready var popup_E= $Area_Recepcionista/Popup_tecla_E


func _ready():
	pass

#Define a variavel de controle como true. E mostra o popup na tela
func _on_Area_Recepcionista_body_entered(_body):
	DialogControl= true
	popup_E.visible= true
	popup_E.set_global_position(Vector2(690, 425))
	
	
#define variavel de controle como false ao sair da area 2D. E Deleta o popup da tela
func _on_Area_Recepcionista_body_exited(_body):
	DialogControl= false
	popup_E.visible= false

#funçao que verifica se a variavel é verdadeira e botao foi pressionado para habilitar o dialogo
func _physics_process(_delta):
	if DialogControl == true and Input.is_action_just_pressed("ui_e"):
		add_child(NewDialog)
		Global.contador = 2
		
		
