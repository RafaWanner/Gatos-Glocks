extends CharacterBody2D

var health = 1

@onready var player =  get_node("/root/Game/Player")
@onready var hit = $hit
@onready var fire = $Fire
@onready var death = get_node("/root/Game/Sounds/Death")
@onready var FireDamageTimer = $MagiaInsana/Timer
@onready var fire_start_sound = $FireStartSound
@onready var fire_sound = $FireSound

var fire_damage_timer = 0.5
var is_on_fire = false
var fire_damage = 0

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 50
	move_and_slide()

func take_damage(amount):
	hit.play()
	health -= amount
	
	if health <= 0:
		death.play()
		const XP_DROP = preload("res://xp.tscn")
		var xp = XP_DROP.instantiate()
		get_parent().add_child(xp)
		xp.global_position = global_position
		queue_free()

func set_on_fire(damage):
	fire.show()
	fire_start_sound.play()
	fire_sound.play()
	fire.modulate.a = 0.75
	is_on_fire = true
	fire_damage = damage
	FireDamageTimer.start()



func _on_timer_timeout():
	take_damage(fire_damage) # Replace with function body.
