extends Area2D

@onready var fireRate := $FireRateTimer

var paused = false

var shooting = false  # Variável para controlar o estado de disparo
var can_shoot = true
var fire_rate = 0.5

func is_paused():
	paused = !paused

func _physics_process(delta):
	if !paused:
		if Input.is_action_pressed("shoot") and can_shoot:
			shoot()
			can_shoot = false
			await(get_tree().create_timer(fire_rate).timeout)
			can_shoot = true
		
		var mouse_position = get_global_mouse_position()
		look_at(mouse_position)

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	var shooting_point = $ShootingPoint  # ou get_node("ShootingPoint") se preferir
	
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet) # Adiciona a bala à cena atual
	fireRate.start()
