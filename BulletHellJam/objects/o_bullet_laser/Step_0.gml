/// @description 

// Inherit the parent event
event_inherited();

timeUntilActivation--;
if (timeUntilActivation <= 0) {
	canDealDamage = true;
	sprite_index = hell_weapon_shoot_anim;
}
if (timeLeft < 30) {
	image_alpha -= 1 / 35;
}