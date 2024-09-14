extends Area2D

@onready var laser_shot_sound = $magiaSpell
@onready var player = get_node("/root/Game/Player")

var paused = false
var shooting = false  # Variável para controlar o estado de disparo
var can_shoot = true

var damage = 1

func is_paused():
	paused = !paused

func _physics_process(_delta):
	# Faz o personagem olhar para a posição do player
	var look_position = player.position
	look_at(look_position)

func shoot():
	laser_shot_sound.play()
	const LASER = preload("res://spellmagico.tscn")
	var new_laser = LASER.instantiate()

	# Definir o dano do laser
	new_laser.damage = damage
	
	# Posiciona e rotaciona o novo laser com base na posição e rotação atuais
	new_laser.global_position = global_position
	new_laser.global_rotation = global_rotation
	
	# Adiciona o laser como um filho da cena atual
	get_parent().add_child(new_laser)

func _on_timer_timeout():
	# Verifica se o jogo está pausado antes de disparar
	if !paused:
		var look_position = player.position
		look_at(look_position)
		shoot()
