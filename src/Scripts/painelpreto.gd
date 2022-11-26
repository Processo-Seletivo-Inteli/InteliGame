extends Popup

#declaração de variaveis
var NewDialog= Dialogic.start('Dialogo_elevador')
var cont=0
export var SceneToGo= ""

#função que começa o dialógo assim que o personagem entrar na cena
func _ready():
	$elevadorsfx.play()
	pass
	
#funçao que verifica se o botao zero foi pressionado para mudar de cena
func _process(_delta):
	if cont == 0:
		#add_child(NewDialog)
		cont += 1

#funções que recebem um valor inserido pelo jogador no botão e retorna na tela
func _on_Button1_pressed():
	#return get_tree().change_scene("res://Primeiro_Plano.tscn")
	SceneToGo= "res://Primeiro_Plano.tscn"
	Transicao.FadeInto(SceneToGo)
	
func _on_Button2_pressed():
	#return get_tree().change_scene("res://Segundo_Plano.tscn")
	SceneToGo= "res://Segundo_Plano.tscn"
	Transicao.FadeInto(SceneToGo)
	
func _on_Button3_pressed():
	#return get_tree().change_scene("res://Terceiro_Plano.tscn")
	SceneToGo= "res://Terceiro_Plano.tscn"
	Transicao.FadeInto(SceneToGo)
	
func _on_Button4_pressed():
	SceneToGo= "res://Quarto_Plano.tscn"
	Transicao.FadeInto(SceneToGo)
	
func _on_Button0_pressed():
	#return get_tree().change_scene("res://TileMap_Recepcao.tscn")
	SceneToGo= "res://TileMap_Recepcao.tscn"
	Transicao.FadeInto(SceneToGo)
