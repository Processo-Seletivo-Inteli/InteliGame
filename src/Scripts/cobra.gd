extends Node2D
#variaveis
var direcao = Vector2(0,1)
var gap = -4
var direcao_prox_cauda = Vector2(1,0)
var direcao_anterior = Vector2(1,0)

onready var cauda = preload("res://cauda.tscn")

#movimento da cobra
func _process(_delta):
	if Input.is_action_just_pressed("ui_up"):
		direcao = Vector2(0,-13)
	if Input.is_action_just_pressed("ui_down"):
		direcao = Vector2(0,13)
	if Input.is_action_just_pressed("ui_left"):
		direcao = Vector2(-13,0)
	if Input.is_action_just_pressed("ui_right"):
		direcao = Vector2(13,0)	

	move_snake()
	#movimento da cobra
func move_snake():
	var posicao_cabeca = get_node("cabeca").position
	get_node("cabeca").position += direcao/2
	
	var mudanca_direcao = false
	if direcao_anterior != direcao:
		direcao_anterior = direcao
		mudanca_direcao = true
	if mudanca_direcao == true:
		for i in range(1,get_child_count()):
			get_child(i).add_na_cauda(posicao_cabeca,direcao)

	#adicionar cauda nova e fazer ela pegar a direcao da cabeca/cauda anterior
func add_cauda():
	var instance = cauda.instance()
	var cauda_anterior = get_child(get_child_count()-1 )
	if cauda_anterior.name != "cabeca":
		instance.direcao_atual = cauda_anterior.direcao_atual
		for i in range(0, cauda_anterior.pos_array.size()):
			instance.pos_array.append(cauda_anterior.pos_array[i])
			instance.direcoes.append(cauda_anterior.direcoes[i])
		instance.position = cauda_anterior.position + cauda_anterior.direcao_atual * gap	
	else:
		instance.direcao_atual = direcao
		instance.position = cauda_anterior.position + direcao * gap
	add_child(instance)

	print("add cauda")  
			

		


		
	
