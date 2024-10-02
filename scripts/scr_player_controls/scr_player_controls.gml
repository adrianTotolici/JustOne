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
		if (instance_position(mouse_x, mouse_y, obj_creature_parent)){
			var _creatures = instance_position(mouse_x, mouse_y, obj_creature_parent);
			if (_creatures.x >= x-10) {
				image_xscale=-1;
				state=PLAYER_STATE.ATTACK;
				sprite_index=anim_harvest;
			} else if (_creatures.x <= x+10) {
				image_xscale=1;
				state=PLAYER_STATE.ATTACK;
				sprite_index=anim_harvest;
			}
		}
		if (instance_position(mouse_x, mouse_y, obj_par_buildings)){
			var _building = instance_position(mouse_x, mouse_y, obj_grass_house);
			player_instance=instance_find(obj_you,0);
			if (_building.x >= x-10) {
				image_xscale=-1;
				state=PLAYER_STATE.SLEEP;	
				player_instance.visible=false;
				_building.sprite_index=spr_grass_house_sleep;
				obj_you.building_instance_used=_building;
			} else if (_building.x <= x+10) {
				image_xscale=1;
				state=PLAYER_STATE.SLEEP;
				object_set_visible(obj_you,false);
				player_instance.visible=false;
				_building.sprite_index=spr_grass_house_sleep;
				obj_you.building_instance_used=_building;
			}
		}
	}
	
	if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
		scr_select_draw_armor();
		sprite_index=anim_walk_up;
		_travel_y=-20;
	} else if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
		scr_select_draw_armor();
		sprite_index=anim_walk_down;
		_travel_y=+20;
	}
	if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
		image_xscale = 1;
		scr_select_draw_armor();
		sprite_index=anim_walk_side
		_travel_x=-20;
	}
	else if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
		image_xscale = -1;
		scr_select_draw_armor();
		sprite_index=anim_walk_side
		_travel_x=+20;
	}
	if (keyboard_check(vk_nokey)){
		scr_select_draw_armor();
		x=x+_travel_x;
		y=y+_travel_y;
		sprite_index=anim_idle;
	}
	switch (room){
		case rm_world_u1:
			tiles_available=tilemap_get_at_pixel(global.back_tiles_underground,x+_travel_x,y+_travel_y);
			if (tiles_available==1 || tiles_available==2){
				mp_linear_step(x+_travel_x,y+_travel_y,my_speed,false);
			}
			break;
		default:
			tiles_available=tilemap_get_at_pixel(global.back_tiles,x+_travel_x,y+_travel_y);
			break;
	}

}
