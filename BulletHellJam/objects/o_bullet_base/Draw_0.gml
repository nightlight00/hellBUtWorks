
switch (afterimageStyle) {
	default:
		for (var i = 0; i < afterimageAmount; i++)
		{
			draw_sprite_ext(sprite_index, image_index, afterimage_x[i], afterimage_y[i], 
				image_xscale, image_yscale, afterimage_a[i], image_blend, image_alpha - ((1 / afterimageAmount) * i));
		}
		break;
	case 1: // draw without alpha loss
		for (var i = 0; i < afterimageAmount; i++)
		{
			draw_sprite_ext(sprite_index, image_index, afterimage_x[i], afterimage_y[i], 
				image_xscale, image_yscale, afterimage_a[i], image_blend, image_alpha);
		}
		break;
	case 2: // draw every third time
	for (var i = 0; i < afterimageAmount; i++)
		{
			if (i mod 3 == 0) {
				draw_sprite_ext(sprite_index, image_index, afterimage_x[i], afterimage_y[i], 
					image_xscale, image_yscale, afterimage_a[i], image_blend,(image_alpha - ((1 / afterimageAmount) * i)) / 2);
			}
		}
		break;
}

draw_self();
