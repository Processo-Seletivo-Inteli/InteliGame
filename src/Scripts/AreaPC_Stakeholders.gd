extends Area2D

#Declaração de variáveis
var ControlPcStakeholders= false
onready var popup_E= $Popup_tecla_E
onready var inventory= get_node("../Inventario/Inventariopng/PenDrive")
onready var smokeanim= get_node("../Fumacasembg")
export var SceneToGo= ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_AreaPC_Stakeholders_body_entered(_body):
	ControlPcStakeholders= true
	if Global.Inventario_Itens[3] == true or Global.PCcontStakeholders == 1:
		popup_E.visible= true
		popup_E.set_global_position(Vector2(1040, 390))


func _on_AreaPC_Stakeholders_body_exited(_body):
	ControlPcStakeholders= false
	if Global.Inventario_Itens[3] == true or Global.PCcontStakeholders == 1:
		popup_E.visible= false


func _physics_process(_delta):
	if Global.Inventario_Itens[2] == true and ControlPcStakeholders == true and Input.is_action_just_pressed("ui_e"):
		Global.PCcontStakeholders= 1
		inventory.visible= false 
		smokeanim.visible= false
	if Global.PCcontStakeholders == 1 and Input.is_action_just_pressed("ui_e") and ControlPcStakeholders == true:
		Transicao.FadeInto(SceneToGo)
		Global.contador = 8
		
