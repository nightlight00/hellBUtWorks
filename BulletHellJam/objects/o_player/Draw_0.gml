
draw_circle(x, y, 20, true);

if (immuneCur > 0 && immuneCur mod 2 == 0) {
	shader_set(flash);
}

draw_self();

shader_reset();