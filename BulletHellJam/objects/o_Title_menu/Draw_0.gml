//draw options
draw_set_font(f_font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// draw title background
draw_sprite_ext(s_titlescreen, 0, 0, 0, 2, 2, 0, c_white, 1);


//dynamically get width adn height of menu
var _new_width = 0;
for (var i = 0; i < op_length; i++)
{
	var _op_w = string_width(option[menu_level, i])
	_new_width = max(_new_width, _op_w);
}
width = _new_width + op_border*2;

height = op_border*2 + string_height(option[menu_level, 0]) + (op_length-1)*op_space;


//draw menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, .75);

for (var i = 0; i < op_length; i++)
{
	var _c = c_white;
	if pos == i {_c = c_yellow}
	draw_text_color(x + op_border, y + op_border + op_space * i , option[menu_level, i], _c, _c, _c, _c, 1);
}

//draw controls
_new_width = 0;
for (var i = 0; i < 4; i++)
{
	var _op_w = string_width(control[i]);
	_new_width = max(_new_width, _op_w);
}
width2 = _new_width + op_border*2;

height2 = op_border*2 + string_height(control[0]) + (3)*op_space;

draw_sprite_ext(sprite_index, image_index, x, y + (height*1.2), width2/sprite_width, height2/sprite_height, 0, c_white, .75);

for (var i = 0; i < 4; i++)
{
	var _c = c_white;
	draw_text_color(x + op_border, y + (height*1.2) + op_border + op_space * i , control[i], _c, _c, _c, _c, 1);
}

if (global.enemyLevel > 3) {
var _c = c_black;
draw_text_color(10, display_get_gui_height()-20, "U U D _ L _ _ R A B", _c, _c, _c, _c, 0.28);
}