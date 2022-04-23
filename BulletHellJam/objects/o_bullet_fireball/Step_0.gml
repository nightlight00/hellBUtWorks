/// @description 

image_angle = direction + 90;

// Inherit the parent event
event_inherited();

if (irandom(3) == 0) {
	var d = instance_create_layer(random_range(bbox_left, bbox_right), random_range(bbox_bottom, bbox_top), "Dusts", o_dust);
	d.sprite_index = s_fire_travel_dust;
	d.speed = -1.4;
	d.direction = point_direction(0, 0, hspeed, vspeed);
	d.image_xscale = 1;
	d.image_alpha = 0.9;

}