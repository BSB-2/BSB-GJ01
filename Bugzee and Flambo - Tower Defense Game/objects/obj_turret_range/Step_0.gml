#region // shooting

function fire(pos_x, pos_y) {
	var _cd = 20 // number of frames before ready to fire again
	
	if _cooldown {
		new_bullet = instance_create_layer(x, y, "Instances", obj_turret_bullet)
		new_bullet.target_x = pos_x
		new_bullet.target_y = pos_y
		_cooldown = false
		alarm[0] = _cd; // after _cd frames, _cooldown set to True
	}
}

#region // aim and fire at closest enemy in collision

var _list = ds_list_create();
var _num = instance_place_list(x, y, obj_enemy, _list, false);
var min_dist = -1
var min_i = -1

if (_num > 0)
{
    for (var i = 0; i < _num; ++i;)
    {
       if min_dist == -1 or point_distance(x, y, _list[|i].x, _list[|i].y) < min_dist {
		   min_dist = point_distance(x, y, _list[|i].x, _list[|i].y)
		   min_i = i
	   }
    }
	
	// rotates head to face targets
	var _rotate_spd = 100;
	var _ang = point_direction(x, y, _list[|min_i].x, _list[|min_i].y);
	var _diff = angle_difference(_ang, head_child.image_angle);
	head_child.image_angle += median(-1 * _rotate_spd, _diff, _rotate_spd);
	
	fire(_list[|min_i].x, _list[|min_i].y)
}

ds_list_destroy(_list);