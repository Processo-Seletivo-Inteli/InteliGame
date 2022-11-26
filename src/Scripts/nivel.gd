extends Node2D

	#declaração de variaveis
var playcontrol= false
onready var pontuacao = 0
onready var comida = preload("res://comida.tscn")
export var SceneToGo= "" 

#faz adicionar comida ao inicio da cena
func _ready():
	add_comida()
	get_tree().paused= true
	
	
	#definicao de nascimento da proxima comida
func add_comida():
	var instance = comida.instance()
	instance.position = Vector2(rand_range(0,1260),rand_range(0,647))
	instance.connect("comida_usada",self,"nasceu_nova")
	add_child(instance)
	
	#faz comida nova aparecer e adiciona pontuacao
func nasceu_nova():
	pontuacao += 1
	add_comida()
	get_node("cobra").add_cauda()
	

	#pontuacao
func _process(_delta):
	$Label.text = str(pontuacao)	
	if pontuacao == 10:
		Global.contDialogoNave= true
		Global.DialogoPenDrive= true
		Transicao.FadeInto(SceneToGo)
		$Label.text = "voce conseguiu!"
	if $cobra/cabeca.position.x < 0 or $cobra/cabeca.position.x > 1260:
		return get_tree().reload_current_scene()
	elif $cobra/cabeca.position.y < 0 or $cobra/cabeca.position.y > 660:
		return get_tree().reload_current_scene()
	if playcontrol == true:
		$Instrucao_Snake/Tutorial.visible = false
		
	
func _on_Button_Play_pressed():
	playcontrol= true
	get_tree().paused= false
	
