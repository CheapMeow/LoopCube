extends Line2D

export var length : float = 50
export var sqrMaxLength : float = 200

var point : Vector2 = Vector2.ZERO

func _process(delta):
	global_position = Vector2.ZERO
	global_rotation = 0
	
	point = get_parent().global_position
	
	# avoid big gaps
	if(get_point_count() > 1):
		if (point - points[get_point_count() - 1]).length_squared() > sqrMaxLength:
			clear_points()
			return

	add_point(point)
	while get_point_count() > length:
		remove_point(0)
