returning = false;
image_speed = 0;
top = !top;
sprite_index = platform_a;
if (!top) {
	sprite_index = platform_b;
}

if (!left) {
	image_xscale = -1;
}