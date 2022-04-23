if (returning) {
	move_towards_point(xstart, ystart, 0.2);
	if (point_distance(x, y, xstart, ystart) < 2) {
		x = xstart;
		y = ystart;
		returning = false;
		speed = 0;
	}
}