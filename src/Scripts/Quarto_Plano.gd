extends Node2D


onready var inventario= [get_node("Inventario/Inventariopng/PenDrive"), get_node("Inventario/Inventariopng/RAM"), get_node("Inventario/Inventariopng/Cd"), get_node("Inventario/Inventariopng/PlacaVideo")]
var PlacaVideo_visibility= false
onready var popup_E= $PlacaVideo_Cena/Popup_tecla_E
var contSfx = 0
var na= 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#if Global.NPCAzul_visible == false:
		#$NPC_Azul/Area2D.visible= true
	#elif Global.NPCAzul_visible == true:
		#$NPC_Azul/Area2D.visible= false
	print(Global.pegou_placa)
	if Global.Inventario_Itens[0] == true:
		$Inventario/Inventariopng/PenDrive.visible= true 
	elif Global.Inventario_Itens[0] == false:
		$Inventario/Inventariopng/PenDrive.visible= false 	
		
	if Global.Inventario_Itens[1] == true:
		$Inventario/Inventariopng/RAM.visible= true 
	elif Global.Inventario_Itens[1] == false:
		$Inventario/Inventariopng/RAM.visible= false 
		
	if Global.Inventario_Itens[2] == true:
		$Inventario/Inventariopng/PlacaVideo.visible= true 
	elif Global.Inventario_Itens[2] == false:
		$Inventario/Inventariopng/PlacaVideo.visible= false 


func _on_PlacaVideo_Cena_body_entered(_body):
	PlacaVideo_visibility= true
	if inventario[2].visible == true or $PlacaVideo_Cena.visible == true:
		popup_E.visible= true
		popup_E.set_global_position(Vector2(815, 500))
	if $PlacaVideo_Cena.visible == false:
		popup_E.visible= false


func _on_PlacaVideo_Cena_body_exited(_body):
	PlacaVideo_visibility= false
	popup_E.visible= false


func _physics_process(_delta):
	if Global.controlPlacaVideo == true and inventario[2].visible == false: 
		$PlacaVideo_Cena.visible= true
	
	if PlacaVideo_visibility == true and Input.is_action_just_pressed("ui_e") and $PlacaVideo_Cena.visible == true:
		$PlacaVideo_Cena.visible= false
		inventario[2].visible= true
		popup_E.visible= false
		Global.Inventario_Itens[2]= inventario[2].visible
		Global.pegou_placa = true
		Global.contador = 13
		
		
		if contSfx == 0: 
			$itempegadosfx.play()
		contSfx = contSfx+1
	
	
	if Global.Inventario_Itens[2] == true:
		Global.controlPlacaVideo= false
		
