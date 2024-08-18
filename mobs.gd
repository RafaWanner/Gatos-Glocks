extends CharacterBody2D

var health = 3

@onready var player =  get_node("/root/Game/Player")
@onready var hit = $hit
@onready var death = get_node("/root/Game/Sounds/Death")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 150.0
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

	const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_EXPLOSION.instantiate()
	get_parent().add_child(smoke)
	smoke.global_position = global_position
