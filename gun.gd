extends Area2D

@onready var fireRate := $FireRateTimer

var paused = false

var shooting = false  # Variável para controlar o estado de disparo
var can_shoot = true
var fire_rate = 0.5
var damage = 1
var gun_number = 1
var max_gun_number = 8

func gun_number_upgrade():
	if gun_number * 2 <= max_gun_number:
		gun_number *= 2
	for i in $weaponPivot.get_child_count():
		$weaponPivot.get_child(i).visible = gun_number > i

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
	shoot_1()
	fireRate.start()

func shoot_1():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet
	
	for i in $weaponPivot.get_child_count():
		if $weaponPivot.get_child(i).is_visible():
			new_bullet = BULLET.instantiate()
			new_bullet.damage = damage
			
			new_bullet.global_position = $weaponPivot.get_child(i).get_child(0).global_position
			new_bullet.global_rotation = $weaponPivot.get_child(i).get_child(0).global_rotation
			$weaponPivot.get_child(i).add_child(new_bullet) # Adiciona a bala à cena atual
