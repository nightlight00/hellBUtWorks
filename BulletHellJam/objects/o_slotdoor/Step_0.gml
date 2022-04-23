
resetAnim -= 1;
if (resetAnim == 0) {
	sprite_index = s_hell_gate_anim;
	image_index = 1; 
	image_speed = 1;
}

if (attacking) {
	delay--;
	if (delay <= 0) {
		var pList = ds_list_create();
		
		ds_list_add(pList, o_bullet_storm_pellet);
		if (attackLevel > 1) {
			ds_list_add(pList, o_bullet_storm_pellet);
			ds_list_add(pList, o_bullet_stormbreaker);
		}
			
		ds_list_shuffle(pList);
		var proj = ds_list_find_value(pList, 0);
	
		var p = instance_create_layer(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), "Instances", proj);
		p.direction = 270;
		p.image_angle = p.direction;
		p.speed = 2;
		
		switch (proj) {
			case o_bullet_storm_pellet:
				p.direction = point_direction(p.x, p.y, o_player.x, o_player.y);
				p.speed = 2.5;
				p.image_angle = p.direction;
			default:
				delay = 55 - (attackLevel * 3);
				break;
				
			case o_bullet_stormbreaker:
				delay = 80 - (attackLevel * 3);
				break;
		}
		if (attackLevel > 8) {
			delay *= 0.75;
		}
		
		ds_list_destroy(pList);
	}
}