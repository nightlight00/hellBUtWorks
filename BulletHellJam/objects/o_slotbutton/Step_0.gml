
delay--;
if (delay <= -1000 + (25 * global.player_level)) {
	event_perform(ev_collision, o_player_shooty);
}