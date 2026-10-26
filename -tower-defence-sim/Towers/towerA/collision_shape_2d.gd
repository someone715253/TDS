extends CollisionShape2D


func _ready() -> void: 
	hide()


func _draw():
	var cen = Vector2(0,0)
	var rad =  get_parent().get_parent().range
	var col = Color(0.0, 255, 0.0, 0.25)
	draw_circle(cen,rad,col)
	
