
#region Collision

immuneCur--;
if (collision_point(x, y, o_bullet_base, true, true)) 
{
	var p = collision_point(x, y, o_bullet_base, true, true);
	
	if (p.canDealDamage) {
		
		if (immuneCur < 0) {
			lifeCur -= p.damage;
			immuneCur = immuneReset;
		//	instance_create_layer(x, y, "Instances", o_bulletblast);
		}
	
		p.penetrate--;
		if (p.penetrate == 0) {
			instance_destroy(p);
		}
	}
}
else if (collision_circle(x, y, 20, o_bullet_base, true, true)) {
	grazeCur += 0.12;
}

#endregion

#region Movement

var _left = keyboard_check(ord("A")) || keyboard_check(vk_left); 
var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var _up = keyboard_check(ord("W")) || keyboard_check(vk_up);
var _down = keyboard_check(ord("S")) || keyboard_check(vk_down); 
hspeed = (_right - _left) * maxSpeed;
vspeed = (_down - _up) * maxSpeed;
if (!collision_point(x+hspeed, y, o_boundries, true, true)) {
	hspeed = 0;
}
if (!collision_point(x, y+(vspeed/3), o_boundries, true, true)) {
	vspeed = 0;
}
var bound = instance_nearest(x, y, o_boundries);
vspeed += bound.vspeed;
hspeed += bound.hspeed;
/*
if (bound.returning) {
	speed += bound.speed;
}
else {
	speed -= bound.speed;
}
*/
if (!collision_point(x, y, o_boundries, true, true)) {
	move_towards_point(bound.x, bound.y, 2);
}

#endregion

#region Attacking

if (timeSinceLastShot > 0) {
	maxSpeed = 2.2;
}
else {
	maxSpeed = 3.5;
}

if (shootCooldown < 0) {
	
	if (mouse_check_button(mb_left)) {	
		var shoot = o_player_shooty, spd = 7, cld = 7;
		if (specialActive) {
			shoot = o_player_shooty2;
			spd = 9;
			cld = 5;
		}
		
		var dir = point_direction(x, y, mouse_x, mouse_y);
		if (autoAim > 0) {
			var dist = 80 + ((autoAim - 1) * 50);
			for (var ee = 0; ee < instance_number(o_enembase); ee++) {
				var e = instance_find(o_enembase, ee);
				if (point_distance(mouse_x, mouse_y, e.x, e.y) < dist) {
					dist = point_distance(mouse_x, mouse_y, e.x, e.y);
					dir = point_direction(x, y, e.x+(e.hspeed*20), e.y+(e.vspeed*20));
				}
			}
		}
		
	    var p = instance_create_layer(x-8, y, "Instances", shoot);
		p.direction = dir;
		p.speed = spd;
		p.image_angle = p.direction;
	
		var p = instance_create_layer(x+8, y, "Instances", shoot);
		p.direction = dir;
		p.speed = spd;
		p.image_angle = p.direction;
	
		shootCooldown = cld;
		timeSinceLastShot = 15;
	}
}

shootCooldown--;
timeSinceLastShot--;
specialTimer--;

if (specialActive) {
	grazeCur -= 0.4;
	if (grazeCur <= 0) {
		specialActive = false;
		grazeCur = 0;
	}
}

if (keyboard_check_pressed(ord("E"))) {
	if (grazeCur >= grazeMax) {
	//	grazeCur = 0;
		specialActive = true;
		specialTimer = 450;
		lifeCur += 5;
		if (lifeCur > lifeMax) {
			lifeCur = lifeMax;
		}
	}
}

if (grazeCur > grazeMax) {
	grazeCur = grazeMax;
}

#endregion
