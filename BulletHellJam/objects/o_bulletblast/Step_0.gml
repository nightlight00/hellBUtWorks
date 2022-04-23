image_xscale += 0.1;
image_yscale = image_xscale;
image_alpha -= 0.045;
if (image_xscale > 3) {
	instance_destroy();
}