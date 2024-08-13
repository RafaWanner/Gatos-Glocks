extends CharacterBody2D

signal health_deplated

var health = 5
var xp = 0
var invincibility_duration = 1.0  # Tempo de invencibilidade em segundos
var is_invincible = false

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	get_node("/root/Game/Labels/HealthLabel").text = str(health)
	get_node("/root/Game/Labels/XPLabel").text = str(xp)
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		get_node("HappyBoo").play_walk_animation()
	else:
		get_node("HappyBoo").play_idle_animation()

	const DAMAGE_RATE = 1
	var overlapping_mobs = get_node("HurtBox").get_overlapping_bodies()
	if overlapping_mobs.size() > 0 and not is_invincible:
		health -= DAMAGE_RATE
		get_node("/root/Game/Labels/HealthLabel").text = str(health)
		if health <= 0:
			health_deplated.emit()
		_start_invincibility()

func _start_invincibility():
	is_invincible = true
	await(get_tree().create_timer(invincibility_duration).timeout)
	is_invincible = false

func add_xp(amount):
	xp += amount
	get_node("/root/Game/Labels/XPLabel").text = str(xp)
