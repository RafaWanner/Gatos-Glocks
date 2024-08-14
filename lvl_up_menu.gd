extends Control

@onready var main = $"../../"

func _on_upgrade_1_pressed():
	#dar o upgrade
	main.is_lvlup_menu = false
	Engine.time_scale = 1
	main.lvlup_menu.hide()

func _on_upgrade_2_pressed():
	#dar o upgrade
	main.is_lvlup_menu = false
	Engine.time_scale = 1
	main.lvlup_menu.hide()

func _on_upgrade_3_pressed():
	#dar o upgrade
	main.is_lvlup_menu = false
	Engine.time_scale = 1
	main.lvlup_menu.hide()
