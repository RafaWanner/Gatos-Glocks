extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")

func _on_options_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()

func _on_controle_pressed():
	get_tree().change_scene_to_file("res://controles.tscn")
