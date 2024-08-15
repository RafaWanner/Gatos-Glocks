extends Control

@onready var main = $"../../"

func _on_resume_pressed():
	main._pause_menu()

func _on_quit_pressed():
	Engine.time_scale = 1
	get_node("/root/Game/Player/Gun").is_paused()
	get_tree().change_scene_to_file("res://main_menu.tscn")
