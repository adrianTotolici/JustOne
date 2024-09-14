function scr_player_control(){

	var _travel_x=0;
	var _travel_y=0;

	if (mouse_check_button(mb_left)){
		if (instance_position(mouse_x, mouse_y, obj_par_resource)){
			var _resources = instance_position(mouse_x, mouse_y, obj_par_resource);
			if( _resources.tool_required== false || (equipped!=noone && equipped.type==_resources.required)){
				if (_resources.x >= x-10) {
					image_xscale=-1;
					state=PLAYER_STATE.HARVEST;
					sprite_index=anim_harvest;
				} else if (_resources.x <= x+10) {
					image_xscale=1;
					state=PLAYER_STATE.HARVEST;
					sprite_index=anim_harvest;
				}
			}
		}
	}
	
	if (keyboard_check(ord("W"))) {
		sprite_index=anim_walk_up;
		_travel_y=-20;
	} else if (keyboard_check(ord("S"))) {
		sprite_index=anim_walk_down;
		_travel_y=+20;
	}
	if (keyboard_check(ord("A"))) {
		image_xscale = 1;
		sprite_index=anim_walk_side
		_travel_x=-20;
	}
	else if (keyboard_check(ord("D"))) {
		image_xscale = -1;
		sprite_index=anim_walk_side
		_travel_x=+20;
	}
	if (keyboard_check(vk_nokey)){
		x=x+_travel_x;
		y=y+_travel_y;
		sprite_index=anim_idle;
	}
	mp_linear_step(x+_travel_x,y+_travel_y,my_speed,false);
}
