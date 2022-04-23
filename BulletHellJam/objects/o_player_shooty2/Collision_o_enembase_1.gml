
other.currentHp -= 0.75;
other.timeSinceHit = 4;
for (var i = 0; i < 6; i++) {
	var d = instance_create_layer(x, y, "Dusts", o_dust);
	d.sprite_index = s_player_weap_dust;
	d.speed = 5;
	d.direction = point_direction(0, 0, hspeed, vspeed);
}

instance_destroy(self);
