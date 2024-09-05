// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_armor(){
	var _owner = obj_you;
	var _img=ceil(_owner.image_index)-1;
	var _scale_equipment=0.8;
	x=_owner.x;
	y=_owner.y;
	switch(_owner.sprite_index){
		case (obj_you.anim_idle):
			if (obj_you.head_equipment != noone){
				equip_head_player_anim_idle();
			}
			if (obj_you.body_equipment != noone){
				equip_armor_player_anim_idle();
			}
			break;
		
		case obj_you.anim_walk_down:
			if (obj_you.head_equipment != noone){
				equip_head_player_anim_walk_down();
			}
			if (obj_you.body_equipment != noone){
				equip_armor_player_anim_walk_down();
			}
			break;
		
		case obj_you.anim_walk_up:
			if (obj_you.head_equipment != noone){
				equip_head_player_anim_walk_up();
			}
			if (obj_you.body_equipment != noone){
				equip_armor_player_anim_walk_up();
			}
			break;
			
		case obj_you.anim_walk_left:
			if (obj_you.head_equipment != noone){
				equip_head_player_anim_walk_left();
			}
			if (obj_you.body_equipment != noone){
				equip_armor_player_anim_walk_left(_img);
			}
			break;
			
		case obj_you.anim_walk_right:
			if (obj_you.head_equipment != noone){
				equip_head_player_anim_walk_right();
			}
			if (obj_you.body_equipment != noone){
				equip_armor_player_anim_walk_right(_img);
			}
			break;
			
		case obj_you.anim_harvest:
			if (obj_you.head_equipment != noone){
				equip_head_player_anim_walk_harvest();
			}
			if (obj_you.body_equipment != noone){
				equip_armor_player_anim_walk_harvest(_img);
			}
			break;
	}
}

// head equip
function equip_head_player_anim_idle(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			draw_sprite_ext(spr_player_stand_front_straw_hat, 0, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			break;
	}
}

function equip_head_player_anim_walk_down(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			depth = -2
			draw_sprite_ext(spr_player_stand_front_straw_hat, 0, obj_you.x+1, obj_you.y-1, 1, 1,0,c_white,1);
			break;
	}
}

function equip_head_player_anim_walk_up(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			draw_sprite_ext(spr_player_stand_front_straw_hat, 0, obj_you.x+1, obj_you.y-1, 1, 1,0,c_white,1);
			break;
	}
}

function equip_head_player_anim_walk_left(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			draw_sprite_ext(spr_player_left_straw_hat, 0, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			break;
	}
}

function equip_head_player_anim_walk_right(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			draw_sprite_ext(spr_player_left_straw_hat, 0, obj_you.x-2, obj_you.y, 1, 1,0,c_white,1);
			break;
	}
}

function equip_head_player_anim_walk_harvest(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			draw_sprite_ext(spr_player_harvest_straw_hat, 0, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			break;
	}
}
	
// armor
function equip_armor_player_anim_idle(){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			draw_sprite_ext(spr_player_front_straw_armor, 0, obj_you.x-1, obj_you.y+1, 1, 1,0,c_white,1);
			break;
	}
}

function equip_armor_player_anim_walk_down(){
	depth =-2;
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			draw_sprite_ext(spr_player_front_straw_armor, 0, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			break;
	}
}

function equip_armor_player_anim_walk_up(){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			draw_sprite_ext(spr_player_back_straw_armor, 0, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			break;
	}
}

function equip_armor_player_anim_walk_left(_img){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			if (_img==0){
				draw_sprite_ext(spr_player_left_straw_armor, 0, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			} else if (_img==1 || _img==3){
				draw_sprite_ext(spr_player_left_straw_armor, 1, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			} else if (_img==2){
				draw_sprite_ext(spr_player_left_straw_armor, 2, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			}
			break;
	}
}

function equip_armor_player_anim_walk_right(_img){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			if (_img==0){
				draw_sprite_ext(spr_player_right_straw_armor, 0, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			}else if (_img==1 || _img==3){
				draw_sprite_ext(spr_player_right_straw_armor, 1, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			}else if (_img==2){
				draw_sprite_ext(spr_player_right_straw_armor, 2, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			}
			break;
	}
}

function equip_armor_player_anim_walk_harvest(_img){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			draw_sprite_ext(spr_player_harvest_straw_armor, _img, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			break;
	}
}