extends Node


var time_scale = 0
var time_a = 0
var time=0
var time_b = 0
var death_time=0
var money = 400
var health = 50:
	set(value):
		health = value
		if health <= 0:
			health = 0
			death_time= time_b
			get_tree().change_scene_to_file("res://Main/loss.tscn")
			
func _process(delta): 
	time_a += delta
	time_b=int(ceil(time_a))
	time = snapped(time_a, 30)
