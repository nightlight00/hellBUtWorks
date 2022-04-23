/// @description 

// Inherit the parent event
event_inherited();

t = (t + increment) mod 360;
shift = amplitude * dsin(t);
 
//clone the movement from the object's speed and direction
xx += hspeed;
yy += vspeed;
 
image_angle = darctan(dcos(t));
 
//apply the shift
x = xx + (lengthdir_x(shift, direction + 90) * mult);
y = yy + lengthdir_y(shift, direction + 90) * mult;
