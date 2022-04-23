
for (var i = 0; i < ds_list_size(hitlist); i++) {
	if (other.id = ds_list_find_value(hitlist, i)) {
		return;
	}
}

other.currentHp -= 20;
other.x += hspeed;
other.y += vspeed;

ds_list_add(hitlist, other.id);
