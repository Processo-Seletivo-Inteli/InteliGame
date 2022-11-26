extends Area2D

var velocidade = 1000

#velocidade fixa do laser
func _process(delta):
	global_position.y += -velocidade * delta

#laser sumir e adicionar pontuacao caso haja contato entre laser e inimigo 
func _on_Laser_area_entered(area):
	if area.is_in_group("inimigos"):
		area.levar_dano(1)
		queue_free()
		Global.pontuacao += 10
