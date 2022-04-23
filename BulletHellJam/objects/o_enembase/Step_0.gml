
timeSinceHit--;

if (currentHp < 0) {
	instance_destroy();
}

if ((y > view_hport[0] + 32) || (y < -32) || (x < -32) || (x > view_wport[0] + 32)) {
	instance_destroy();
}

/*
attack_shoot(20, 9, 5, o_bullet_head);
/*
attack_flower(7, 2, 2, o_bullet_pellet);
attack_flower(10, 50, 2, o_bullet_seeker);
//attack_spiral(6, 3, 2);
//attack_spiral(6, 3, 2, o_bullet_pellet, -1);