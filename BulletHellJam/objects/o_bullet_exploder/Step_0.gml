/// @description 

// Inherit the parent event
event_inherited();

projDir += 3;
if (timeLeft mod 60 == 0) {
	for (var i = 0; i < 6; i++) {
		var dir = projDir + ((360 / 6) * i);
		var p = instance_create_layer(x+lengthdir_x(16, dir), y+lengthdir_y(16, dir), "Instances", o_bullet_fireball);
		p.direction = point_direction(x, y, x+lengthdir_x(16, dir), y+lengthdir_y(16, dir));
		p.speed = 3;
	}
}
