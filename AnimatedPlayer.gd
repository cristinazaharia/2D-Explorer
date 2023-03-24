extends KinematicBody2D


# stats
var score : int = 0
# physics
var speed : int = 150
var jumpForce : int = 600
var gravity : int = 800
var vel : Vector2 = Vector2()
var grounded : bool = false
onready var sprite = $AnimatedSprite
onready var user_interface = get_node("/root/MainScene/CanvasLayer/UserInterface")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if vel.x == 0 :
		sprite.play("idle")
	
	
	if Input.is_action_pressed("move_right"): 
		sprite.play("run")
	

	if Input.is_action_pressed("move_left"):
		sprite.play("run")
	
	
		
	if Input.is_action_pressed("jump") and Input.is_action_pressed("move_right") :
		sprite.play("jump")
		
	if Input.is_action_pressed("jump") and Input.is_action_pressed("move_left") :
		sprite.play("jump")
		
	if Input.is_action_pressed("jump"):
		sprite.play("jump")
	
	
		
func _physics_process (delta):

	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false
		
func collect_coin (value):
	
   score += value
   user_interface.set_score_text(score)
   
func die ():
	
	get_tree().change_scene("res://GameEnd.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
