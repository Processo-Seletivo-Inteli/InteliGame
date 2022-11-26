extends ColorRect


#array definindo os objetivos da movimentação do player
var vet_objetivos = ["Entre no prédio",
					"Fale com a Ellen",
					"Vá ao 1° andar",
					"Fale com Marcos",
					"Fale com a Pinky no segundo andar",
					"Pegue o Pen Drive",
					"Conecte o Pen drive no pc do 1° andar",
					"Vá ao terceiro andar",
					"Fale com Hawking",
					 "Pegue a RAM",
					 "Conserte o pc no 2° andar",
					 "Fale com Norman no 4° andar",
					 "Pegue a placa de vídeo",
					"Conserte o pc no 3° andar"]
	
	
func _physics_process(_delta):
	$Label.text = vet_objetivos[Global.contador]

		
