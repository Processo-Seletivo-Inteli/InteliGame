extends Node2D

#variavel que inicia o dialogo criado no Dialogic
var NewDialog= Dialogic.start('Dialogo_inicial')

#função que implementa o diálogo assim que o jogador entrar na cena
func _ready():
	if Global.Dialogoutcontrol == false:
		add_child(NewDialog)
		Global.Dialogoutcontrol= true
