switch health_current{
	case 2: sprite_index = hudface_good; 
	break;
	case 1: sprite_index = hudface_neutral; 
	break;
	case 0: sprite_index = hudface_bad; 
	break;
	case -1: sprite_index = hudface_dead; 
	break;
}

for(var itI = 0; itI <= health_max; itI += 1) {
	offset = itI * 65;
	itID = itI
	var _healthbar
	_healthbar = instance_create_layer(x + offset, y, "hud", obj_hud_health_bar)
}