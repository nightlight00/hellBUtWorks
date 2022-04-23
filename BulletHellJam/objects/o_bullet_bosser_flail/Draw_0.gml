/// @description 

var dist = point_distance(o_BOSS.x, o_BOSS.y, x, y);
var dir = point_direction(o_BOSS.x, o_BOSS.y, x, y);

var num = dist / sprite_get_width(bullet_flailchain);
var gap = dist/num;

for (var i = 0; i < num; i++) {
	draw_sprite_ext(bullet_flailchain, 0, o_BOSS.x+lengthdir_x(i*gap,dir), o_BOSS.y+lengthdir_y(i*gap,dir), 1, 1, dir, c_white, image_alpha / 2);
}
//draw_sprite_ext(bullet_flailchain, 0, o_BOSS.x, o_BOSS.y, lengthdir_x(dist, dir) / 12, 1, point_direction(x, y, o_BOSS.x, o_BOSS.y), c_white, 1);


// Inherit the parent event
event_inherited();

