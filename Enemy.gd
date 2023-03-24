extends Area2D


export var speed : int = 100
export var moveDist : int = 300
onready var startX : float = position.x
onready var targetX : float = position.x + moveDist
onready var sprite = $Obstacle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process (delta):
	
	position.x = move_to(position.x, targetX, speed * delta)
   
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX
			
func move_to (current, to, step):
	var new = current
	sprite.flip_h=false
	if new < to:
		sprite.flip_h=true
		new += step
		if new > to:
			new = to
   
	else:
		new -= step
		if new < to:
			new = to
	return new
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()
