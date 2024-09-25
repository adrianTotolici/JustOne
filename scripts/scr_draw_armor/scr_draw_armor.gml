// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_armor(){
	var _owner = obj_you;
	var _img=ceil(_owner.image_index)-1;
	var _scale_equipment=0.8;
	x=_owner.x;
	y=_owner.y;
	player_instance=instance_find(obj_you,0);
	if (player_instance.visible) {
		switch(_owner.sprite_index){
			case (obj_you.anim_idle):
				if (obj_you.head_equipment != noone){
					equip_head_front();
				}
				if (obj_you.body_equipment != noone){
					equip_armor_player_anim_idle();
				}
				if (obj_you.leg_equipment != noone){
					equip_legware_player_anim_idle();
				}
				if (obj_you.left_foot_equipment != noone){
					equip_footware_player_anim_idle(true, false);
				}
				if (obj_you.right_foot_equipment != noone){
					equip_footware_player_anim_idle(false, true);
				}
				break;
		
			case obj_you.anim_walk_down:
				if (obj_you.head_equipment != noone){
					equip_head_front();
				}
				if (obj_you.body_equipment != noone){
					equip_armor_player_anim_walk_down();
				}
				if (obj_you.leg_equipment != noone){
					equip_legware_player_anim_walk_down(_img);
				}
				if (obj_you.left_foot_equipment != noone){
					equip_footware_player_anim_walk_down(true, false, _img);
				}
				if (obj_you.right_foot_equipment != noone){
					equip_footware_player_anim_walk_down(false, true, _img);
				}
				break;
		
			case obj_you.anim_walk_up:
				if (obj_you.head_equipment != noone){
					equip_head_front();
				}
				if (obj_you.body_equipment != noone){
					equip_armor_player_anim_walk_up();
				}
				if (obj_you.leg_equipment != noone){
					equip_legware_player_anim_walk_up(_img);
				}
				if (obj_you.left_foot_equipment != noone){
					equip_footware_player_anim_walk_up(true, false, _img);
				}
				if (obj_you.right_foot_equipment != noone){
					equip_footware_player_anim_walk_up(false, true, _img);
				}
				break;
			
			case obj_you.anim_walk_side:
				if (obj_you.head_equipment != noone){
					equip_head_side();
				}
				if (obj_you.body_equipment != noone){
					equip_armor_player_anim_walk_side(_img);
				}
				if (obj_you.leg_equipment != noone){
					equip_legware_player_anim_walk_side(_img);
				}
				if (obj_you.left_foot_equipment != noone){
					equip_footware_player_anim_walk_side(true, false, _img);
				}
				if (obj_you.right_foot_equipment != noone){
					equip_footware_player_anim_walk_side(false, true, _img);
				}
				break;
			
			case obj_you.anim_harvest:
				if (obj_you.head_equipment != noone){
					equip_head_side();
				}
				if (obj_you.body_equipment != noone){
					equip_armor_player_anim_walk_harvest(_img);
				}
				if (obj_you.leg_equipment != noone){
					equip_legware_player_anim_walk_harvest(_img);
				}
				if (obj_you.left_foot_equipment != noone){
					equip_footware_player_anim_walk_harvest(true, false, _img);
				}
				break;
			default:
				break;
		}
	}
}

