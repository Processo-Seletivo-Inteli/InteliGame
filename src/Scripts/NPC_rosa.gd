extends Node2D

#Código reservado para mecânica que será implementada no futuro

var AppearControl= true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Define a variavel de controle como true. 
func _on_Area2D2_body_entered(_body):
	AppearControl= true

#define variavel de controle como false.
func _on_Area2D2_body_exited(_body):
	AppearControl= false

func _process(_delta):
	if Input.is_action_just_pressed("ui_e") and AppearControl == true:
		$Area2D2.visible= false
		Global.NPCAzul_visible= false
		
