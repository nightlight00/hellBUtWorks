timeLeft--;
if (timeLeft < 0) {
	instance_destroy();
}
if (y>view_hport[0]+32||y<-32||x>view_wport[0]+32||x<-32) {
	instance_destroy();
}

afterimageAmount = ceil(afterimageAmount * global.sfx);

afterimage_x[0] = x;
afterimage_y[0] = y;
afterimage_a[0] = image_angle;
for (var i = afterimageAmount; i > 0; i--) 
{
	afterimage_x[i] = afterimage_x[i - 1];
	afterimage_y[i] = afterimage_y[i - 1];
	afterimage_a[i] = afterimage_a[i - 1];
}
