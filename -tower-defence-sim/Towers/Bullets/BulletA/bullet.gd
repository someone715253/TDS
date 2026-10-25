extends CharacterBody2D


var target
var Speed = 2000
var pathName = ""
var bulletDamage
var staminaReduction
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var pathSpawnerNode = get_node("/root/Main/Pathspawner")
	var found = false
	for i in pathSpawnerNode.get_child_count():
		var stage = pathSpawnerNode.get_child(i)
		if pathSpawnerNode.get_child(i).name == pathName:
			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
			found = true
			break
	if not found and target == null:
		queue_free()
		return
	velocity = global_position.direction_to(target) * Speed
	look_at(target)
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		body.Health -= bulletDamage
		queue_free()
