extends Node2D

export var SceneToGo= ""

func _ready():
	Global.Dialogoutcontrol= false
	
func _on_jogar_button_pressed():
	Transicao.FadeInto(SceneToGo)

func _on_config_button_pressed():
	$Control.visible = true

func _on_sair_button_pressed():
	get_tree().quit()

func _on_TextureButton_pressed():
	$Control.visible = false

#função para ativar a música do jogo ao clicar no botão
func _on_ButtonPlay_pressed():
	Global.controlMusic = true
	BackgroundMusic.play()

#função para desativar a música do jogo ao clicar no botão
func _on_ButtonStop_pressed():
	Global.controlMusic = false
	BackgroundMusic.stop()
