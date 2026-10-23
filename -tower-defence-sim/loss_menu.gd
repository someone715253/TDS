extends Control

func _ready() -> void:
	var minutes = Game.death_time / 60
	var seconds = (Game.death_time-60*minutes) % 60
	get_node("TimeSurvived").text = "Time Survived: %d:%02d" % [minutes, seconds]

func _on_quit_tm_pressed() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Main/main_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
