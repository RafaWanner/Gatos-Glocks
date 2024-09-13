extends Node2D

@onready var pause_menu = $CanvasLayer/PauseMenu
@onready var lvlup_menu = $CanvasLayer/LVLUpMenu
@onready var game_over_menu = $CanvasLayer/GameOverMenu

var paused = false
var is_lvlup_menu = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		_pause_menu()

func _pause_menu():
	if paused:
		if !is_lvlup_menu:
			Engine.time_scale = 1
			get_node("/root/Game/Player/Gun").is_paused()
		pause_menu.hide()
	else:
		pause_menu.show()
		if Engine.time_scale != 0:
			get_node("/root/Game/Player/Gun").is_paused()
		Engine.time_scale = 0
	
	paused = !paused

func _lvlup_menu():
	is_lvlup_menu = true
	lvlup_menu._random_upgrades()
	lvlup_menu.show()
	Engine.time_scale = 0
	get_node("/root/Game/Player/Gun").is_paused()

func _game_over_menu():
	game_over_menu.show()
	if Engine.time_scale != 0:
		get_node("/root/Game/Player/Gun").is_paused()
	Engine.time_scale = 0

func spawn_mob():
	var new_mob = preload("res://mobs.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_mob2():
	var new_mob = preload("res://mob2.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_mob3():
	var  new_mob = preload("res://omago.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout():
	spawn_mob3()

func _on_timer_2_timeout():
	spawn_mob2()
	

func _on_timer_2_timer_timeout():
	$Timer2.start()
