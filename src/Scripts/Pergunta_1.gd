extends Node2D



onready var visibility_card_front= $FlashCard_Frente
onready var visibility_card_back= $FlashCard_Tras
onready var texto_frente= $FlashCard_Frente/Texto_Button_Frente
onready var texto_tras= $FlashCard_Tras/Texto_Button_Tras 
onready var LabelFeedback= $Feedback/Label_Feedback
onready var ButtonFeedback= $Feedback/Button_Feedback
onready var feedback= $Feedback
var conta= 0 
var botaoCerto = 0;
var botaoErrado = 0;
var quest= ["Bem vindo ao jogo, clique na tela para prosseguir",
"O que é a dimensão Visão do modelo de produtos?",
"O que é uma declaração de Visão?",
"O que é OGSM e por que é importante para a dimensão da Visão?",
"O que é PLM e quais são nossas vantagens em adotá-lo?"]
			
var answer= ["Aqui as declarações sobre as perguntas aparecerão. Se você acha que a afirmação está correta, aperte check, se você acha que a afirmação é falsa, aperte X.",
"É uma declaração de intenção indicando o que uma empresa, unidade de negócios ou equipe quer se tornar e orientando iniciativas de transformação, definindo uma direção definida para o crescimento futuro.",
"É um documento detalhado de como o projeto alcançará o resultado desejado, envolvendo todas as etapas do processo",
"A estrutura OGSM é um acrônimo para Objetivos, Metas, Estratégias e Medidas. É muito importante para a Visão porque permite que as empresas definam primeiro o que querem fazer e depois como chegarão lá.",
"O Product Lifecycle Management (PLM) é um sistema de gestão do ciclo de vida do produto. Uma das principais vantagens é uma maior compreensão do mercado, facilitando a criação e desenvolvimento de novos produtos e aumentando a participação de mercado."]

var feedback_certo= ["Você acertou, a dimensão Visão é exatamente isso!",
"Você está certo, esta alternativa é falsa. A declaração de visão é uma breve descrição do objetivo final de um projeto. Deve ser sucinta e memorável para que todos os envolvidos tenham algum nível de compreensão de onde queremos ir. Não fornece muitos detalhes, mas dá uma boa compreensão do que é o trabalho.",
"Voce acertou. OGSM é exatamente sobre isso!",
"Você acertou. PLM é exatamente sobre isso!"
	
]
var feedback_errado= ["Você entendeu errado, essa afirmação é verdadeira",
"Você entendeu errado, na verdade a declaração de visão é uma breve descrição do objetivo final de um projeto. Deve ser sucinta e memorável para que todos os envolvidos tenham algum nível de compreensão de onde queremos ir. Não fornece muito detalhes, mas dá uma boa compreensão do que é o trabalho.",
"Você entendeu errado, essa afirmação é verdadeira",
"Você entendeu errado, essa afirmação é verdadeira"
	
]

var ListaPontos= []
var pontos= 0
var ContFeedback= 0
onready var platina = $"../Platina"
onready var ouro = $"../Ouro"
onready var prata = $"../Prata"
onready var bronze = $"../Bronze"
onready var sem_medalha = $"../SemMedalha"


func _ready():
	BackgroundMusic.stop()
	$pcligandosfx.play()
	texto_frente.text = quest[0]
	texto_tras.text = answer[0]
	Global.terminou_fase_1 = true
	
		
	
