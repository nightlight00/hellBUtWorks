timeLeft--;
if (timeLeft < 0) {
	instance_destroy();
}

afterimage_x[0] = x;
afterimage_y[0] = y;
for (var i = afterimageAmount; i > 0; i--) 
{
	afterimage_x[i] = afterimage_x[i - 1];
	afterimage_y[i] = afterimage_y[i - 1];
}
