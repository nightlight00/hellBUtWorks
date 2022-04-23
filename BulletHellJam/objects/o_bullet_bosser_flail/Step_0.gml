/// @description 
timeLeft--;
if (timeLeft < 0) {
	instance_destroy();
}

afterimage_x[0] = x;
afterimage_y[0] = y;
afterimage_a[0] = image_angle;
for (var i = afterimageAmount; i > 0; i--) 
{
	afterimage_x[i] = afterimage_x[i - 1];
	afterimage_y[i] = afterimage_y[i - 1];
	afterimage_a[i] = afterimage_a[i - 1];
}


attackTimer++;
image_xscale = (distance / 148) * 1.5;
image_yscale = image_xscale

image_angle += 6;
if (!retract) {
	distance += 2;
	if (distance >= 148) {
		distance = 148;
	}
	attackTimer++;
	if (attackTimer mod 10 == 0 && distance > 100) {
		for (var i = 0; i < 3; i++) {
			var p = instance_create_layer(x, y, "Instances", o_bullet_bosser_flailspikers);
			p.speed = 3;
			p.direction = image_angle - 35 + (35 * i);
			p.image_angle = p.direction;
		}
	}
}
else {
	distance -= 2;
	if (distance < 4) {
		instance_destroy();
	}
	image_alpha = 0.5;
	canDealDamage = false;
}

x = o_BOSS.x + lengthdir_x(distance, image_angle);
y = o_BOSS.y + lengthdir_y(distance, image_angle);

timeLeft = 5;