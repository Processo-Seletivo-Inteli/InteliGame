extends CanvasLayer

onready var animation= $AnimationPlayer
var SceneToGo= ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func FadeInto(scene):
	SceneToGo= scene
	animation.play("Fade")
	
func ChangeScene():
	return get_tree().change_scene(SceneToGo)
	

