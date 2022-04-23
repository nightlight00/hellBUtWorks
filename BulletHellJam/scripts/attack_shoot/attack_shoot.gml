// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_shoot(accuracy = 5, velocity = 4, bulletType = o_bullet_pellet, dir = -1){

	var p = instance_create_layer(x, y, "Instances", bulletType);
	p.speed = velocity;
	if (dir == -1) {
		p.direction = point_direction(x, y, o_player.x, o_player.y) + random_range(-accuracy, accuracy);
		p.image_angle = p.direction;
	}
	else {
		p.direction = dir + random_range(-accuracy, accuracy);
		p.image_angle = p.direction;
	}
}