
delay--;
moveStopper--;

if (delay == 0 && !instance_exists(o_enembase)) {
	
	delay = 70;
	if (global.player_level == 17) {
		instance_create_layer(view_wport[0] / 2, view_hport[0] * 0.25, "Instances", o_BOSS);
		with (o_slotpanel) {
			image_speed = 0;
		}
		instance_destroy(self);
	}
	
	// slot door
	var door = instance_find(o_slotdoor, 0);
	
	for (var i = 0; i < instance_number(o_slotpanel); i++) {
		var slot = instance_find(o_slotpanel, i);
		if (slot.image_speed > 0) {
			slot.image_speed = 0;
			if (i == 2) {
				if (spawnType[0] == 0) {
					slot.image_index = 0;
				}
				
				door.image_index = 1;
				door.sprite_index = s_hell_gate_anim_open;
				door.image_speed = 1;
				door.resetAnim = 150;
			}
			
			if (global.player_level == 5 || global.player_level == 11 || global.player_level == 17) {
				slot.image_index = 3;
			}
			spawnType[slot.image_index]++;
			return;
		}
	}
	
	switch (global.player_level) {
		case 5:
			spawnType[0] = 3;
			spawnType[1] = 1;
			spawnType[2] = 1;
			spawnType[3] = 0;
			break;
		case 11:
			spawnType[0] = 4;
			spawnType[1] = 3;
			spawnType[2] = 2;
			spawnType[3] = 0;
			break;
		case 17:
			spawnType[0] = 0;
			spawnType[1] = 0;
			spawnType[2] = 0;
			spawnType[3] = 0;
			break;
	}

	// spawnType[3] = JACKPOT (3 for all other slot types)
	if (spawnType[3] >= 2) {
		spawnType[0] += spawnType[3];
		spawnType[1] += spawnType[3];
		spawnType[2] += spawnType[3];
	}
	
	// spawnType[0] = enemies
	var amount = 0;
	switch (spawnType[0]) {
		case 1:
			amount = 1;
			break;
		case 2:
			amount = 3;
			break;
		case 3:
			amount = 5;
			break;
	}
	if (amount > 0) {
		amount += floor(global.player_level / 4);
	}
	while (amount > 0) {
		var enemlist = ds_list_create();
		if (amount >= 1) {
			ds_list_add(enemlist, o_enemy_basic);
			ds_list_add(enemlist, o_enemy_stomp);
		}
		if (amount >= 2) {
			// double them since we want higher power over amount
			for (var i2 = 0; i2 < 2; i2++) {
				ds_list_add(enemlist, o_enemy_heavy);
				ds_list_add(enemlist, o_enemy_mage);
			}
		}
		if (amount >= 3) {
			// triple them since we want higher power over amount
			for (var i3 = 0; i3 < 3; i3++) {
				ds_list_add(enemlist, o_enemy_funnylaser);
				ds_list_add(enemlist, o_enemy_funnyhehehaha);
			}
		}
		ds_list_shuffle(enemlist);
		var e = instance_create_layer(random_range(door.bbox_left, door.bbox_right), random_range(door.bbox_top, door.bbox_bottom), "Instances", ds_list_find_value(enemlist, 0));
		
		switch (ds_list_find_value(enemlist, 0)) {
			default: 
				amount -= 1;
				break;
			case o_enemy_heavy:
			case o_enemy_mage:
				amount -= 2;
				break;
			case o_enemy_funnylaser:
			case o_enemy_funnyhehehaha:
				amount -= 3;
				break;
		}
		
		ds_list_destroy(enemlist);
	}
	
	// spawnType[1] = confine player movement/move playing field
	if (spawnType[1] > 0) {
		for (var m = 0; m < instance_number(o_boundries); m++) {
			var bound = instance_find(o_boundries, m);
			if (!bound.cantmove) {
				bound.returning = false;
				
				if (spawnType[1] >= 2) {
					bound.hspeed = 0.5 + (spawnType[1] * 0.1);
					if (bound.left) {
						bound.hspeed = -bound.hspeed;
					}
				}
				
				if (spawnType[1] != 2) {
					bound.vspeed = 0.25;
					if (bound.top) {
						bound.vspeed = -bound.vspeed;
					}
				}
			}
		}
		moveStopper = 20;
	}

	// spawnType[2] = bullet storm
	if (spawnType[2] > 0) {
		door.attacking = true;
		switch (spawnType[2]) {
			case 1:
				door.attackLevel = 1;
				break;
				
			case 2:
				door.attackLevel = 3
				break;
				
			case 3:
				door.attackLevel = 5;
				break;
		}
		door.attackLevel += floor(global.player_level / 5);
	}

	// reset everything
	for (var i = 0; i < slotStyles; i++) {
		spawnType[i] = 0;
	}
	//delay = 140;
	
	global.player_level++;

}

if (moveStopper == 0) {
	for (var m = 0; m < instance_number(o_boundries); m++) {
		var bound = instance_find(o_boundries, m);
		bound.speed = 0;
	}
}
/*
if (moveStopper = -160) {
	for (var b = 0; b < instance_number(o_boundries); b++) {
		var bound = instance_find(o_boundries, b);
		if (!bound.cantmove) {
			bound.returning = true;
		}
	}
}