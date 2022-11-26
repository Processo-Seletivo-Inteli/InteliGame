extends Area2D

signal comida_usada
	#emitir sinal quando a comida for usada
func _on_comida_area_entered(area):
	if area.name == "cabeca":
		self.queue_free()
		emit_signal("comida_usada")
		
		


