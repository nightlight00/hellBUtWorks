
other.timeSinceHit = 5;
other.currentHp -= 0.77;
for (var i = 0; i < 5; i++) {
	var d = instance_create_layer(x, y, "Dusts", o_dust);
	d.sprite_index = s_player_weap_dust;
	d.speed = 5;
	d.direction = point_direction(0, 0, hspeed, vspeed);
}

instance_destroy(self);
