extends Area2D

var damage = 1
var travelled_distance = 0

var piercing = 0
var max_piercing = 100

func _physics_process(delta):
	const SPEED = 200
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position +=  direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	piercing += 1
	if piercing >= max_piercing:
		queue_free()
	
	if body.has_method("_receive_damage"):
		body._receive_damage(damage)
