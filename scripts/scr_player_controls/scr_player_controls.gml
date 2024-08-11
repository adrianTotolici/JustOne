function scr_player_control(){

	var _travel_x=0;
	var _travel_y=0;
	
	if (keyboard_check(ord("W"))) {
		sprite_index=anim_walk_up;
		_travel_y=-20;
	} else if (keyboard_check(ord("S"))) {
		sprite_index=anim_walk_down;
		_travel_y=+20;
	}
	if (keyboard_check(ord("A"))) {
		sprite_index=anim_walk_left;
		_travel_x=-20;
	}
	else if (keyboard_check(ord("D"))) {
		sprite_index=anim_walk_right;
		_travel_x=+20;
	}
	if (keyboard_check(vk_nokey)){
		x=x+_travel_x;
		y=y+_travel_y;
		sprite_index=anim_idle;
	}
	mp_potential_step(x+_travel_x,y+_travel_y,my_speed,true);
}
