obj_player_bottom.x = obj_player.x
obj_player_bottom.y = obj_player.y

if (moving) {
	var desired_angle = point_direction(xprevious, yprevious, x, y)
	var alpha = 0.8

	diffangle = (desired_angle - image_angle) mod 360;
	if diffangle > 180 diffangle -= 360;
	if diffangle <- 180 diffangle += 360;
 
	image_angle += alpha * diffangle;
}
else {
	var xp = xprevious - yprevious
	var yp = yprevious - xprevious

	if (xp < 0 or xp > 0) {
		image_alpha = 90;
	}
	if (yp < 0 or yp > 0) {
		image_alpha = 180;
	}
}
	