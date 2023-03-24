extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var scoreValue = get_node("ScoreValue")

# Called when the node enters the scene tree for the first time.
func _ready():
	scoreValue.text = "0"

func set_score_text (score):
	scoreValue.text = str(score)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
