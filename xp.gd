extends StaticBody2D
@onready var morte = $morte

func _on_area_2d_body_entered(body):
	morte.play()
	if body.name == "Player":
		body.add_xp()
		queue_free()
