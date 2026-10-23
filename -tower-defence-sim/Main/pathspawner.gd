extends Node2D

@onready var path = preload("res://Main/Stage1.tscn")
var EnemyA = preload("res://Mobs/enemy_a.tscn")#Insert enemy scenes when made
#var EnemyB = preload("")
#var EnemyC = preload("")
#var EnemyD = preload("")
func _on_timer_timeout() -> void:
	if Game.time_b<10:
		return
	var temppath = path.instantiate()
	add_child(temppath)	
	var follow = temppath.get_node("PathFollow2D")
	var enemy_scene
	if Game.time_b<70: 
		var rng = randi() % 100
		#if rng<=79:
		enemy_scene = EnemyA 
#		else:
#			enemy_scene = EnemyB
#	elif Game.time_b<150:
#		var rng = randi() % 100
#		if rng<= 49:
#			enemy_scene = EnemyA 
#		elif rng<= 98:
#			enemy_scene = EnemyB
#		else:
#			enemy_scene = EnemyC
	follow.add_child(enemy_scene.instantiate())
