extends Area2D

var direcao_atual = Vector2(0,0)
var direcoes = []
var pos_array = []
#definir direcao caudas novas
func _process(_delta):
	position +=  direcao_atual/2
	if direcoes.size() > 0:
		if position == pos_array[0]:
			direcao_atual = direcoes[0]
			tirar_da_cauda()
 #fazer cauda sumir
func tirar_da_cauda():
	direcoes.pop_front()
	pos_array.pop_front()
	#adicionar caudas novas
func add_na_cauda(posicao_cabeca,direcao):
		pos_array.append(posicao_cabeca)
		direcoes.append(direcao)
	
	
	


	#morrer quando a cabeca encosta no corpo
func _on_cauda_area_entered(area):
	if area.name == "cabeca":
		return get_tree().reload_current_scene()
