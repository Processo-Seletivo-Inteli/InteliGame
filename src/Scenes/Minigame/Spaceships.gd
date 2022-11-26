extends Node2D
#declaracao de variaveis
var posicoes_spawn = null
var inimigo1 = preload("res://Scenes/Minigame/EnemySpaceship.tscn")
export var SceneToGo= ""
var is_paused
var laser =  preload("res://Scenes/Minigame/Laser.tscn")
onready var mundo = $"."
var vida_cond_= false


#definir posicoes de spawn
func _ready():
	if $Tutorial.visible == true:
		get_tree().paused= false
	#pause_mode = Node.PAUSE_MODE_INHERIT
	posicoes_spawn = $posicoesSpawn.get_children()
	
	#spawn do inimigo
func spawn_inimigo():
	var index = randi() % posicoes_spawn.size()
	var inimigo = inimigo1.instance()
	inimigo.global_position = posicoes_spawn[index].global_position
	add_child(inimigo)

#temporizador de spawn
func _on_timerSpawn_timeout():
	spawn_inimigo()
	
	#Hud do jogo e checagem de vida
func _process(_delta):
	$LabelVida.text = "vida: " + str(Global.vida_global)
	$LabelPontuacao.text = "pontuação:" + str(Global.pontuacao)
	if Global.pontuacao >= 120:
		$LabelPontuacao.text = "Você conseguiu!"
		Global.completouMinigame = true
		TimerNave()
		Transicao.FadeInto("res://Scenes/Levels/Inteli/Inteli.tscn")
	if Global.vida_global <= 0:
		Pause()
		
	if $Tutorial.visible == true:
		get_tree().paused= true
		
#timer de spawn
func TimerNave():
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()
	
#tutorial sumir e comecar jogo
func _on_Button_Play_pressed():
	$Tutorial.visible= false
	get_tree().paused= false
	
func Pause():
	Global.vida_global = 5
	Global.pontuacao = 0
	return get_tree().reload_current_scene()
	
	#get_tree().paused



func _on_Jogador_spawn_laser(local):
	var l = laser.instance()
	l.global_position = local
	add_child(l)
