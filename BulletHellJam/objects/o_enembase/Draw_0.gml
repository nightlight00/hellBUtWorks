
if (timeSinceHit > 0) {
	shader_set(flash);
}

draw_self();

shader_reset();