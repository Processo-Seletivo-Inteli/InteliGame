extends Area2D

#Declaração de variáveis
var ControlPc= false
onready var popup_E= $Popup_tecla_E
onready var inventory= get_node("../Inventario/Inventariopng/PenDrive")
onready var smokeanim= get_node("../Fumacasembg")
export var SceneToGo= ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Define a variavel de controle como true. E mostra o popup na tela
func _on_AreaPC_Visao_body_entered(_body):
	ControlPc= true
	if Global.Inventario_Itens[0] == true or Global.PCcont == 1:
		popup_E.visible= true
		popup_E.set_global_position(Vector2(1060, 380))
	

#Define a variavel de controle como false. E remove o popup na tela
func _on_AreaPC_Visao_body_exited(_body):
	ControlPc= false
	if Global.Inventario_Itens[0] == true or Global.PCcont == 1:
		popup_E.visible= false
	
	

func _physics_process(_delta):
	if Global.Inventario_Itens[0] == true and ControlPc == true and Input.is_action_just_pressed("ui_e"):
		Global.PCcont= 1
		inventory.visible= false 
		smokeanim.visible= false
	if Global.PCcont == 1 and Input.is_action_just_pressed("ui_e") and ControlPc == true:
		Transicao.FadeInto(SceneToGo)
		Global.contador = 7
		smokeanim.visible= false
	


