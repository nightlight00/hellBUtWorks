/// @description 

// Inherit the parent event
event_inherited();

for (var i = 0; i < 6; i++) {
	var dir = projDir + ((360 / 6) * i);
	var c = make_color_rgb(224, 115, 60); // ($E0733C);
	draw_line_color(x+lengthdir_x(20, dir), y+lengthdir_y(20,dir),x+lengthdir_x(36, dir), 
		y+lengthdir_y(36,dir), c, c);
	draw_sprite_ext(bullet_aa, 0, x+lengthdir_x(20, dir), y+lengthdir_y(20,dir), 1, 1, dir+90,c_white, 1);
}