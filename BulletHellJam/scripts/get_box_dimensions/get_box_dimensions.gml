// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_box_dimension_x(){	
	var box = instance_find(o_boundries_enem, 0);
	var pos = random_range(box.bbox_left + 24, box.bbox_right - 24);
	while (distance_to_point(pos, y) < 64) {
		pos = random_range(box.bbox_left + 24, box.bbox_right - 24);
	}
	return pos;
}

function get_box_dimension_y(){	
	var box = instance_find(o_boundries_enem, 0);
	var pos = random_range(box.bbox_top + 16, box.bbox_bottom - 16);
	while (distance_to_point(pos, y) < 48) {
		pos = random_range(box.bbox_top + 16, box.bbox_bottom - 16);
	}
	return pos;
}