
draw_set_halign(fa_center);

draw_text(view_wport[0] * 0.8, 20, global.player_score);
draw_text(view_wport[0] * 0.8, 40, global.player_level);


var s = global.gui_scale;
if (room == rm_base) {
	draw_text_transformed((view_wport[0] / 2 - 250) * s, view_hport[0] - (70)*s, "HP", s, s, 0);
	draw_text(view_wport[0] / 2 - 250, view_hport[0] - 55, string((getHealthCur / getHealthMax) * 100)+"%");
	draw_text(view_wport[0] / 2 + 250, view_hport[0] - 70, "SPECIAL");
	draw_text(view_wport[0] / 2 + 250, view_hport[0] - 55, string(ceil(getSpecCur / getSpecMax * 100)) + "%")
}

if (pause) {
	draw_sprite_ext(spr_alpha, 0, 0, 0, view_wport[0] / 8 * s, view_hport[0] / 8 * s, 0, c_black, 0.3);
	draw_text_transformed((view_wport[0] / 2) * s, (view_hport[0] / 2 - 50) * s, "PAUSED", 2*s, 2*s, 0);
	
	for (var i = 0; i < op_length; i++) {
		var _c = c_white;
		if pos == i {_c = c_yellow}
		draw_text_color(view_wport[0] / 2, view_hport[0] / 2 - 20 + (15 * i),  option[menu_level, i], _c, _c, _c, _c, 1);
	}
}

draw_set_halign(fa_left);

draw_sprite_ext(crosshairStyle, 0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0), 2, 2, 0, c_white, 0.8);