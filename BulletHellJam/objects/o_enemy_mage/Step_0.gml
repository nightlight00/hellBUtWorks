
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
		image_angle = direction;
		
		if (distance_to_point(xstart, ystart) < 10) {
			attackTimer = 0;
			phase++;
			speed = 0;
		}
		break;
	case 2:
		var _dir = point_direction(x, y, o_player.x, o_player.y);
		var _diff = angle_difference(_dir, image_angle);
		image_angle += _diff * 0.1;

		attackTimer++;
		if (attackTimer > 40 && attackTimer <= 100) {
			if (attackTimer mod 30 == 0) {
				attack_shoot(0, 4.20, o_bullet_seeker);
				attack_shoot(0, 3.6, o_bullet_fireball, point_direction(x, y, o_player.x, o_player.y) + 30);
				attack_shoot(0, 3.6, o_bullet_fireball, point_direction(x, y, o_player.x, o_player.y) - 30);
			}
		}
		if (attackTimer > 110) {
			phase = 0;
		}
		break;
}