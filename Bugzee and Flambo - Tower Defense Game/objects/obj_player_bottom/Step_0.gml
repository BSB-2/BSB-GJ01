obj_player_bottom.x = obj_player.x
obj_player_bottom.y = obj_player.y


var desired_angle = point_direction(xprevious, yprevious, x, y)
var alpha = 0.8
//image_angle = abs(alpha * image_angle + (1 - alpha )* desired_angle)

diffangle = (desired_angle - image_angle) mod 360;
if diffangle > 180 diffangle -= 360;
if diffangle <- 180 diffangle += 360;
 
image_angle += alpha * diffangle;