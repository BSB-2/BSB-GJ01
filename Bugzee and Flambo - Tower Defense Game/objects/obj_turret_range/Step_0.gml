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
	
	var _rotate_spd = 100;
	var _ang = point_direction(x, y, _list[|min_i].x, _list[|min_i].y);
	var _diff = angle_difference(_ang, head_child.image_angle);
	head_child.image_angle += median(-1 * _rotate_spd, _diff, _rotate_spd);
}

ds_list_destroy(_list);