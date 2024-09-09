#region // Movemment

var _rotate_spd = 100;
var _ang = point_direction(x, y, mouse_x, mouse_y);
var _diff = angle_difference(_ang, image_angle);

if keyboard_check(ord("W"))
{
	motion_add(90, _spd);
	_slowdown = true;
	speed = clamp(speed, _spd_min, _spd_max);
}

if keyboard_check(ord("A"))
{
	motion_add(180, _spd);
	_slowdown = true;
	speed = clamp(speed, _spd_min, _spd_max);
}

if keyboard_check(ord("S"))
{
	motion_add(270, _spd);
	_slowdown = true;
	speed = clamp(speed, _spd_min, _spd_max);
}

if keyboard_check(ord("D"))
{
	motion_add(0, _spd);
	_slowdown = true;
	speed = clamp(speed, _spd_min, _spd_max);
}

if (_slowdown)
{
	speed -= _friction;
	if (speed <= 1)
	{
		_slowdown = false;
	}
}

image_angle += median(-1 * _rotate_spd, _diff, _rotate_spd); 

#endregion
#region // Shooting

var _cd = 15;

if (mouse_check_button_pressed(mb_left) && _cooldown == true)
{
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
