
// Inherit the parent event
event_inherited();


switch (phase) {
	
	default:
		sprite_index = enemy_02_idle_1;
		xstart = get_box_dimension_x();
		ystart = get_box_dimension_y();
		speed = moveSpeed;
		phase++;
		break;	
	case 1:
		var _dir = point_direction(x, y, xstart, ystart);
		var _diff = angle_difference(_dir, direction);
		direction += _diff * 0.1;
		if (irandom(7) == 0) {
			direction += _diff * 0.15;
		}
		
		if (distance_to_point(xstart, ystart) < 10) {
			attackTimer = 0;
			phase++;
			speed = 0;
			sprite_index = enemy_02_attack_1;
			image_index = 0;
			if (global.player_level >= 6 && instance_number(o_enembase) <= 2) {
				sprite_index = enemy_02_attack_2;
				phase++;
			}
		}
		break;
	case 2:
		attackTimer++;
		if (image_index == 3 || image_index == 5 || image_index == 7 ||image_index == 9) {
			attack_shoot(25, 2.4, o_bullet_head);
		}
		if (attackTimer > 65) {
			phase = 0;
		}
		break;
	case 3:
		attackTimer++;
		if (image_index == 8 || image_index == 10 || image_index == 12 ||image_index == 14||image_index == 16||image_index == 18||image_index == 20) {
			attack_shoot(23, 2.5, o_bullet_head);
		}
		if (attackTimer > 170) {
			phase = 0;
		}
		break;
}

image_angle = hspeed * -5;