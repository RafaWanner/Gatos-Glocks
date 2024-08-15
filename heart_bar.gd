extends HBoxContainer

var heart_full = preload("res://Assets/Gatos&GlocksSprites/Vida.png")

func update_health(value):
	for i in get_child_count():
		get_child(i).visible = value > i
