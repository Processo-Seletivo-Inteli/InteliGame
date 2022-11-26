extends NinePatchRect

#Código reservado para implementação de mecânicas futuras

onready var text= $RichTextLabel

var MessageQueue: Array = [
	"Olá, tudo bem",
	"Eu irei te ensinar o modelo de produtos"
	
]

func _ready():
	showMessage()
	
func showMessage():
	var msg: String= MessageQueue.pop_front()
	text.bbcode_text= msg 
	


