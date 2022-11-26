extends Area2D

var DialogControl= false
var NewDialog= Dialogic.start('Dialogo_Pinky')
onready var popup_E= $Popup_tecla_E
var DialogPenDrive= Dialogic.start('Dialogo_Pinky_Pendrive')


# Called when the node enters the scene tree for the first time.
func _ready():
	#NewDialog.connect("timeline_end", self, 'pendriveap')
	if Global.DialogoPenDrive == true and Global.Inventario_Itens[0] == false and Global.contDialogoNave == true:
		print("Entrei na condição")
		add_child(DialogPenDrive)
		Global.controlPenDrive= true
		Global.contDialogoNave = false
	NewDialog.connect("timeline_end", self, 'playsnake')
	#DialogPenDrive.connect("Take_Pendrive", self, 'takependrive')
	

#func pendriveap(_argument):
	#Global.controlPenDrive= true
#func takependrive():
	#Global.controlPenDrive= true
	

#Define a variavel de controle como true. E mostra o popup na tela
func _on_NPC_Pinky_body_entered(_body):
	DialogControl= true
	popup_E.visible= true
	popup_E.set_global_position(Vector2(718, 430))
	

#define variavel de controle como false ao sair da area 2D. E Deleta o popup da tela
func _on_NPC_Pinky_body_exited(_body):
	DialogControl= false
	popup_E.visible= false
	
	
	
func _physics_process(_delta):
	if DialogControl == true and Input.is_action_just_pressed("ui_e"):
		add_child(NewDialog)
		#Global.Marcos_DialogSwitch= true
		Global.contador = 5

func playsnake(_argument):
	return get_tree().change_scene("res://nivel.tscn")
	print ("Entrando Node snake")
