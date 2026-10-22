extends Node2D


@onready var pause_menu = $PauseMenu
var paused = false
func _process(delta: float) -> void: #checks if the pause button has been pressed
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu(): #allows the game to be paused
	if paused:
		pause_menu.hide()
		Engine.time_scale = Game.time_scale
	else:
		pause_menu.show()
		Game.time_scale = Engine.time_scale
		Engine.time_scale = 0
			
	paused = !paused
