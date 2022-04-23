
// add dust for cool look
for (var i = 0; i < 1; i++) {
	createDust(8, random_range(-192, room_width), -16);
}


//get inputs
up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
Enter_event = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"));

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move through menu
pos += down_key - up_key;
if (pos >= op_length) {pos = 0}
if (pos < 0) {pos = op_length-1}
if (lastpos != pos) {
	playSound(snd_menuclick, 0, false, x, y, 1, false);
	lastpos = pos;
}

safeTime--;
// play select sound on enter event
if (Enter_event) {
	if (safeTime > 0) {
		return;
	}
	playSound(snd_menuselect, 0, false, x, y, 1, false);
}

//using the options
var _sml = menu_level;
switch(menu_level)
{
	//pause menu
	case 0:
	if (Enter_event) {
		switch(pos)
		{
			//this is start game
			case 0:	
			// music
			audio_stop_sound(Calyx_Title_Theme);
			var mus = audio_play_sound(Calyx_Level_Track, 4, true);
			audio_sound_gain(mus, 0, 0);
			audio_sound_gain(mus, 1, 10000);
			// starts actual game
			room_goto_next();	
			break;
			
			case 1:
			// resets enemy level
			if(file_exists("Savedgame.save"))
			{
				file_delete("Savedgame.save")
			}
			show_debug_message("Game was reset");
			// music
			audio_stop_sound(Calyx_Title_Theme);
			var mus = audio_play_sound(Calyx_Level_Track, 4, true);
			audio_sound_gain(mus, 0, 0);
			audio_sound_gain(mus, 1, 10000);
			// starts actual game
			room_goto_next();	
			break;
			
				
			case -69:
			audio_stop_sound(Calyx_Title_Theme);
			var mus = audio_play_sound(Calyx_Level_Track, 4, true);
			audio_sound_gain(mus, 0, 0);
			audio_sound_gain(mus, 1, 10000);
			room_goto(rm_Boss);
			break;
				
			//settings
			case 2: 
			menu_level = 1;	
			break;
				
			case 5:
			room_goto(rm_end);
			//menu_level = 2;
			break;
				
			//quit game
			case 3:	
			game_end();	
			break;
		}
	}
	break;
		
	case 1:
	switch(pos)
	{
		//window Size
		case 0:
		if (Enter_event) {
			window_set_fullscreen(!window_get_fullscreen());
			if (window_get_fullscreen()) {
				option[1, 0] = "Window Size : Fullscreen";
			}
			else {
				option[1, 0] = "Window Size : Windowed";
			}
		}
		break;
			
		//Controls
		case 1:
		var decrease = keyboard_check(ord("A")) || keyboard_check(vk_left);
		var increase = keyboard_check(ord("D")) || keyboard_check(vk_right);
			
		var actual = decrease - increase;
		global.masterVolume -= (actual / 100);
		global.masterVolume = clamp(global.masterVolume, 0, 1);
			
		option[1, 1] = "Master Volume : " + string(round(global.masterVolume * 100)) + "%";
		audio_set_master_gain(0, global.masterVolume);
		//Change Controls code here
		break;
			
		// cursor colour (cheated it lol)
		case 2:
		var decrease = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
		var increase = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
			
		var actual = decrease - increase, colour;
		cursor += actual;
		if (cursor < 0) { cursor = 5; } 
		if (cursor > 5) { cursor = 0; }
			
		switch (cursor) {
			case 0: cursor_sprite = s_cursor; colour = "white"; break;
			case 1: cursor_sprite = s_cursor_r; colour = "red"; break;
			case 2: cursor_sprite = s_cursor_b; colour = "blue"; break;
			case 3: cursor_sprite = s_cursor_g; colour = "green"; break;
			case 4: cursor_sprite = s_cursor_y; colour = "yellow"; break;
			case 5: cursor_sprite = s_cursor_p; colour = "purple"; break;
		}
			
		option[1, 2] = "Cursor Colour : " + colour;
		break;
			
		//back
		case 3:
		if (Enter_event) {
			menu_level = 0;
		}
		break;
	}
	break;
		
	case 2: // creator menu
		if (Enter_event) {
			switch (pos) {
				case 0:
					url_open("https://nightlight00.itch.io");
					break;
					
				case 1: 
					url_open("https://motion-dev.itch.io");
					break;
					
				case 2:
					url_open("https://mystro1234.itch.io");
					break;
					
				case 3:
					url_open("https://pbandana.itch.io");
					break;
					
				case 4:
					menu_level = 0;
					break;
			}
		}
		break;
}
if _sml != menu_level {pos = 0}
	
	//correct option length
op_length = array_length(option[menu_level]);



