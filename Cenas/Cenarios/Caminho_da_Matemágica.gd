extends Node2D

var dialogo = 0
var desafio = 1
var resposta

@onready var botoes = [$Escolha/Button1, $Escolha/Button2, $Escolha/Button3, $Escolha/Button4]

################## DESAFIOS ##################
func generate_and_display_sum_question():
	var num1 = randi_range(5, 20)  # Número aleatório entre 1 e 10
	var num2 = randi_range(5, 20)  # Número aleatório entre 1 e 10
	var answer = num1 + num2  # Calcula a resposta da soma
	
	# Gera a expressão matemática
	var question = str(num1) + " + " + str(num2) + " = ?"
	
	$Escolha/Label.text = question
	
	
	
	var indice_escolhido = randi() % botoes.size()
	var botao_escolhido = botoes[indice_escolhido]
	
	botao_escolhido.text = str(answer)
	var escolhido = [botao_escolhido]
	
	var botoes_nao_escolhidos = []
	for i in range(botoes.size()):
		if (i != indice_escolhido):
			botoes_nao_escolhidos.append(botoes[i])
	
	
	for i in range(botoes_nao_escolhidos.size()):
		var num_aleatorio = randi_range(-5,5)
		while(num_aleatorio == 0):
			num_aleatorio = randi_range(-5,5)
		botoes_nao_escolhidos[i].text = str(answer + num_aleatorio)
	
	resposta = str(answer)

	print("resposta = "+str(resposta))
	print(escolhido)
	print(botoes_nao_escolhidos)






###############################################



func _ready():
	$AnimationPlayer.play("Carrega")
	$Sofia/Camera2D.limit_left = -256
	$Sofia/Camera2D.limit_bottom = 1664
	$Sofia/Camera2D.limit_right = 3072
	$Sofia/Camera2D.limit_top = -2560
	$Sofia/GuiaMagica.visible = true



func pularDialogo():
	dialogo += 1
	print(dialogo)
	#GUIA
	if(dialogo==1):
		$Dialogo/Animacao.visible = false
		$Dialogo/AnimacaoGuia.visible = true
		
		$Dialogo/GuiaFala1.visible = true
		$Dialogo/SofiaFala1.visible = false
		
	#SOFIA
	elif(dialogo==2):
		$Dialogo/Animacao.visible = true
		$Dialogo/AnimacaoGuia.visible = false
		
		$Dialogo/Animacao.play("sorriso")
		$Dialogo/GuiaFala1.visible = false
		$Dialogo/SofiaFala2.visible = true
		
	#GUIA
	elif(dialogo==3):
		$Dialogo/Animacao.visible = false
		$Dialogo/AnimacaoGuia.visible = true
		
		$Dialogo/GuiaFala2.visible = true
		$Dialogo/SofiaFala2.visible = false
	
	#SOFIA
	elif(dialogo==4):
		$Dialogo/Animacao.visible = true
		$Dialogo/AnimacaoGuia.visible = false
		
		$Dialogo/Animacao.play("sorriso")
		$Dialogo/GuiaFala2.visible = false
		$Dialogo/SofiaFala3.visible = true
	
	#GUIA
	elif(dialogo==5):
		$Dialogo/Animacao.visible = false
		$Dialogo/AnimacaoGuia.visible = true
		
		$Dialogo/GuiaFala3.visible = true
		$Dialogo/SofiaFala3.visible = false
	
	#SOFIA
	elif(dialogo==6):
		$Dialogo/Animacao.visible = true
		$Dialogo/AnimacaoGuia.visible = false
		
		$Sofia.move = true
		$Dialogo/GuiaFala3.visible = false
		$Dialogo.visible = false
		$Dialogo/Button.disabled = true
	
	#GUIA
	elif(dialogo==7):
		$Dialogo/Animacao.visible = false
		$Dialogo/AnimacaoGuia.visible = true
		
		$Dialogo/GuiaFala4.visible = true
		$Dialogo/SofiaFala4.visible = false
		
	elif(dialogo==8):
		$Dialogo/Animacao.visible = false
		$Dialogo/AnimacaoGuia.visible = false
		$Sofia.move = true
		$Dialogo/GuiaFala4.visible = false
		$Dialogo.visible = false
		$Dialogo/Button.disabled = true
		
		$Sofia.move = false
		$Bloqueios/Desafio1Bloqueio.disabled = true
		
		$Escolha.visible = true
		randomize()  # Inicializa o gerador de números aleatórios
		# Chame a função para gerar e exibir uma nova questão de soma
		generate_and_display_sum_question()
		
	elif(dialogo==9):
		$Dialogo/Animacao.visible = false
		$Dialogo/AnimacaoGuia.visible = true
		
		$Dialogo/GuiaFala5.visible = true
		$Dialogo/SofiaFala5.visible = false
		
	elif(dialogo==10):
		$Dialogo/Animacao.visible = false
		$Dialogo/AnimacaoGuia.visible = false
		$Dialogo/GuiaFala5.visible = false
		$Dialogo.visible = false
		$Dialogo/Button.disabled = true
		$AnimationPlayer.play("Acertou1")
		$AnimatedSprite2D.play("default")


func _on_button_pressed():
	pularDialogo()



func _on_area_desafio_1_body_entered(body):
	if(body.name == "Sofia"):
		$AnimationPlayer.play("Desafio1")



func _on_area_troca_cena_body_entered(body):
	if(body.name=="Sofia"):
		get_tree().change_scene_to_file("res://Cenas/Cenarios/Floresta_das_Medidas.tscn")


func _on_button_1_pressed():
	print("clicou 1")
	if(desafio == 1):
		if ($Escolha/Button1.text == resposta):
			print("acertou")
			$Escolha.visible = false
			$Dialogo.visible = true
			$Dialogo/SofiaFala5.text = "A resposta é " + str(resposta) + "."
			$Dialogo/Animacao.visible = true
			$Dialogo/Animacao.play("seria")
			$Dialogo/SofiaFala5.visible = true
			$Dialogo/Button.disabled = false
		
		else:
			print("errou")

func _on_button_2_pressed():
	print("clicou 2")
	if(desafio == 1):
		if ($Escolha/Button2.text == resposta):
			print("acertou")
			$Escolha.visible = false
			$Dialogo.visible = true
			$Dialogo/SofiaFala5.text = "A resposta é " + str(resposta) + "."
			$Dialogo/Animacao.visible = true
			$Dialogo/Animacao.play("seria")
			$Dialogo/SofiaFala5.visible = true
			$Dialogo/Button.disabled = false
			
		else:
			print("errou")

func _on_button_3_pressed():
	print("clicou 3")
	if(desafio == 1):
		if ($Escolha/Button3.text == resposta):
			print("acertou")
			$Escolha.visible = false
			$Dialogo.visible = true
			$Dialogo/SofiaFala5.text = "A resposta é " + str(resposta) + "."
			$Dialogo/Animacao.visible = true
			$Dialogo/Animacao.play("seria")
			$Dialogo/SofiaFala5.visible = true
			$Dialogo/Button.disabled = false
			
		else:
			print("errou")

func _on_button_4_pressed():
	print("clicou 4")
	if(desafio == 1):
		if ($Escolha/Button4.text == resposta):
			print("acertou")
			$Escolha.visible = false
			$Dialogo.visible = true
			$Dialogo/SofiaFala5.text = "A resposta é " + str(resposta) + "."
			$Dialogo/Animacao.visible = true
			$Dialogo/Animacao.play("seria")
			$Dialogo/SofiaFala5.visible = true
			$Dialogo/Button.disabled = false
			
		else:
			print("errou")
