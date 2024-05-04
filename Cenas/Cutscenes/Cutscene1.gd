extends Node2D

@export var l = false
@export var r = false
@export var d = false
@export var u = false


func _ready():
	$AnimationPlayer.play("cutscene")
	
	$Sofia/Camera2D.limit_top = -104
	$Sofia/Camera2D.limit_bottom = 616
	$Sofia/Camera2D.limit_right = 872
	$Sofia/Camera2D.limit_left = -8
	$Sofia/Camera2D.zoom = Vector2(2,2)
	$Sofia.move = false
	
	
func pularCarta():
	$AnimationPlayer.play("saindo")
	$CartaTexto.visible = false
	$Sofia.position.x = 350
	$Sofia.position.y = 40

func _on_button_pressed():
	pularCarta()


func trocaCena():
	get_tree().change_scene_to_file("res://Cenas/Cenarios/Casa_Sofia.tscn")
