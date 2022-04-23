timeLeft--;
if (timeLeft < 0) {
	instance_destroy();
}

if (irandom(5) == 0) {
	var d = instance_create_layer(random_range(bbox_left, bbox_right), random_range(bbox_bottom, bbox_top), "Dusts", o_dust);
	d.sprite_index = s_player_weap_travel_dust;
	d.speed = -1;
	d.direction = point_direction(0, 0, hspeed, vspeed);
}

afterimage_x[0] = x;
afterimage_y[0] = y;
for (var i = afterimageAmount; i > 0; i--) 
{
	afterimage_x[i] = afterimage_x[i - 1];
	afterimage_y[i] = afterimage_y[i - 1];
}
