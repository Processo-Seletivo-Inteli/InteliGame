extends Area2D

#declaracao variaveis
class_name Spaceship
signal spawn_laser(local)
onready var saida_laser = $SaidaLaser
var velocidade = 500
var input_vector = Vector2.ZERO

#movimentacao da nave
func _process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	global_position += input_vector * velocidade * delta
	
	
	if Input.is_action_just_pressed("atirar"):
		tiro_laser()
		
	if Global.vida_global == 0:
		queue_free()
	
	#funcao levar dano
func levar_dano(dano):
	Global.vida_global -= dano
	#if Global.vida_global <= 0:
		#queue_free()


#signal de tiro
func tiro_laser():
	emit_signal("spawn_laser",saida_laser.global_position)


func _on_Jogador_area_entered(area):
	if area.is_in_group("inimigos"):
		area.levar_dano(1)
