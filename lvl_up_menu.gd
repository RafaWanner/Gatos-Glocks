extends Control

@onready var main = $"../../"
@onready var heart_bar = $"../HeartBar"
@onready var player = $"../../Player"
@onready var gun = get_node("/root/Game/Player/Gun")

@onready var upgrade1 = $MarginContainer/HBoxContainer/Upgrade1
@onready var upgrade2 = $MarginContainer/HBoxContainer/Upgrade2
@onready var upgrade3 = $MarginContainer/HBoxContainer/Upgrade3

var upgrades = ["player_hearts", "fire_rate", "bullet_damage", "xp_increasse", "player_speed"]

var rand_upgrade1 = upgrades[randi() % upgrades.size()]
var rand_upgrade2 = upgrades[randi() % upgrades.size()]
var rand_upgrade3 = upgrades[randi() % upgrades.size()]

func _ready():
	_random_upgrades()

func _random_upgrades():
	rand_upgrade1 = upgrades[randi() % upgrades.size()]
	
	match rand_upgrade1:
		"player_hearts":
			upgrade1.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Vida.png")
		"fire_rate":
			upgrade1.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Balet¦o.png")
		"bullet_damage":
			upgrade1.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Glocks.png")
		"xp_increasse":
			upgrade1.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/XP.png")
		"player_speed":
			upgrade1.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Bota.png")
	
	rand_upgrade2 = upgrades[randi() % upgrades.size()]
	
	while rand_upgrade2 == rand_upgrade1:
		rand_upgrade2 = upgrades[randi() % upgrades.size()]
	
	match rand_upgrade2:
		"player_hearts":
			upgrade2.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Vida.png")
		"fire_rate":
			upgrade2.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Balet¦o.png")
		"bullet_damage":
			upgrade2.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Glocks.png")
		"xp_increasse":
			upgrade2.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/XP.png")
		"player_speed":
			upgrade2.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Bota.png")
	
	rand_upgrade3 = upgrades[randi() % upgrades.size()]
	
	while (rand_upgrade3 == rand_upgrade1 or rand_upgrade3 == rand_upgrade2):
		rand_upgrade3 = upgrades[randi() % upgrades.size()]
	
	match rand_upgrade3:
		"player_hearts":
			upgrade3.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Vida.png")
		"fire_rate":
			upgrade3.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Balet¦o.png")
		"bullet_damage":
			upgrade3.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Glocks.png")
		"xp_increasse":
			upgrade3.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/XP.png")
		"player_speed":
			upgrade3.icon = ResourceLoader.load("res://Assets/Gatos&GlocksSprites/Bota.png")

func upgrade_player_hearts():
	player.health += 1
	heart_bar.update_health(player.health)

func upgrade_fire_rate():
	gun.fire_rate /= 1.25

func upgrade_bullet_damage():
	gun.damage += 1

func upgrade_xp_increase():
	player.xp_amount += 1

func upgrade_player_speed():
	player.speed += 100

func _on_upgrade_1_pressed():
	#dar o upgrade
	match rand_upgrade1:
		"player_hearts":
			upgrade_player_hearts()
		"fire_rate":
			upgrade_fire_rate()
		"bullet_damage":
			upgrade_bullet_damage()
		"xp_increasse":
			upgrade_xp_increase()
		"player_speed":
			upgrade_player_speed()
	#dar o upgrade
	main.is_lvlup_menu = false
	Engine.time_scale = 1
	main.lvlup_menu.hide()
	player.lvlup_screen_is_down.emit()

func _on_upgrade_2_pressed():
	#dar o upgrade
	match rand_upgrade2:
		"player_hearts":
			upgrade_player_hearts()
		"fire_rate":
			upgrade_fire_rate()
		"bullet_damage":
			upgrade_bullet_damage()
		"xp_increasse":
			upgrade_xp_increase()
		"player_speed":
			upgrade_player_speed()
	#dar o upgrade
	main.is_lvlup_menu = false
	Engine.time_scale = 1
	main.lvlup_menu.hide()
	player.lvlup_screen_is_down.emit()

func _on_upgrade_3_pressed():
	#dar o upgrade
	match rand_upgrade3:
		"player_hearts":
			upgrade_player_hearts()
		"fire_rate":
			upgrade_fire_rate()
		"bullet_damage":
			upgrade_bullet_damage()
		"xp_increasse":
			upgrade_xp_increase()
		"player_speed":
			upgrade_player_speed()
	#dar o upgrade
	main.is_lvlup_menu = false
	Engine.time_scale = 1
	main.lvlup_menu.hide()
	player.lvlup_screen_is_down.emit()
