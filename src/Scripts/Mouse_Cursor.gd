extends Node2D


#funcao que remove o ponteiro do mouse padrão e seta o novo ponteiro
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
#funcao que permite a movimentacao do novo ponteiro
func _process(delta):
	self.position= self.get_global_mouse_position()
	
