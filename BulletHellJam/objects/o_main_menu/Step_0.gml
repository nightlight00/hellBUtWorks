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
	// main menu part
	case 0: 
		if (Enter_event) {
			switch (pos) {
				case 1:
					o_infoHandler.bossTest = true;
				case 0:
					room = rm_base;
					break;
				case 2:
					menu_level = 1;
					break;
			}
		}
		break;
		
	case 1:
		switch (pos) {
			case 0: 
			
				break;
			case 2:
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
					switch (autoAim) 
					{
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
					o_infoHandler.autoAim = autoAim;
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
		break;
	
}
if _sml != menu_level {pos = 0}

op_length = array_length(option[menu_level]);