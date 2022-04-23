if (y > view_hport[0] + 32) {
	instance_destroy();
}
if (distance_to_object(o_player) < 40) {
	var _dir = point_direction(x, y, o_player.x, o_player.y);
	var _diff = angle_difference(_dir, direction);
	direction += _diff * 0.03;
	if (distance_to_object(o_player) < 4) {
		if (isGem) {
			global.player_score += 500;
			o_player.grazeCur += 0.5;
			var s = instance_create_layer(x, y, "Instances", o_score_popup);
			s.sprite_index = score_500;
		}
		else {
			global.player_score += 100;
			o_player.grazeCur += 0.33;
			instance_create_layer(x, y, "Instances", o_score_popup);
		}
		instance_destroy();
	}
}
else {
	vspeed += 0.045;
	hspeed *= 0.98;
}
if (irandom(11) == 0) {
	var d = instance_create_layer(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), "Dusts", o_dust);
	d.sprite_index = s_coin_dust;
}
if (sprite_index == coin_anim3) {
	image_angle = point_direction(0, 0, hspeed, vspeed);
}
else {
	image_angle += hspeed;
}