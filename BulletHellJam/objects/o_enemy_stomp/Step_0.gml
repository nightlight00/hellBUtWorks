
// Inherit the parent event
event_inherited();


switch (phase) {
	default:
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
		image_angle = direction;
		
		if (distance_to_point(xstart, ystart) < 10) {
			attackTimer = 0;
			phase++;
			speed = 0;
		}
		break;
	case 2:
		attackTimer++;
		if (attackTimer == 25) {
			for (var i = 0; i < 9; i++) {
				attack_shoot(0, 2.1, o_bullet_spinner, 270 + ((360 / 9) * i));
			}
		}
		if (attackTimer > 60) {
			phase = 0;
		}
		break;
}