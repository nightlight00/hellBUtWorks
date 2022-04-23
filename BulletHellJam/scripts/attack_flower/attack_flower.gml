// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_flower(spiralAmount = 4, frequency = 5, velocity = 3, bulletType = o_bullet_pellet){
	
	if (attackTimer mod frequency == 0) {
		for (var i = 0; i < spiralAmount; i++) {
			var p = instance_create_layer(x, y, "Instances", bulletType);
			p.speed = velocity;
			p.direction = attackTimer + 90 + ((360 / spiralAmount) * i);
			p.image_angle = p.direction;
		}
		for (var i = 0; i < spiralAmount; i++) {
			var p = instance_create_layer(x, y, "Instances", bulletType);
			p.speed = velocity;
			p.direction = -attackTimer + 90 + ((360 / spiralAmount) * i);
			p.image_angle = p.direction;
		}
	}
}