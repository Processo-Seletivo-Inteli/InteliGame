extends Area2D

#declaração de variáveis
var LiberaPorta= false 
onready var popup_E= $Popup_tecla_E
export var SceneToGo= ""


#define variavel de controle como true ao entrar na area 2D. Também sobre o popup na tela
func _on_Area2D2_body_entered(_body):
	LiberaPorta= true
	popup_E.visible= true
	popup_E.set_global_position(Vector2(110, 390))


#define variavel de controle como false ao sair da area 2D. E Deleta o popup da tela
func _on_Area2D2_body_exited(_body):
	LiberaPorta= false
	popup_E.visible= false
	
	
#funcao process delta que está fazendo a verificação da variavel de controle e de qual botão do teclado foi pressionado, para então trocar para a cena da recepção
func _physics_process(_delta):
	if LiberaPorta == true and Input.is_action_just_pressed("ui_e"):
		Transicao.FadeInto(SceneToGo)


