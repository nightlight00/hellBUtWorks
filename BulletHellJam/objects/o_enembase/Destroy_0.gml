/// @description 

var curValue = 0;
while (curValue < coinValue) {
	if (global.player_level > 8 && irandom(6) == 0 && curValue < (coinValue - 4)) {
		var c = instance_create_layer(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), "Instances", o_coin);
		c.speed = random_range(0.5, 0.8);
		c.vspeed -= 1;
		c.direction = random(360);
		c.isGem = true;
		curValue += 4;
	}
	else {
		var c = instance_create_layer(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), "Instances", o_coin);
		c.speed = random_range(0.5, 0.8);
		c.vspeed -= 1;
		c.direction = random(360);
		curValue++;
	}
}

var s = instance_create_layer(x, y, "Instances", o_score_popup);
switch (dangerlevel) {
	default: // d level 1
		s.sprite_index = score_2500;
		global.player_score += 2500;
		break;
	case 2: // d level 1
		s.sprite_index = score_5000;
		global.player_score += 5000;
		break;
	case 3: // d level 1
		s.sprite_index = score_7500;
		global.player_score += 7500;
		break;
	case 666:
		s.sprite_index = score_10000;
		global.player_score += 10000;
		break;
}
