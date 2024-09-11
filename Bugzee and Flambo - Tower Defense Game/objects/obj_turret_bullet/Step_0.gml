if _alarm_ran {
	var _dist = point_distance(x, y, _turret_origin_id.x, _turret_origin_id.y)
	if _dist > 128 {
		instance_destroy()
	}
}