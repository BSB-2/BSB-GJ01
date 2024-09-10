obj_player_bottom.x = obj_player.x
obj_player_bottom.y = obj_player.y


var desired_angle = point_direction(obj_player_bottom.xprevious, obj_player_bottom.yprevious, obj_player_bottom.x, obj_player_bottom.y)
var alpha = 0.8
obj_player_bottom.image_angle = alpha * obj_player_bottom.image_angle + (1 - alpha )* desired_angle
