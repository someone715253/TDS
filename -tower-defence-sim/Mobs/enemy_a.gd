extends CharacterBody2D

@export var speed = 350
var Health = 10
var max_health = 0


func _ready() -> void:
	Health += (Game.time/6)
	max_health = Health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_speed = speed
	get_parent().set_progress(get_parent().get_progress() + current_speed*delta)

	if get_parent().get_progress_ratio() == 1:
		Game.health -= 1
		death()
	if Health <= 0:
		Game.money += 1
		death()
		return
		
func death():
	get_parent().get_parent().queue_free()
