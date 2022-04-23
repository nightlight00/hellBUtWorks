if (image_speed != 0 && timer mod 4 == 0) {
	image_index++;
	if (irandom(4) == 0) {
		image_index++;
	}
}

timer++;