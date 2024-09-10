#region // Movemment

//inputs
Key_Left = keyboard_check_direct(ord("A"));
Key_Right = keyboard_check_direct(ord("D"));
Key_Up = keyboard_check_direct(ord("W"));
Key_Down = keyboard_check_direct(ord("S"));
Key_Sprint = keyboard_check_direct(vk_lshift);
 
key_hor = Key_Right - Key_Left;
key_vert = Key_Down - Key_Up;
key_speed = min(1, abs(key_hor) + abs(key_vert));
key_dir = point_direction(0, 0, key_hor, key_vert);

moving = false

//Collisions and Movement
//Horizontal (X)
if place_meeting(x + (sign(key_hor) * 8), y, par_collision){
    while !place_meeting(x + (sign(key_hor) * 4), y, par_collision){
        x += key_hor;
    }
    if place_meeting(x + (sign(key_hor) * 8), y + 16, par_collision){
        y = y - player_speed_mod;
		moving = true;
    }
    if place_meeting(x + (sign(key_hor) * 8), y-16, par_collision){
        y = y + player_speed_mod;
		moving = true;
    }
}
else {
    x += lengthdir_x(key_speed * player_speed, key_dir);
}
 
//Vertical (Y)
if place_meeting(x, y + (sign(key_vert) * 8), par_collision){
    while !place_meeting(x,y+(sign(key_vert) * 4), par_collision){
        y += key_vert;
    }
    if place_meeting(x + 16, y + (sign(key_vert) * 8), par_collision){
        x = x - player_speed_mod;
		moving = true;
    }
    if place_meeting(x - 16, y + (sign(key_vert) * 8), par_collision){
        x = x + player_speed_mod;
		moving = true;
    }
}
else {
    y += lengthdir_y(key_speed * player_speed, key_dir);
}
 
if (Key_Sprint){
    sprinting = true;
    player_speed = player_sprint;
}
else{
    sprinting = false;
    player_speed = player_speed_mod;
}
 
 
image_angle = point_direction(x,y,mouse_x,mouse_y) + 180;


if(moving) {
	var desired_angle = point_direction(obj_player_bottom.xprevious, obj_player_bottom.yprevious, obj_player_bottom.x, obj_player_bottom.y)
	var alpha = 0.8
	obj_player_bottom.image_angle = alpha * obj_player_bottom.image_angle + (1 - alpha )* desired_angle
}
#endregion
#region // Shooting

var _cd = 15;

if (mouse_check_button_pressed(mb_left) && _cooldown == true) {
	_cooldown = false;
	
	instance_create_layer(x, y, "Instances", obj_bullet); // default gun
	
	obj_player.alarm[0] = _cd;
}

#endregion

#region // Debugging

var _strspeed = speed * 100;

#endregion
#region // misc

move_wrap(true, true, 0);

#endregion
