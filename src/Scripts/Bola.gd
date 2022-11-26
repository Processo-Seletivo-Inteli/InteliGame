extends KinematicBody2D

#declaracao de variaveis
export var velocidade_inicial_bola = 650
var mutador_velocidade = 50
var velocidade_bola = velocidade_inicial_bola
var contador_hits = 0
var contador_hits_maximo = 12
var direcao = Vector2()

#setar direcao inicial da bola
func _ready():
	randomize()
	set_direcao_inicial()
	
#funcao de randomizar direcao inicial da bola
func set_direcao_inicial():
	var random_x = 0
	
	if randi()%10 < 5:
		random_x = 1
		
	else:
		random_x = -1
		
	direcao = Vector2(random_x,rand_range(-1,1))
	direcao = direcao.normalized() * velocidade_bola
	
	#checar se a colisao entre bola e raquetes
func _physics_process(delta):
	var colisao = move_and_collide(direcao * delta)

	if colisao:
		direcao = direcao.bounce(colisao.normal)
		if colisao.collider.is_in_group("raquetes"):
			var y = direcao.y / 2 + colisao.collider_velocity.y
			
			direcao = Vector2(direcao.x, y).normalized() * (velocidade_bola + contador_hits * mutador_velocidade) 
			
			
			if contador_hits < contador_hits_maximo:
				contador_hits += 1
				
	#reset posicao da bola
func reset():
	position = Vector2(620,350)
	direcao = Vector2()
	contador_hits = 0

				
