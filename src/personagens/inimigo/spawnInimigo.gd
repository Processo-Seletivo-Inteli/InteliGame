extends Node2D

#declaracao de variaveis
var posicoes_spawn = null
var inimigo1 = preload("res://personagens/inimigo/inimigo.tscn")

#definir posicoes de spawn
func _ready():
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
