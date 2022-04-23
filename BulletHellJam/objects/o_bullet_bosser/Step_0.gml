/// @description 

// Inherit the parent event
event_inherited();

direction += 2.3 * ori;
image_angle = direction;
if (timeLeft < 200) {
	timeLeft = 199;
	if (distance_to_point(xstart, ystart) < 4) {
		instance_destroy();
	}
}