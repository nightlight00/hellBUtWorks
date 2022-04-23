
if display_get_width()!=window_get_width() {
    // resize window to display
    window_set_size(display_get_width(),display_get_height());
	global.gui_scale = window_get_width() / 960;
}

if (!pause && room == rm_base) {
	getHealthCur = o_player.lifeCur;
	getHealthMax = o_player.lifeMax;
	getSpecCur = o_player.grazeCur;
	getSpecMax = o_player.grazeMax;
}
if (pause) {
/// @description 
	up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	Enter_event = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"));

	//store number of options in current menu
	op_length = array_length(option[menu_level]);

	//move through menu
	pos += down_key - up_key;
	if (pos >= op_length) {pos = 0}
	if (pos < 0) {pos = op_length-1}

	var _sml = menu_level;
	switch (menu_level) {
		case 0: 
			switch (pos) {
				case 0:
					if (Enter_event) {				
						pause = false;
						instance_activate_all();
						if (surface_exists(pauseSurf)) {
							surface_free(pauseSurf);
						}
						if (buffer_exists(pauseSurfBuffer)) {
							buffer_delete(pauseSurfBuffer);
						}
						
						o_player.autoAim = autoAim;
					}
					break;
				
				case 1:
					if (Enter_event) {
						menu_level = 1;
					}
					break;
					
				case 2:
					if (Enter_event) {
						pause = false;
						instance_activate_all();
						if (surface_exists(pauseSurf)) {
							surface_free(pauseSurf);
						}
						if (buffer_exists(pauseSurfBuffer)) {
							buffer_delete(pauseSurfBuffer);
						}
						room = rm_mainmenu;
					}
					break;
			}
			break;
		case 1:
			switch (pos) {
				case 1:
					if (Enter_event) {
						switch (o_infoHandler.crosshairStyle) 
						{
							case hell_crosshair_1:
								o_infoHandler.crosshairStyle = hell_crosshair_2;
								option[1, 2] = "Crosshair style : 2";
								break;
							
							case hell_crosshair_2:
								o_infoHandler.crosshairStyle= hell_crosshair_3;
								option[1, 2] = "Crosshair style : 3";
								break;
							
							case hell_crosshair_3:
								o_infoHandler.crosshairStyle= hell_crosshair_1;
								option[1, 2] = "Crosshair style : 1";
								break;
						}
					}
					break;
				case 2:
					if (Enter_event) {
						autoAim++;
						if (autoAim > 3) {
							autoAim = 0;
						}
						switch (autoAim) {
							case 0:
								option[1, 2] = "Aim Assist : none";
								break;
							case 1:
								option[1, 2] = "Aim Assist : weak";
								break;
							case 2:
								option[1, 2] = "Aim Assist : moderate";
								break;
							case 3:
								option[1, 2] = "Aim Assist : strong";
								break;
						}
					}
					break;
				case 3:
					if (Enter_event) {
						switch (global.sfx) {
							case 1:
								global.sfx = 0.7;
								option[1, 3] = "Special Effects : moderate";
								break;
							case 0.7: 
								global.sfx = 0.4;
								option[1, 3] = "Special Effects : low";
								break;
							case 0.4:
								global.sfx = 0;
								option[1, 3] = "Special Effects : none";
								break
							case 0: 
								global.sfx = 1;
								option[1, 3] = "Special Effects : high";
								break;
						}
						
					}
					break;
				case 4:
					if (Enter_event) {
						menu_level = 0;
					}
					break;
			break;
		}
	}
	if _sml != menu_level {pos = 0}
	
	op_length = array_length(option[menu_level]);
}

multTimer++;

if (keyboard_check_pressed(vk_numpad0)) {
	global.player_level--;
}
if (keyboard_check_pressed(vk_numpad9)) {
	global.player_level++;
}