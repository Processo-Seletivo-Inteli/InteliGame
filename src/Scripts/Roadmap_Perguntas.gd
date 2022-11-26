
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
" O que é um roadmap e para que serve?",
"Qual é o único resultado esperado que está presente em todos os níveis de maturidade do Roadmap?",
"O que é um roadmap baseado em resultados para cada versão e por que é importante?",
" Como deve ser feito o uso contínuo da coleta de dados e feedback do usuário para planejar resultados futuros a serem priorizados no roadmap do produto?"]
			
var answer= ["Aqui as declarações sobre as perguntas aparecerão. Se você acha que a afirmação está correta, aperte check, se você acha que a afirmação é falsa, aperte X.",
"É uma espécie de 'mapa' que visa organizar os objetivos de desenvolvimento de software, criados independentemente das necessidades dos usuários.",
"Roteiro Baseado em Resultados",
"É a visão do produto, de como vamos chegar ou criar o produto com base no que queremos alcançar. A cada lançamento, determinamos os objetivos e o que queremos alcançar com aquele produto e o que queremos alcançar com esse resultado. A cada trimestre desenvolvemos um componente do produto.",
"Um exemplo: se você quer que seu software chegue no PM para iniciar o mais rápido possível, então você mede esse tempo. Ele faz funcionalidades ou histórias e as complementa. Enquanto isso, valide com o usuário, para reduzir ainda mais o tempo. O que leva mais tempo é isso, então eu sei que devo pegar esses dados e automatizar esses campos."]

var feedback_certo= ["Você acertou, todo o roadmap é criado de acordo com a necessidade do usuário",
"Isso mesmo, o Outcome Based Roadmap é o único resultado esperado em todos os níveis de maturidade",
"Isso mesmo, uma resposta completa, direto do nosso Scrum Master",
"Errado, este exemplo ilustra bem como devemos coletar feedback do usuário para planejar resultados futuros a serem priorizados no roteiro do produto"
	
]
var feedback_errado= ["Você entendeu errado, todo o roadmap é criado de acordo com a necessidade do usuário",
"Você entendeu errado, o Outcome Based Roadmap é o único resultado esperado em todos os níveis de maturidade",
"Errado, um roadmap baseado em resultados é exatamente isso.",
"Isso mesmo, um exemplo completo, direto do nosso Scrum Master"
	
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
	Global.controlRAM == false
	BackgroundMusic.stop()
	$pcligandosfx.play()
	texto_frente.text = quest[0]
	texto_tras.text = answer[0]
	Global.contador = 11
	Global.Inventario_Itens[1] = false
		
	
	
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
		if botaoErrado == 1:
			botaoErrado = 0
			feedback.visible= true
			LabelFeedback.text= feedback_certo[0]
			pontos = pontos + 1
			feedback.color= Color(0.258824, 0.682353, 0.086275)
		else:
			feedback.visible= true
			LabelFeedback.text= feedback_errado[0]
			feedback.color= Color(0.6, 0.078431, 0.078431)
		print(pontos)
		visibility_card_front.visible= true
		visibility_card_back.visible= false
		texto_frente.text= quest[2]
		texto_tras.text= answer[2]
	
	if conta == 3:
		if botaoCerto == 1:
			botaoCerto = 0
			pontos = pontos + 1
			feedback.visible= true
			LabelFeedback.text= feedback_certo[1]
			feedback.color= Color(0.258824, 0.682353, 0.086275)
			
		else:
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
			LabelFeedback.text= feedback_errado[3]
			feedback.color= Color(0.258824, 0.682353, 0.086275)
		else:
			feedback.visible= true
			LabelFeedback.text= feedback_certo[3]
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
			Global.medalha_2 = 1
		elif pontos == 3:
			print ("OURO")
			$FlashCard_Tras.visible= false
			$FlashCard_Frente.visible= false
			ouro.visible= true
			Global.medalha_2 = 2
		elif pontos == 2:
			print ("PRATA")
			$FlashCard_Tras.visible= false
			$FlashCard_Frente.visible= false
			prata.visible= true
			Global.medalha_2 = 3
		elif pontos == 1:
			print ("BRONZE")
			$FlashCard_Tras.visible= false
			$FlashCard_Frente.visible= false
			bronze.visible= true
			Global.medalha_2 = 4
		elif pontos == 0:
			print ("Você não atingiu a pontuação suficiente para passar de fase")
			$FlashCard_Tras.visible= false
			$FlashCard_Frente.visible= false
			sem_medalha.visible= true
			Global.medalha_2 = 0
		
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
	Global.fumaca_roadmap= true
	Global.DialogoRAM= false
	Global.Inventario_Itens[1]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Segundo_Plano.tscn")


func _on_Home_Button_Ouro_pressed():
	Global.fumaca_roadmap= true
	Global.DialogoRAM= false
	Global.Inventario_Itens[1]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Segundo_Plano.tscn")


func _on_Home_Button_Prata_pressed():
	Global.fumaca_roadmap= true
	Global.DialogoRAM= false
	Global.Inventario_Itens[1]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Segundo_Plano.tscn")


func _on_Home_Button_Bronze_pressed():
	Global.DialogoRAM= false
	Global.Inventario_Itens[1]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Segundo_Plano.tscn")


func _on_Home_Button_SemMedalha_pressed():
	Global.DialogoRAM= false
	Global.Inventario_Itens[1]= false
	if Global.controlMusic == true:
		BackgroundMusic.play()
	return get_tree().change_scene("res://Segundo_Plano.tscn")



func _on_Button_Feedback_pressed():
	feedback.visible= false
	ContFeedback += 1
	if ContFeedback == 4:
		Premiacao()
	print ("Botao feedback: ", ContFeedback)
	
