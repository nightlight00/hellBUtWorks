
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