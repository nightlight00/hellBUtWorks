timeLeft = 100;
switch (global.sfx) {
	case 1:
		// highest, nothing happens
		break;
	case 0:
		instance_destroy();
		break;
	case 0.7:
	// 30% chance to be destroyed
		if (irandom(10) <= 3) {
			instance_destroy();
		}
		break;
	case 0.4:
	// 60% chance to be destroyed
		if (irandom(10) <= 6) {
			instance_destroy();
		}
		break;
}
alarm[0] = 1;