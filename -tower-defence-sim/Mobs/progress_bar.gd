extends ProgressBar



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.max_value = get_parent().max_health
	self.value = get_parent().Health
