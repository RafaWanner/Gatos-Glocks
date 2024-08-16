extends CharacterBody2D

signal health_deplated
signal lvlup_screen_is_down

var health = 3
var xp = 0
var lvlup = 1
var xp_amount = 1
var speed = 600
var invincibility_duration = 1.0  # Tempo de invencibilidade em segundos
var is_invincible = false

@onready var heart_bar = get_node("/root/Game/Camera2D/HeartBar")

func _ready():
	heart_bar.show()
	heart_bar.update_health(health)

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	get_node("/root/Game/Labels/HealthLabel").text = str(health)
	get_node("/root/Game/Labels/XPLabel").text = str(xp)
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		get_node("Gato").play_andar_animacao()
	else:
		get_node("Gato").play_idle_animacao()

	const DAMAGE_RATE = 1
	var overlapping_mobs = get_node("HurtBox").get_overlapping_bodies()
	if overlapping_mobs.size() > 0 and not is_invincible:
		health -= DAMAGE_RATE
		get_node("/root/Game/Labels/HealthLabel").text = str(health)
		heart_bar.update_health(health)
		
		if health <= 0:
			health_deplated.emit()
			get_node("/root/Game")._game_over_menu()
		
		_start_invincibility()

func _start_invincibility():
	is_invincible = true
	await(get_tree().create_timer(invincibility_duration).timeout)
	is_invincible = false

func add_xp():
	xp += xp_amount
	get_node("/root/Game/Labels/XPLabel").text = str(xp)
	
	while xp >= lvlup:
		get_node("/root/Game")._lvlup_menu()
		await lvlup_screen_is_down
		get_node("/root/Game/Player/Gun").is_paused()
		xp -= lvlup
		lvlup += + 2 # aumenta o nivel necessario para o lvl up por + 2
