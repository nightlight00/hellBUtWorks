/// @description 

// Inherit the parent event
event_inherited();


var d = instance_create_layer(random_range(bbox_left, bbox_right), random_range(bbox_bottom, bbox_top), "Dusts", o_dust);
d.sprite_index = s_fire_travel_dust;
d.speed = -1.6;
d.direction = point_direction(0, 0, hspeed, vspeed);
d.image_xscale = 1.5;
d.image_alpha = 0.9;


seekTimer--;
if (seekTimer > 0) {
	var _dir = point_direction(x, y, o_player.x, o_player.y);
	var _diff = angle_difference(_dir, direction);
	direction += _diff * 0.03;
}

image_angle = direction;
