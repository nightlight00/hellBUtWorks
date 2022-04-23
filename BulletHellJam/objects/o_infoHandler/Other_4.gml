if (room == rm_startup) {
	room = rm_mainmenu;
}
if (room == rm_mainmenu) {
	global.player_level = 0;
}
if (room == rm_base) {
	o_player.autoAim = autoAim;
	if (bossTest) {
		instance_create_layer(view_wport[0] / 2, view_hport[0] / 2, "Instances", o_BOSS);
	}
}