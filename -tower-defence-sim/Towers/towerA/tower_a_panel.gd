extends Panel
@onready var tower = preload("res://Towers/towerA/tower_a.tscn")
var currentTile

func _get_valid_targets(preview_tower: Node) -> Array:
	var raw = preview_tower.get_node("TowerDetector").get_overlapping_bodies()
	var done = []
	for a in raw:
		if a != preview_tower and not preview_tower.is_ancestor_of(a):
			done.append(a)
	return done
	



func _on_gui_input(event):
	if Game.money >= 100:
		var tempTower = tower.instantiate()
		if event is InputEventMouseButton and event.button_mask == 1:
			add_child(tempTower)
			tempTower.is_preview = true
			tempTower.scale = Vector2(1,1)
		elif event is InputEventMouseMotion and event.button_mask == 1:
			if get_child_count() > 1:
				get_child(1).global_position = event.global_position
				var mapPath = get_tree().get_root().get_node("/root/Main/Map")
				var tile = mapPath.local_to_map(get_global_mouse_position())
				currentTile = mapPath.get_cell_atlas_coords(tile)
				var targets = _get_valid_targets(get_child(1))
				if (currentTile == Vector2i(4,5)):
					if (targets.size() > 0):
						get_child(1).get_node("Area").modulate = Color(255, 255, 255, 0.251)
					else:
						get_child(1).get_node("Area").modulate = Color(0, 255, 0, 0.251)
				else:
					get_child(1).get_node("Area").modulate = Color(255, 255, 255, 0.251)
		elif event is InputEventMouseButton and event.button_mask == 0:
			if event.global_position.x >= 1840:
				if get_child_count() > 1:
					get_child(1).queue_free()
			else:
				var canPlace = false
				if get_child_count() > 1 and currentTile == Vector2i(4,5):
					var targets = _get_valid_targets(get_child(1))
					canPlace = targets.size() < 1
				if get_child_count() > 1:
					get_child(1).queue_free()
				if canPlace:
					var path = get_tree().get_root().get_node("/root/Main/Towers")
					path.add_child(tempTower)
					tempTower.is_preview = false
					tempTower.global_position = event.global_position
					tempTower.get_node("Area").hide()
					Game.money -= 100
		else :
			if get_child_count() > 1:
				get_child(1).queue_free()
				
				
