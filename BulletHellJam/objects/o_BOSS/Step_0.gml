
// Inherit the parent event
event_inherited();


switch (phase) {
	default:
		var newPos = idlePos;
		while (newPos = idlePos) {
			newPos = choose(0, 1, 2);
		}
		idlePos = newPos;
		switch (idlePos) {
			default: 
				xstart = view_wport[0] / 2;
				ystart = view_hport[0] / 2 - 50;
				break;
			case 1:
				xstart = view_wport[0] / 2 - 200;
				ystart = view_hport[0] / 2;
				break;
			case 2:
				xstart = view_wport[0] / 2 + 200;
				ystart = view_hport[0] / 2;
				break;
		}
		drawIllusion = false;
		speed = moveSpeed;
		phase++;
		break;	
	case 1:
		var _dir = point_direction(x, y, xstart, ystart);
		var _diff = angle_difference(_dir, direction);
		direction += _diff * 0.1;
		if (irandom(7) == 0) {
			direction += _diff * 0.5;
		}
		image_angle = direction;
		
		if (distance_to_point(xstart, ystart) < 10) {
			attackTimer = 0;
			phase = choose(2, 3, 4, 5);
			speed = 0;
		}
		break;
		
	case 2: // fun laser attack
		attackTimer++;
		// set position to target
		if (attackTimer == 1) {
			targetX = o_player.x;
			targetY = o_player.y;
		}
		// fires laser straight at player
		if (attackTimer == 40) {
			var p = instance_create_layer(x, y, "Instances", o_bullet_bosser_laser);
			p.direction =  point_direction(x, y, targetX, targetY);
			p.image_angle = p.direction;
			
			var p2 = instance_create_layer(x, y, "Instances", o_bullet_bosser_laser);
			p2.direction =  point_direction(x, y, targetX, targetY) - 40;
			p2.image_angle = p2.direction;
			p2.ori = 1;
			
			var p3 = instance_create_layer(x, y, "Instances", o_bullet_bosser_laser);
			p3.direction =  point_direction(x, y, targetX, targetY) + 40;
			p3.image_angle = p3.direction;
			p3.ori = -1;
		}
		if (attackTimer == 80 || attackTimer == 140) {
			// fires sprialing bullets
			for (var i = 0; i < 10; i++) {
				var p = instance_create_layer(x, y, "Instances", o_bullet_bosser);
				p.speed = 6;
				p.direction = point_direction(x, y, targetX, targetY) + ((360 / 10) * i);
				p.image_angle = p.direction;
				
				var p2 = instance_create_layer(x, y, "Instances", o_bullet_bosser);
				p2.speed = 6;
				p2.direction = point_direction(x, y, targetX, targetY) + ((360 / 10) * i)
				p2.image_angle = p.direction;
				p2.ori = -1;
			}
			if (attackTimer == 140) {
				for (var i = 0; i < 10; i++) {
					var p = instance_create_layer(x, y, "Instances", o_bullet_fireball);
					p.speed = 4;
					p.direction = point_direction(x, y, targetX, targetY) - 30 + (i * 6);
					p.image_angle = p.direction;
				}
			}
		}
		if (attackTimer == 100) {
			var p2 = instance_create_layer(x, y, "Instances", o_bullet_bosser_laser);
			p2.direction =  point_direction(x, y, targetX, targetY) - 20;
			p2.image_angle = p2.direction;
			p2.ori = -1;
			
			var p3 = instance_create_layer(x, y, "Instances", o_bullet_bosser_laser);
			p3.direction =  point_direction(x, y, targetX, targetY) + 20;
			p3.image_angle = p3.direction;
			p3.ori = 1;
		}
		if (attackTimer > 230) {
			attackTimer = 0;
			phase = 0;
		}
		break;
		
	case 3: // split ground than fire
		attackTimer++;
		if (attackTimer == 1) {
			for (var i = 0; i < instance_number(o_boundries); i++) {
				var bound = instance_find(o_boundries, i);
				bound.returning = false;
			
				bound.hspeed = 0.5;
				if (bound.left) {
					bound.hspeed = -bound.hspeed;
				}
				
				bound.vspeed = 0.24;
				if (bound.top) {
					bound.vspeed = -bound.vspeed;
				}	
			}
		}
		
		if (attackTimer == 30) {
			for (var i = 0; i < instance_number(o_boundries); i++) {
				var bound = instance_find(o_boundries, i);
				bound.speed = 0;
			}
			
		}
		
		if (attackTimer >= 40 && attackTimer <= 250) {
			attack_flower(5, 8, 2, o_bullet_spinner)
			attack_spiral(10, 80, 0, o_bullet_bosser_laser);
		}
		if (attackTimer == 270) {
			for (var i = 0; i < instance_number(o_boundries); i++) {
				var bound = instance_find(o_boundries, i);
				bound.returning = true;
			}
		}
		if (attackTimer >= 350) {
			phase = 0;
		}
		break;
		
	case 4: // flail, my love
		attackTimer++;
		if (attackTimer == 1) {
			instance_create_layer(x, y, "Instances", o_bullet_bosser_flail);
		}
		
		speed = moveSpeed * 0.4;
		
		var _dir = point_direction(x, y, xstart, ystart);
		var _diff = angle_difference(_dir, direction);
		direction += _diff * 0.1;
		if (irandom(7) == 0) {
			direction += _diff * 0.5;
		}
		image_angle = direction;
		
		if (distance_to_point(xstart, ystart) < 10) {
			xstart = view_wport[0] / 2 - choose(-200, 200);
			ystart = view_hport[0] * 0.75;
			
		}
		
		if (attackTimer == 400) {
			with (o_bullet_bosser_flail) {
				retract = true;
			}
		}
		if (attackTimer == 440) {
			phase = 0;
		}
		break;
		
	case 5:
		attackTimer++;
		if (attackTimer == 1) {
			xstart = view_wport[0] / 2;
			ystart = view_hport[0] / 2 - 50;
			speed = moveSpeed;
			for (var i = 0; i < instance_number(o_boundries); i++) {
				var bound = instance_find(o_boundries, i);
				bound.returning = false;
			
				bound.hspeed = 0.5;
				if (bound.left) {
					bound.hspeed = -bound.hspeed;
				}
				
			}
		}
		if (attackTimer == 20) {
			for (var i = 0; i < instance_number(o_boundries); i++) {
				var bound = instance_find(o_boundries, i);
				bound.speed = 0;
			}
		}
		if (point_distance(x, y, xstart, ystart) < 6) {
			speed = 0;
			drawIllusion = true;
			if (attackTimer <= 370) {
				attack_spiral(5, 180, 2, o_bullet_exploder, -90);
				if (attackTimer mod 90 == 0 && attackTimer > 60) {
					var p1 = instance_create_layer(view_wport[0] / 2 - 200, view_hport[0] / 2, "Instances", o_bullet_seeker);
					p1.direction = point_direction(view_wport[0] / 2 - 200, view_hport[0] / 2, o_player.x, o_player.y);
					p1.speed = 3;
				
					var p2 = instance_create_layer(view_wport[0] / 2 + 200, view_hport[0] / 2, "Instances", o_bullet_seeker);
					p2.direction = point_direction(view_wport[0] / 2 + 200, view_hport[0] / 2, o_player.x, o_player.y);
					p2.speed = 3;
					/*
					var p1 = instance_create_layer(view_wport[0] / 2 - 200, view_hport[0] / 2, "Instances", o_bullet_laser_travel)
					p1.direction = point_direction(view_wport[0] / 2 - 200, view_hport[0] / 2, o_player.x, o_player.y);
					p1.speed = 3;
					p1.mult = 2.5;
				
					var p2 = instance_create_layer(view_wport[0] / 2 - 200, view_hport[0] / 2, "Instances", o_bullet_laser_travel)
					p2.direction = point_direction(view_wport[0] / 2 - 200, view_hport[0] / 2, o_player.x, o_player.y);
					p2.speed = 3;
					p2.mult = -2.5;
				
					var p3 = instance_create_layer(view_wport[0] / 2 + 200, view_hport[0] / 2, "Instances", o_bullet_laser_travel)
					p3.direction = point_direction(view_wport[0] / 2 + 200, view_hport[0] / 2, o_player.x, o_player.y);
					p3.speed = 3;
					p3.mult = 2.5;
				
					var p4 = instance_create_layer(view_wport[0] / 2 + 200, view_hport[0] / 2, "Instances", o_bullet_laser_travel)
					p4.direction = point_direction(view_wport[0] / 2 + 200, view_hport[0] / 2, o_player.x, o_player.y);
					p4.speed = 3;
					p4.mult = -2.5;
					*/
				}
			}
		}
		else {
			var _dir = point_direction(x, y, xstart, ystart);
			var _diff = angle_difference(_dir, direction);
			direction += _diff * 0.1;
			if (irandom(7) == 0) {
				direction += _diff * 0.5;
			}
		}
		
		if (attackTimer == 410) {
			for (var i = 0; i < instance_number(o_boundries); i++) {
				var bound = instance_find(o_boundries, i);
				bound.returning = true;
			}
		}
		if (attackTimer >= 450) {
			phase = 0;
		}
		break;
}