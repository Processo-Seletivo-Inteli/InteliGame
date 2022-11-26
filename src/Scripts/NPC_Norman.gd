extends Area2D

#Declaração de variáveis
var DialogControl= false
var NewDialog= Dialogic.start('Dialogo_Norman')
var DialogPlacaVideo= Dialogic.start('Dialogo_Norman_PlacaVideo')
onready var popup_E= $Popup_tecla_E


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.DialogoPlacaVideo == true and Global.Inventario_Itens[3] == false:
		print("Estou no Global RAM")
		add_child(DialogPlacaVideo)
		Global.controlPlacaVideo= true
		
	NewDialog.connect("timeline_end", self, 'pingas')


func _on_NPC_Norman_body_entered(_body):
	if Global.verificacaoFase2 == 1:
		DialogControl= true
		popup_E.visible= true
		popup_E.set_global_position(Vector2(715, 440))

func _on_NPC_Norman_body_exited(_body):
	DialogControl= false
	popup_E.visible= false

	
func _physics_process(_delta):
	if DialogControl == true and Input.is_action_just_pressed("ui_e"):
		add_child(NewDialog)
		Global.contador = 13

func pingas(_argument):
	return get_tree().change_scene("res://jogopingas.tscn")
