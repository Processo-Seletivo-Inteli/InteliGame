extends Node2D

signal gol_esquerda 
signal gol_direita 



func _ready():
	pass 



func _on_GolEsquerda_body_entered(_body):
	 emit_signal("gol_esquerda")
	

func _on_GolDireita_body_entered(_body):
	emit_signal("gol_direita")
	
