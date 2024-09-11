obj_player_bottom.x = obj_player.x
obj_player_bottom.y = obj_player.y

if (x != xprevious) {
	xp = xprevious
}
if (y != yprevious) {
	yp = yprevious
}
if (x != xprevious && y = yprevious) {
	yp = yprevious
}
if (x = xprevious && y != yprevious) {
	xp = xprevious
}

var desired_angle = point_direction(xp, yp, x, y)
var alpha = 0.15

diffangle = (desired_angle - image_angle) mod 360;
if diffangle > 180 diffangle -= 360;
if diffangle <- 180 diffangle += 360;
 
image_angle += alpha * diffangle;



	