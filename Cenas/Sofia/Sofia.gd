extends CharacterBody2D

@export var speed : int = 150
@onready var animations = $Animacao
@onready var animGuia = $GuiaMagica/Animacao
@export var move = true



func handleInput():
	var moveDirection = Input.get_vector("A","D","W","S")
	velocity = moveDirection*speed

func updateAnimation():
	if (velocity.length() == 0):
		animations.stop()
	var direction = ""
	if (velocity.x < 0):
		direction = "left"
	
	elif (velocity.x > 0):
		direction = "right"
		
	elif (velocity.y < 0):
		direction = "up"
		
	elif (velocity.y > 0):
		direction = "down"
	
	animations.play(direction)
	animGuia.play(direction)

func _physics_process(delta):
	if(move):
		handleInput()
		move_and_slide()
		updateAnimation()
	


func left():
	animations.play("left")
	animGuia.play("left")
	
func right():
	animations.play("right")
	animGuia.play("right")
	
func down():
	animations.play("down")
	animGuia.play("down")

func up():
	animations.play("up")
	animGuia.play("up")
	
func stop():
	animations.stop()
