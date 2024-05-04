extends CharacterBody2D
var velocidade = 150


func _process(delta):
	var dir = Vector2()
	
	# REMOVER DEPOIS
	if(Input.is_action_pressed("W")):
		dir.y = -velocidade
	
	if(Input.is_action_pressed("A")):
		dir.x = -velocidade 
	
	if(Input.is_action_pressed("S")):
		dir.y = velocidade
	
	if(Input.is_action_pressed("D")):
		dir.x = velocidade
	####################################
	
	position+=(dir*delta)
	
	if (dir.length()>0):
		if(dir.x > 0):
			$Animacao.play("right")
			
		elif(dir.x < 0):
			$Animacao.play("left")
			
		elif (dir.y > 0):
			$Animacao.play("down")
			
		elif (dir.y < 0):
			$Animacao.play("up")
		
			
