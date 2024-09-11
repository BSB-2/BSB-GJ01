x++;

#region // death

function die() {
	instance_destroy()
	show_debug_message("dead")
}

#region // collision

var _list = ds_list_create();
var _num_coll = instance_place_list(x, y, obj_turret_bullet, _list, false);

if (_num_coll > 0) {
	for (var it_i = 0; it_i < _num_coll; ++it_i;) {
		_health = _health - _list[|it_i]._damage
		instance_destroy(_list[|it_i])
		if _health <= 0 {
			die()
		}
	}
}

ds_list_destroy(_list);