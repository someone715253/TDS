extends Button



func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Main/main.tscn")
	Game.health=50
	Game.money=400
	Game.time_a = 0
	Game.time=0
	Game.time_b = 0
