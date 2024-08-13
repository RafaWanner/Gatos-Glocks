extends StaticBody2D

var amount = 1

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.add_xp(amount)
		queue_free()
