/// @description 

// Inherit the parent event
event_inherited();

direction += 0.3 * ori;
image_angle = direction;

timeUntilActivation--;
if (timeUntilActivation <= 0) {
	canDealDamage = true;
	sprite_index = hell_weapon_shoot_anim;
}
if (timeLeft < 30) {
	image_alpha -= 1 / 35;
}
