extends Control

@onready var main = $"../../"

func _on_retry_pressed():
	Engine.time_scale = 1
	get_node("/root/Game/Player/Gun").is_paused()
	get_tree().change_scene_to_file("res://survivors_game.tscn")

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
