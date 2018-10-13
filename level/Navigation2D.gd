extends Navigation2D

func getPath(enemy, end):
	var endPos = Vector2(end.x,end.y)
	var closestPos = get_closest_point(endPos)
	return get_simple_path(enemy.global_position, closestPos)
	