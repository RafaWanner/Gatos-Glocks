extends Control

@onready var main = $"../../"
@onready var gun = get_node("/root/Game/Player/Gun")

func _on_retry_pressed():
	Engine.time_scale = 1
	get_node("/root/Game/Player/Gun").is_paused()
	get_tree().change_scene_to_file("res://survivors_game.tscn")

func _on_quit_pressed():
	Engine.time_scale = 1
	gun.is_paused()
	gun.gun_number = 0
	get_tree().change_scene_to_file("res://main_menu.tscn")
