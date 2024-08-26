extends Area2D

@onready var gun_shot_sound = $GunShotSound
@onready var fire_ball_sound = $FireBallSound

var paused = false

var shooting = false  # Variável para controlar o estado de disparo
var can_shoot = true
var can_shoot_fire_ball = true

var fire_rate = 0.5
var shots = 0

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
			shots += 1
			shoot()
			
			if shots == 3:
				shots = 0
				if can_shoot_fire_ball:
					shoot_fire_ball()
			
			can_shoot = false
			await(get_tree().create_timer(fire_rate).timeout)
			can_shoot = true
		
		var mouse_position = get_global_mouse_position()
		look_at(mouse_position)

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet
	
	for i in $weaponPivot.get_child_count():
		if $weaponPivot.get_child(i).is_visible():
			gun_shot_sound.play()
			new_bullet = BULLET.instantiate()
			new_bullet.damage = damage
			
			new_bullet.global_position = $weaponPivot.get_child(i).get_child(0).global_position
			new_bullet.global_rotation = $weaponPivot.get_child(i).get_child(0).global_rotation
			$weaponPivot.get_child(i).add_child(new_bullet) # Adiciona a bala à cena atual
	

func shoot_fire_ball():
	const FIRE_BALL = preload("res://fire_ball.tscn")
	var new_fire_ball
	for i in $weaponPivot.get_child_count():
		if $weaponPivot.get_child(i).is_visible():
			fire_ball_sound.play()
			new_fire_ball = FIRE_BALL.instantiate()
			
			new_fire_ball.global_position = $weaponPivot.get_child(i).get_child(0).global_position
			new_fire_ball.global_rotation = $weaponPivot.get_child(i).get_child(0).global_rotation
			$weaponPivot.get_child(i).add_child(new_fire_ball) # Adiciona a bala à cena atual
