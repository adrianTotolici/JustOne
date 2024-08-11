function scr_player_control(){

	var travel_x=0;
	var travel_y=0;
	
	if (keyboard_check(ord("W"))) {
		sprite_index=anim_walk_up;
		travel_y=-20;
	} else if (keyboard_check(ord("S"))) {
		sprite_index=anim_walk_down;
		travel_y=+20;
	}
	if (keyboard_check(ord("A"))) {
		sprite_index=anim_walk_left;
		travel_x=-20;
	}
	else if (keyboard_check(ord("D"))) {
		sprite_index=anim_walk_right;
		travel_x=+20;
	}
	if (keyboard_check(vk_nokey)){
		x=x+travel_x;
		y=y+travel_y;
		sprite_index=anim_idle;
	}
	mp_potential_step(x+travel_x,y+travel_y,my_speed,true);
}
