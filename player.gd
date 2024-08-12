extends CharacterBody2D


signal health_deplated
var health = 100.0


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right",
"move_up", "move_down")

	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		get_node("HappyBoo").play_walk_animation()
	else: 
		get_node("HappyBoo").play_idle_animation()

	const DAMAGE_RATE = 20.0
	var overlappping_mobs = %HurtBox.get_overlapping_bodies()
	if overlappping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlappping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_deplated.emit()			
	
		
