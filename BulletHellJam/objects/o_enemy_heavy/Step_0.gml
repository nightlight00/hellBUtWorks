
// Inherit the parent event
event_inherited();

switch (phase) {
	default:
		sprite_index = enemy_01;
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
			sprite_index = enemy_01_attack3;
			image_index = 0;
		}
		break;
	case 2:
		attackTimer++;
		if (image_index == 11) {
			image_index = 7;
		}
		if (attackTimer > 30 && attackTimer <= 70) {
			attack_flower(5, 9, 2, o_bullet_head);
		}
		if (attackTimer > 95 ) {
			phase = 0;
		}
		break;
}

image_angle = hspeed * -5;