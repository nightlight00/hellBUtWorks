
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
			attack_shoot(0, 0, o_bullet_laser);
			targetX = o_player.x;
			targetY = o_player.y;
		}
		if (attackTimer >= 70 && attackTimer <= 100 && attackTimer mod 4 == 0) {
			var p1 = instance_create_layer(x, y, "Instances", o_bullet_laser_travel);
			p1.direction = point_direction(x, y, targetX, targetY);
			p1.speed = 5;
			
			var p2 = instance_create_layer(x, y, "Instances", o_bullet_laser_travel);
			p2.direction = point_direction(x, y, targetX, targetY);
			p2.speed = 5;
			p2.mult = -1;
		}
		if (attackTimer == 80) {
			// taken from attack_flower, but modified for the sin projectiles
			for (var i = 0; i < 7; i++) {
				var p = instance_create_layer(x, y, "Instances", o_bullet_laser_travel);
				p.speed = 3.4;
				p.direction = point_direction(x, y, targetX, targetY) + ((360 / 7) * i) - 180;
				p.image_angle = p.direction;

				var p2 = instance_create_layer(x, y, "Instances", o_bullet_laser_travel);
				p2.speed = 3.4;
				p2.direction = point_direction(x, y, targetX, targetY) + ((360 / 7) * i) - 180;
				p2.image_angle = p.direction;
				p2.mult = -1;
			}
		}
		if (attackTimer > 180 ) {
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