#Sempre que a função for executada, o contador irá contar incrementar mais um
#então irá fazer um if, onde dependendo do valor do cont, ele irá mostrar uma 
#nova pergunta e uma nova resposta
func PassCards():
	conta += 1
	
	if conta == 1:
		pontos = 0
		visibility_card_front.visible= true
		visibility_card_back.visible= false
		texto_frente.text= quest[1]
		texto_tras.text= answer[1]
		botaoCerto = 0
		botaoErrado = 0
		
	if conta == 2:
		if botaoCerto == 1:
			botaoCerto = 0
			feedback.visible= true
			LabelFeedback.text= feedback_certo[0]
			pontos = pontos + 1
			feedback.color= Color(0.258824, 0.682353, 0.086275)
		else:
			botaoErrado = 0
			feedback.visible= true
			LabelFeedback.text= feedback_errado[0]
			feedback.color= Color(0.6, 0.078431, 0.078431)
		print(pontos)
		visibility_card_front.visible= true
		visibility_card_back.visible= false
		texto_frente.text= quest[2]
		texto_tras.text= answer[2]
	
	if conta == 3:
		if botaoErrado == 1:
			botaoErrado = 0
			pontos = pontos + 1
			feedback.visible= true
			LabelFeedback.text= feedback_certo[1]
			feedback.color= Color(0.258824, 0.682353, 0.086275)
			
		else:
			botaoCerto = 0
			feedback.visible= true
			LabelFeedback.text= feedback_errado[1]
			feedback.color= Color(0.6, 0.078431, 0.078431)
		print(pontos)
		visibility_card_front.visible= true
		visibility_card_back.visible= false
		texto_frente.text= quest[3]
		texto_tras.text= answer[3]
	
	if conta == 4:
		if botaoCerto == 1:
			pontos = pontos + 1
			botaoCerto = 0
			feedback.visible= true
			print("VOCE ACERTOU")
			LabelFeedback.text= feedback_certo[2]
			feedback.color= Color(0.258824, 0.682353, 0.086275)
		else:
			print("VOCE ERROU")
			botaoErrado = 0
			feedback.visible= true
			LabelFeedback.text= feedback_errado[2]
			feedback.color= Color(0.6, 0.078431, 0.078431)
		print(pontos)
		visibility_card_front.visible= true
		visibility_card_back.visible= false
		texto_frente.text= quest[4]
		texto_tras.text= answer[4]
		
	if conta == 5:
		if botaoCerto == 1:
			pontos = pontos + 1
			botaoCerto = 0
			feedback.visible= true
			LabelFeedback.text= feedback_certo[3]
			feedback.color= Color(0.258824, 0.682353, 0.086275)
		else:
			botaoErrado = 0
			feedback.visible= true
			LabelFeedback.text= feedback_errado[3]
			feedback.color= Color(0.6, 0.078431, 0.078431)
		print(pontos)
	print("Pergunta:", conta)
	
#funcao que mostra qual foi a medalha ganha pelo usuário
func Premiacao():
	if conta == 5:
		if pontos == 4:
			print("PLATINA")
			$FlashCard_Tras.visible= false
			$FlashCard_Frente.visible= false
			platina.visible= true
			Global.medalha_1 = 1
			
		elif pontos == 3:
			print ("OURO")
			$FlashCard_Tras.visible= false
			$FlashCard_Frente.visible= false
			ouro.visible= true
			Global.medalha_1 = 2
		elif pontos == 2:
			print ("PRATA")
			$FlashCard_Tras.visible= false
			$FlashCard_Frente.visible= false
			prata.visible= true
			Global.medalha_1 = 3
		elif pontos == 1:
			print ("BRONZE")
			$FlashCard_Tras.visible= false
			$FlashCard_Frente.visible= false
			bronze.visible= true
			Global.medalha_1 = 4
		elif pontos == 0:
			print ("Você não atingiu a pontuação suficiente para passar de fase")
			$FlashCard_Tras.visible= false
			$FlashCard_Frente.visible= false
			sem_medalha.visible= true
			Global.medalha_1 = 0
		
#funcao que vira o flashcard e mostra a parte traseira
func _on_Button_Flashcard_Front_pressed():
	visibility_card_front.visible= false
	visibility_card_back.visible= true
	

#funcao que, caso o usuario acerte a pergunta, incrementa mais um na variavel pontos
#e chama a função "Premiação()"	
func _on_Button_Certo_pressed():
	botaoCerto = 1
	PassCards()
	#if ContFeedback == 4:
		#Premiacao()
	
#funcao que, caso o usuario erre a pergunta, decrementa menos um na variavel pontos
#e chama a função "Premiação()"	
func _on_Button_Errado_pressed():
	botaoErrado = 1
	PassCards()
	#if ContFeedback == 4:
		#Premiacao()
	

#Funções que trocam de cena ao player apertar o botão home depois que ele terminar
#todos os flashcards daquela dimensão
func _on_Home_Button_Platina_pressed():
	Global.fumaca_visao= true
	Global.DialogoPenDrive= false
	Global.Inventario_Itens[0]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Primeiro_Plano.tscn")


func _on_Home_Button_Ouro_pressed():
	Global.fumaca_visao= true
	Global.DialogoPenDrive= false
	Global.Inventario_Itens[0]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Primeiro_Plano.tscn")


func _on_Home_Button_Prata_pressed():
	Global.fumaca_visao= true
	Global.DialogoPenDrive= false
	Global.Inventario_Itens[0]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Primeiro_Plano.tscn")


func _on_Home_Button_Bronze_pressed():
	Global.DialogoPenDrive= false
	Global.Inventario_Itens[0]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Primeiro_Plano.tscn")


func _on_Home_Button_SemMedalha_pressed():
	Global.DialogoPenDrive= false
	Global.Inventario_Itens[0]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Primeiro_Plano.tscn")



func _on_Button_Feedback_pressed():
	feedback.visible= false
	ContFeedback += 1
	if ContFeedback == 4:
		Premiacao()
	print ("Botao feedback: ", ContFeedback)
	
