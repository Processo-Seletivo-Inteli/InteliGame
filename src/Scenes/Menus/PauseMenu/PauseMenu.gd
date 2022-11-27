extends Control

var is_paused = false setget set_is_paused

#função que verifica se a tecla de pause foi pressionada através de um evento
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused
		
# funçao que define se a variavel é true ou false
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	if is_paused:
		$ColorRect.set_position(Vector2(0,0))
		$ColorRect/CenterContainer.set_position(Vector2(469.5, 211.5))
		$ColorRect/ContinueButton.visible = true		
		$ColorRect/ContinueButton.set_position(Vector2(583, 307))
		$ColorRect/QuitButton.visible = true				
		$ColorRect/QuitButton.set_position(Vector2(583, 347))
	
#função que despausa jogo
func _on_ContinueButton_pressed():
	self.is_paused = false
	
# funçao que faz o jogador trocar para a cena do menu inicial ao apertar o botão "Menu"
func _on_QuitButton_pressed():
	self.is_paused = false
	return get_tree().change_scene("res://Scenes/Menus/MainMenu/MainMenu.tscn")
