extends Node2D


func _ready():
	if Global.medalha_1 == 1:
		$Platina/Sprite.visible = true
		$Ouro/Sprite.visible = false
		$Prata/Sprite.visible = false
		$Bronze/Sprite.visible = false
		Global.verificacaoFase1 = 1
	elif Global.medalha_1 == 2:
		$Platina/Sprite.visible = false
		$Ouro/Sprite.visible = true
		$Prata/Sprite.visible = false
		$Bronze/Sprite.visible = false
		Global.verificacaoFase1 = 1
	elif Global.medalha_1 == 3:
		$Platina/Sprite.visible = false
		$Ouro/Sprite.visible = false
		$Prata/Sprite.visible = true
		$Bronze/Sprite.visible = false
		Global.verificacaoFase1 = 1
	elif Global.medalha_1 == 4:
		$Platina/Sprite.visible = false
		$Ouro/Sprite.visible = false
		$Prata/Sprite.visible = false
		$Bronze/Sprite.visible = true
		Global.verificacaoFase1 = 0
	else:
		$Platina/Sprite.visible = false
		$Ouro/Sprite.visible = false
		$Prata/Sprite.visible = false
		$Bronze/Sprite.visible = false
		Global.verificacaoFase1 = 0
		
	if Global.medalha_2 == 1:
		$Platina/Sprite2.visible = true
		$Ouro/Sprite2.visible = false
		$Prata/Sprite2.visible = false
		$Bronze/Sprite2.visible = false
	elif Global.medalha_2 == 2:
		$Platina/Sprite2.visible = false
		$Ouro/Sprite2.visible = true
		$Prata/Sprite2.visible = false
		$Bronze/Sprite2.visible = false
	elif Global.medalha_2 == 3:
		$Platina/Sprite2.visible = false
		$Ouro/Sprite2.visible = false
		$Prata/Sprite2.visible = true
		$Bronze/Sprite2.visible = false
	elif Global.medalha_2 == 4:
		$Platina/Sprite2.visible = false
		$Ouro/Sprite2.visible = false
		$Prata/Sprite2.visible = false
		$Bronze/Sprite2.visible = true
	else:
		$Platina/Sprite2.visible = false
		$Ouro/Sprite2.visible = false
		$Prata/Sprite2.visible = false
		$Bronze/Sprite2.visible = false

	if Global.medalha_3 == 1:
		$Platina/Sprite3.visible = true
		$Ouro/Sprite3.visible = false
		$Prata/Sprite3.visible = false
		$Bronze/Sprite3.visible = false
	elif Global.medalha_3 == 2:
		$Platina/Sprite3.visible = false
		$Ouro/Sprite3.visible = true
		$Prata/Sprite3.visible = false
		$Bronze/Sprite3.visible = false
	elif Global.medalha_3 == 3:
		$Platina/Sprite3.visible = false
		$Ouro/Sprite3.visible = false
		$Prata/Sprite3.visible = true
		$Bronze/Sprite3.visible = false
	elif Global.medalha_3 == 4:
		$Platina/Sprite3.visible = false
		$Ouro/Sprite3.visible = false
		$Prata/Sprite3.visible = false
		$Bronze/Sprite3.visible = true
	else:
		$Platina/Sprite3.visible = false
		$Ouro/Sprite3.visible = false
		$Prata/Sprite3.visible = false
		$Bronze/Sprite3.visible = false
