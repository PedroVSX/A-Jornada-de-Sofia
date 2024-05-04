extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#$AnimationPlayer.play("Carrega")
	$Sofia/Camera2D.limit_left = 64
	$Sofia/Camera2D.limit_bottom = 1408
	$Sofia/Camera2D.limit_right = 6240
	$Sofia/Camera2D.limit_top = -1280


