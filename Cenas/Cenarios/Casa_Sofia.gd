extends Node2D

@export var trocou = false
var dialogo = 0


func _ready():
	$AnimationPlayer.play("Carrega")
	$Sofia/Camera2D.limit_left = -320
	$Sofia/Camera2D.limit_bottom = 1344
	$Sofia/Camera2D.limit_right = 4768
	$Sofia/Camera2D.limit_top = -512


func pularDialogo():
	dialogo+=1
	print(dialogo)
	if(dialogo==1):
		$Dialogo/AnimacaoSofia.play("sorriso")
		$Dialogo/SofiaFala1.visible = false
		$Dialogo/SofiaFala2.visible = true
		
	if(dialogo==2):
		$Dialogo/AnimacaoSofia.visible = false
		$Dialogo.visible = false
		$Dialogo/Button.disabled = true
		
		$CanvasPlaca1.visible = false
		$Sofia.move = true



func _on_button_pressed():
	pularDialogo()



func _on_area_placa_body_entered(body):
	if(body.name == "Sofia"):
		$CanvasPlaca1.visible = true
		$AnimationPlayer.play("Placa1")



func _on_area_troca_cena_body_entered(body):
	if(body.name == "Sofia"):
		$AnimationPlayer.play("TrocaCena")
	

func trocaCena():
	get_tree().change_scene_to_file("res://Cenas/Cenarios/Caminho_da_Matemágica.tscn")


