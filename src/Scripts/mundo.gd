
extends Node2D

#declaracao de variaveis
export var SceneToGo= ""
var is_paused
var laser =  preload("res://projetil/laserjogador.tscn")
onready var mundo = $"."
var vida_cond_= false



#funcao de atirar
func _on_jogador_spawn_laser(local):
	var l = laser.instance()
	l.global_position = local
	add_child(l)
	
	#Hud do jogo e checagem de vida
func _process(_delta):
	$LabelVida.text = "vida: " + str(Global.vida_global)
	$LabelPontuacao.text = "pontuação:" + str(Global.pontuacao)
	if Global.pontuacao >= 120:
		$LabelPontuacao.text = "Você conseguiu!"
		Global.DialogoRAM= true
		print("Dialogo 2 True")
		TimerNave()
		Transicao.FadeInto(SceneToGo)
	if Global.vida_global <= 0:
		Pause()
		
	if $Tutorial.visible == true:
		get_tree().paused= true
		
		#get_tree().change_scene("res://Terceiro_Plano.tscn")
		
	#print(Global.vida_global)
#timer de spawn
func TimerNave():
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()
	
#aparecer tutorial
func _ready():
	Global.terminou_jogo_nave = true
	if $Tutorial.visible == true:
		get_tree().paused= false
	#pause_mode = Node.PAUSE_MODE_INHERIT
	
#tutorial sumir e comecar jogo
func _on_Button_Play_pressed():
	$Tutorial.visible= false
	get_tree().paused= false
	
func Pause():
	Global.vida_global = 5
	return get_tree().reload_current_scene()
	
	#get_tree().paused
