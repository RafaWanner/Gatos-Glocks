extends Area2D

@onready var magiaspell = $magiaSpell
@onready var player =  get_node("/root/Game/Player")

var paused = false

var shooting = false  # Variável para controlar o estado de disparo
var can_shoot = true

var damage = 1

func is_paused():
	paused = !paused

func _physics_process(delta):
		var look_position = player.position
		look_at(look_position)

func shoot():
	magiaspell.play()
	const LASER = preload("res://spellmagico.tscn")
	var new_laser
	
	new_laser = LASER.instantiate()
	new_laser.damage = damage
	
	new_laser.global_position = %ShootingPoint.global_position
	new_laser.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_laser) # Adiciona a bala à cena atual


func _on_timer_timeout():
	if !paused:
		var look_position = player.position
		look_at(look_position)
		shoot()
