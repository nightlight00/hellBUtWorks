
if (delay <= 0 && !instance_exists(o_enembase)) {
	if (!instance_exists(o_slot_handler)) {
		return;
	}
	
	for (var s = 0; s < instance_number(o_slotpanel); s++) {
		var ss = instance_find(o_slotpanel, s);
		ss.image_speed = 1;
	}
	
	for (var b = 0; b < instance_number(o_boundries); b++) {
		var bound = instance_find(o_boundries, b);
		if (!bound.cantmove) {
			bound.returning = true;
		}
	}	
	
	var door = instance_find(o_slotdoor, 0);
	door.attacking = false;
	
	var workgoddammit = instance_find(o_slot_handler, 0);
	workgoddammit.delay = 70;
	
	delay = 300;
	sprite_index = s_slot_lever_hit_anim;
} 
