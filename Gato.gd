extends Sprite2D

func play_andar_animacao():
	$AnimcaoPlayer.play("gato_anda")

func play_idle_animacao():
	$AnimcaoPlayer.play("gato_para")