// headware
function equip_head_front(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			draw_sprite_ext(spr_player_front_headware_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0, c_white, 1);
			break;
		case obj_bark_hat:
			draw_sprite_ext(spr_player_front_headware_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0, c_white, 1);
			break;
		default:
			break;
	}
}
function equip_head_side(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			if (mouse_x>obj_you.x){
				draw_sprite_ext(spr_player_side_headware_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			}else{
				draw_sprite_ext(spr_player_side_headware_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			}
			break;
		case obj_bark_hat:
			if (mouse_x>obj_you.x){
				draw_sprite_ext(spr_player_side_headware_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			}else{
				draw_sprite_ext(spr_player_side_headware_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			}
			break;
		default:
			break;
	}
}
	
// bodyware
function equip_armor_player_anim_idle(){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			draw_sprite_ext(spr_player_front_straw_armor, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			break;
		case obj_bark_armor:
			draw_sprite_ext(spr_player_front_bark_armor, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			
			break;
		default:
			break;
	}
}

function equip_armor_player_anim_walk_down(){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			draw_sprite_ext(spr_player_front_straw_armor, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			break;
		case obj_bark_armor:
			draw_sprite_ext(spr_player_front_bark_armor, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			break;
		default:
			break;
	}
}

function equip_armor_player_anim_walk_up(){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			draw_sprite_ext(spr_player_back_straw_armor, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			break;
		case obj_bark_armor:
			draw_sprite_ext(spr_player_back_bark_armor, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			break;
		default:
			break;
	}
}

function equip_armor_player_anim_walk_side(_img){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			if (_img==0 || _img==4){
				draw_sprite_ext(spr_player_side_straw_armor, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			} else if (_img==1 || _img==3){
				draw_sprite_ext(spr_player_side_straw_armor, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			} else if (_img==2){
				draw_sprite_ext(spr_player_side_straw_armor, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			} else if (_img==5 || _img==7){
				draw_sprite_ext(spr_player_side_straw_armor, 5, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			} else if (_img==6){
				draw_sprite_ext(spr_player_side_straw_armor, 6, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			}
			break;
		case obj_bark_armor:
			if (_img==0 || _img==4){
				draw_sprite_ext(spr_player_side_bark_armor, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			} else if (_img==1 || _img==3){
				draw_sprite_ext(spr_player_side_bark_armor, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			} else if (_img==2){
				draw_sprite_ext(spr_player_side_bark_armor, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			} else if (_img==5 || _img==7){
				draw_sprite_ext(spr_player_side_bark_armor, 5, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			} else if (_img==6){
				draw_sprite_ext(spr_player_side_bark_armor, 6, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			}
			break;
		default:
			break;
	}
}

function equip_armor_player_anim_walk_harvest(_img){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			if (mouse_x > obj_you.x){
				draw_sprite_ext(spr_player_harvest_straw_armor, _img, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			}else{
				draw_sprite_ext(spr_player_harvest_straw_armor, _img, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			}
			break;
		case obj_bark_armor:
			if (mouse_x > obj_you.x){
				draw_sprite_ext(spr_player_harvest_bark_armor, _img, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			}else{
				draw_sprite_ext(spr_player_harvest_bark_armor, _img, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			}
			break;
		default:
			break;
	}
}
	
// legware
function equip_legware_player_anim_idle(){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			draw_sprite_ext(spr_player_front_legware_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			break;
		case obj_bark_pants:
			draw_sprite_ext(spr_player_front_legware_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			break;
		default:
			break;
	}
}

function equip_legware_player_anim_walk_down(_img){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			draw_sprite_ext(spr_player_front_legware_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			break;
		case obj_bark_pants:
			draw_sprite_ext(spr_player_front_legware_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			break;
		default:
			break;
	}
}

function equip_legware_player_anim_walk_up(_img){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			draw_sprite_ext(spr_player_down_legware_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			break;
		case obj_bark_pants:
			draw_sprite_ext(spr_player_down_legware_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
			break;
		default:
			break;
	}
}

function equip_legware_player_anim_walk_side(_img){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			if (_img==4 || _img==0){
				draw_sprite_ext(spr_player_side_legware_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			} else if (_img==7 || _img==5){
				draw_sprite_ext(spr_player_side_legware_straw, 4, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			} else if (_img==6){
				draw_sprite_ext(spr_player_side_legware_straw, 5, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			} else {
				draw_sprite_ext(spr_player_side_legware_straw, _img, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			}
			break;
		case obj_bark_pants:
			if (_img==4 || _img==0){
				draw_sprite_ext(spr_player_side_legware_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			} else if (_img==7 || _img==5){
				draw_sprite_ext(spr_player_side_legware_bark, 4, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			} else if (_img==6){
				draw_sprite_ext(spr_player_side_legware_bark, 5, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			} else {
				draw_sprite_ext(spr_player_side_legware_bark, _img, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			}
			break;
		default:
			break;
	}
}

function equip_legware_player_anim_walk_harvest(_img){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			if (mouse_x > obj_you.x){
				draw_sprite_ext(spr_player_harvest_legware_straw, _img, obj_you.x, obj_you.y, -1, 1,0,c_white,1);
			}else{
				draw_sprite_ext(spr_player_harvest_legware_straw, _img, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			}
			break;
		case obj_bark_pants:
			if (mouse_x > obj_you.x){
				draw_sprite_ext(spr_player_harvest_legware_bark, _img, obj_you.x, obj_you.y, -1, 1,0,c_white,1);
			}else{
				draw_sprite_ext(spr_player_harvest_legware_bark, _img, obj_you.x, obj_you.y, 1, 1,0,c_white,1);
			}
			break;
		default:
			break;
	}
}
	
// footware
function equip_footware_player_anim_idle(_left_foot, _right_foot){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				draw_sprite_ext(spr_player_down_left_straw_foot, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				break;
			case obj_bark_footwear:
				draw_sprite_ext(spr_player_down_left_bark_foot, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				break;
			default:
				break;
		}
	}
	
	if (_right_foot){
		switch(obj_you.right_foot_equipment){
			case obj_straw_footwear:
				draw_sprite_ext(spr_player_down_right_straw_foot, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				break;
			case obj_bark_footwear:
				draw_sprite_ext(spr_player_down_right_bark_foot, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				break;
			default:
				break;
		}
	}
}

function equip_footware_player_anim_walk_down(_left_foot, _right_foot, _img){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				if (_img==5 || _img==7){
					draw_sprite_ext(spr_player_down_left_straw_foot, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==6){
					draw_sprite_ext(spr_player_down_left_straw_foot, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else {
					draw_sprite_ext(spr_player_down_left_straw_foot, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			case obj_bark_footwear:
				if (_img==5 || _img==7){
					draw_sprite_ext(spr_player_down_left_bark_foot, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==6){
					draw_sprite_ext(spr_player_down_left_bark_foot, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else {
					draw_sprite_ext(spr_player_down_left_bark_foot, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			default:
				break;
		}
	}
	
	if (_right_foot){
		switch(obj_you.right_foot_equipment){
			case obj_straw_footwear:
				if (_img==1 || _img==3 ){
					draw_sprite_ext(spr_player_down_right_straw_foot, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==2){
					draw_sprite_ext(spr_player_down_right_straw_foot, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else {
					draw_sprite_ext(spr_player_down_right_straw_foot, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			case obj_bark_footwear:
				if (_img==1 || _img==3 ){
					draw_sprite_ext(spr_player_down_right_bark_foot, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==2){
					draw_sprite_ext(spr_player_down_right_bark_foot, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else {
					draw_sprite_ext(spr_player_down_right_bark_foot, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			default:
				break;
		}
	}
}

function equip_footware_player_anim_walk_up(_left_foot, _right_foot, _img){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				if (_img==5 || _img==7){
					draw_sprite_ext(spr_player_up_left_foot_straw, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==6){
					draw_sprite_ext(spr_player_up_left_foot_straw, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else {
					draw_sprite_ext(spr_player_up_left_foot_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			case obj_bark_footwear:
				if (_img==5 || _img==7){
					draw_sprite_ext(spr_player_up_left_foot_bark, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==6){
					draw_sprite_ext(spr_player_up_left_foot_bark, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else {
					draw_sprite_ext(spr_player_up_left_foot_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			default:
				break;
		}
	}
	
	if (_right_foot){
		switch(obj_you.right_foot_equipment){
			case obj_straw_footwear:
				if (_img==1 || _img==3 ){
					draw_sprite_ext(spr_player_up_right_foot_straw, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==2){
					draw_sprite_ext(spr_player_up_right_foot_straw, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else {
					draw_sprite_ext(spr_player_up_right_foot_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			case obj_bark_footwear:
				if (_img==1 || _img==3 ){
					draw_sprite_ext(spr_player_up_right_foot_bark, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==2){
					draw_sprite_ext(spr_player_up_right_foot_bark, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else {
					draw_sprite_ext(spr_player_up_right_foot_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			default:
				break;
		}
	}
}

function equip_footware_player_anim_walk_side(_left_foot, _right_foot, _img){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				if (_img==0 || _img==4){
					draw_sprite_ext(spr_player_side_left_foot_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==1 || _img==3){
					draw_sprite_ext(spr_player_side_left_foot_straw, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==2){
					draw_sprite_ext(spr_player_side_left_foot_straw, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==5 || _img==7){
					draw_sprite_ext(spr_player_side_left_foot_straw, 3, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==6){
					draw_sprite_ext(spr_player_side_left_foot_straw, 4, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			case obj_bark_footwear:
				if (_img==0 || _img==4){
					draw_sprite_ext(spr_player_side_left_foot_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==1 || _img==3){
					draw_sprite_ext(spr_player_side_left_foot_bark, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==2){
					draw_sprite_ext(spr_player_side_left_foot_bark, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==5 || _img==7){
					draw_sprite_ext(spr_player_side_left_foot_bark, 3, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==6){
					draw_sprite_ext(spr_player_side_left_foot_bark, 4, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			default:
				break;
		}
	}
	
	if (_right_foot){
		switch(obj_you.right_foot_equipment){
			case obj_straw_footwear:
				if (_img==1 || _img==3){
					draw_sprite_ext(spr_player_side_right_foot_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==2){
					draw_sprite_ext(spr_player_side_right_foot_straw, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==5 || _img==7){
					draw_sprite_ext(spr_player_side_right_foot_straw, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==6){
					draw_sprite_ext(spr_player_side_right_foot_straw, 3, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			case obj_bark_footwear:
				if (_img==1 || _img==3){
					draw_sprite_ext(spr_player_side_right_foot_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==2){
					draw_sprite_ext(spr_player_side_right_foot_bark, 1, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==5 || _img==7){
					draw_sprite_ext(spr_player_side_right_foot_bark, 2, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				} else if (_img==6){
					draw_sprite_ext(spr_player_side_right_foot_bark, 3, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			default:
				break;
		}
	}
}

function equip_footware_player_anim_walk_harvest(_left_foot, _right_foot, _img){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				if (mouse_x > obj_you.x){
					draw_sprite_ext(spr_player_side_left_foot_straw, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			case obj_bark_footwear:
				if (mouse_x > obj_you.x){
					draw_sprite_ext(spr_player_side_left_foot_bark, 0, obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale,0,c_white,1);
				}
				break;
			default:
				break;
		}
	}
}