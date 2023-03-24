extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (Array, PackedScene) var scenes


# Called when the node enters the scene tree for the first time.
func _ready():

	for scene in scenes:
		var tmp = scene.instance()
		add_child_below_node(self,tmp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
