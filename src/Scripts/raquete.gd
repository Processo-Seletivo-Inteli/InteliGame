extends KinematicBody2D

signal atualizar 
#declaracao de variaveis
export var velocidade_movimento = 600
var direcao = Vector2()



#atualizar posicao
func _process(_delta):
	emit_signal("atualizar")
#check de colisao
func _physics_process(delta):
	if direcao.length() > 0:
		direcao = direcao.normalized() * velocidade_movimento
		move_and_collide(direcao * delta)
#resetar posicao da raquete
func resetar_raquete():
	position = Vector2(48,350)
