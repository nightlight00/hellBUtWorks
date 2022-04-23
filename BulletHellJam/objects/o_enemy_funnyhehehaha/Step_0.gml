
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
		if (attackTimer == 40) {
			attack_shoot(0, 1.4, o_bullet_exploder);
			targetX = o_player.x;
			targetY = o_player.y;
		}
		if (attackTimer > 70) {
			phase = 0;
		}
		break;
}
/*
phaseTimer++;
if (phaseTimer > phaseMax) {
	phase++;
	phaseTimer = 0;
	if (phase > 3) {
		phase = 0;
	}
	switch (phase) {
		default: phaseMax = 60; break;
		case 1: phaseMax = 25; break;
		case 2: phaseMax = 18; break;
		case 3: phaseMax = 1; break;
	}
}

switch (phase) {
	default: 
		if (attackTimer mod turnSpeed == 0) {
			var _dir = point_direction(x, y, o_player.x, o_player.y);
			var _diff = angle_difference(_dir, direction);
			direction += _diff * 0.15;
			if (irandom(7) == 0) {
				direction += _diff * 0.15;
			}
		}
		break;
		
	case 1:
		speed = 0;
		var _dir = point_direction(x, y, o_player.x, o_player.y);
		var _diff = angle_difference(_dir, image_angle);
		image_angle += _diff * 0.15;
		break;
		
	case 2:
		speed = moveSpeed * 2;
		direction = image_angle;
		break;
		
	case 3:
		speed = moveSpeed;
		for (var i = 0; i < 4; i++) {
			var p = instance_create_layer(x, y, "Instances", o_bullet_seeker);
			p.timeLeft = 40;
			p.direction = 45 + (90 * i);
			p.image_angle = direction;
			p.speed = 3;
		}
		break;
}

