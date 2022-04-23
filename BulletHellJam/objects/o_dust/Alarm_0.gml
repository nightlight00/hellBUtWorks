/// @description 
switch (sprite_index) {
	case s_player_weap_dust: // player weapon
		timeLeft = 40;
		direction += random_range(-20, 20);
		image_angle = direction;
		image_speed = 0;
		image_xscale = random_range(0.8, 1);
		image_yscale = image_xscale;
		speed *= random_range(0.8, 1);
		break;
	case s_player_weap_travel_dust: 
	case s_fire_travel_dust:
		timeLeft = 20;
		image_xscale *= random_range(0.8, 1);
		image_yscale = image_xscale;
		image_angle = direction;
		break;
	case s_coin_dust:
		timeLeft = 40;
		image_xscale = random_range(0.8, 1.1);
		image_yscale = image_xscale;
		break;
}