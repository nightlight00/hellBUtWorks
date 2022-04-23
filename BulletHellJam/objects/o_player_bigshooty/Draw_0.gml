
draw_self();

for (var i = 0; i < afterimageAmount; i++)
{
	draw_sprite_ext(sprite_index, image_index, afterimage_x[i], afterimage_y[i], 
		image_xscale, image_yscale, image_angle, image_blend, image_alpha - ((1 / afterimageAmount) * i));
}
