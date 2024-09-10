obj_player_bottom.x = obj_player.x
obj_player_bottom.y = obj_player.y





if(obj_player.moving) {
	var desired_angle = point_direction(xprevious, yprevious, x, y)
	var alpha = 0.8
	image_angle = alpha * image_angle + (1 - alpha )* desired_angle
}