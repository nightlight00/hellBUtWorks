attackTimer = 0;
phase = 0;
orientation = 1;
if (x > view_wport[0] / 2) {
	orientation = -1;
}
moveSpeed = random_range(moveSpeed * 0.95, moveSpeed * 1.05);
speed = moveSpeed;

timeSinceHit = 0;

coinValue = 15 + 5 * (dangerlevel - 1) + global.player_level;