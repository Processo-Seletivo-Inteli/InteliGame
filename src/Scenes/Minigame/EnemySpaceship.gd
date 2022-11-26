extends Area2D

var velocidade = 250
var vida = 1


#velocidade fixa da nave
func _process(delta):
	global_position.y += velocidade * delta
	
	if global_position.y >= 623:
		Global.vida_global -= 1
		queue_free()

#inimigo levar dano
func levar_dano(dano):
	vida -= dano
	if vida <= 0:
		queue_free()

#inimigo leva dano casa haja contato com jogador
func _on_inimigo_area_entered(area):
	if area is Spaceship:
		area.levar_dano(1)
		
