if ((distance_to_object(o_player_shooty) < 16 || distance_to_object(o_player_shooty2) < 16) && sprite_index = candle) {
	sprite_index = candle_out;
	lit = false;
	timeSinceLit = 120;
}
timeSinceLit--;
if (timeSinceLit <= 0 && !lit) {
	sprite_index = candle_reignite;
	lit = true;
}