switch (sprite_index) {
	case s_player_weap_dust: // player weapon
		image_angle += 5;
		image_alpha -= 1 / 50;
		break;
	case s_player_weap_travel_dust:
	case s_fire_travel_dust:
		image_alpha -= 1 / 30;
		break;
	case s_coin_dust:
		if (timeLeft < 26) {
			image_xscale -= 0.05;
			image_yscale = image_xscale;
		}
		break;
}
timeLeft--;
if (timeLeft < 0) {
	instance_destroy();
}