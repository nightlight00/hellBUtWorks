/// @description 
if (immuneCur < 0) {
	grazeCur += 0.15 + (0.08 * other.damage);
}
if (grazeCur > grazeMax) {
	grazeCur = grazeMax;
}
