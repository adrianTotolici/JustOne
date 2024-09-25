// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_select_draw_armor(){
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
					equip_legware_player_anim_walk_down();
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
					equip_legware_player_anim_walk_up();
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

// headware ware_armor[0]
function equip_head_front(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			obj_you.ware_armor[0][0]=spr_player_front_headware_straw;
			break;
		case obj_bark_hat:
			obj_you.ware_armor[0][0]=spr_player_front_headware_bark;
			break;
		default:
			break;
	}
	obj_you.ware_armor[0][1]=0;
}
function equip_head_side(){
	switch(obj_you.head_equipment){
		case obj_straw_hat:
			obj_you.ware_armor[0][0]=spr_player_side_headware_straw;
			break;
		case obj_bark_hat:
			obj_you.ware_armor[0][0]=spr_player_side_headware_bark;
			break;
		default:
			break;
	}
	obj_you.ware_armor[0][1]=0;
}
	
// bodyware ware_armor[1]
function equip_armor_player_anim_idle(){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			obj_you.ware_armor[1][0]=spr_player_front_straw_armor;
			break;
		case obj_bark_armor:
			obj_you.ware_armor[1][0]=spr_player_front_bark_armor;
			break;
		default:
			break;
	}
	obj_you.ware_armor[1][1]=0;
}
function equip_armor_player_anim_walk_down(){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			obj_you.ware_armor[1][0]=spr_player_front_straw_armor;
			break;
		case obj_bark_armor:
			obj_you.ware_armor[1][0]=spr_player_front_bark_armor;
			break;
		default:
			break;
	}
	obj_you.ware_armor[1][1]=0;
}
function equip_armor_player_anim_walk_up(){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			obj_you.ware_armor[1][0]=spr_player_back_straw_armor;
			break;
		case obj_bark_armor:
			obj_you.ware_armor[1][0]=spr_player_back_bark_armor;
			break;
		default:
			break;
	}
	obj_you.ware_armor[1][1]=0;
}
function equip_armor_player_anim_walk_side(_img){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			obj_you.ware_armor[1][0]=spr_player_side_straw_armor;
			break;
		case obj_bark_armor:
			obj_you.ware_armor[1][0]=spr_player_side_bark_armor;
			break;
		default:
			break;
	}
	if (_img==0 || _img==4){
		obj_you.ware_armor[1][1]=0;
	} else if (_img==1 || _img==3){
		obj_you.ware_armor[1][1]=1;
	} else if (_img==2){
		obj_you.ware_armor[1][1]=2;
	} else if (_img==5 || _img==7){
		obj_you.ware_armor[1][1]=5;
	} else if (_img==6){
		obj_you.ware_armor[1][1]=6;
	}
}
function equip_armor_player_anim_walk_harvest(_img){
	switch(obj_you.body_equipment){
		case obj_straw_armor:
			obj_you.ware_armor[1][0]=spr_player_harvest_straw_armor;
			break;
		case obj_bark_armor:
			obj_you.ware_armor[1][0]=spr_player_harvest_bark_armor;
			break;
		default:
			break;
	}
	obj_you.ware_armor[1][1]=_img;
}
	
// legware[2]
function equip_legware_player_anim_idle(){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			obj_you.ware_armor[2][0]=spr_player_front_legware_straw;
			break;
		case obj_bark_pants:
			obj_you.ware_armor[2][0]=spr_player_front_legware_bark;
			break;
		default:
			break;
	}
	obj_you.ware_armor[2][1]=0;
}
function equip_legware_player_anim_walk_down(){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			obj_you.ware_armor[2][0]=spr_player_front_legware_straw;
			break;
		case obj_bark_pants:
			obj_you.ware_armor[2][0]=spr_player_front_legware_bark;
			break;
		default:
			break;
	}
	obj_you.ware_armor[2][1]=0;
}
function equip_legware_player_anim_walk_up(){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			obj_you.ware_armor[2][0]=spr_player_down_legware_straw;
			break;
		case obj_bark_pants:
			obj_you.ware_armor[2][0]=spr_player_down_legware_bark;
			break;
		default:
			break;
	}
	obj_you.ware_armor[2][1]=0;
}
function equip_legware_player_anim_walk_side(_img){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			obj_you.ware_armor[2][0]=spr_player_side_legware_straw;
			break;
		case obj_bark_pants:
			obj_you.ware_armor[2][0]=spr_player_side_legware_bark;
			break;
		default:
			break;
	}
	if (_img==4 || _img==0){
		obj_you.ware_armor[2][1]=0;
	} else if (_img==7 || _img==5){
		obj_you.ware_armor[2][1]=4;
	} else if (_img==6){
		obj_you.ware_armor[2][1]=5;
	} else {
		obj_you.ware_armor[2][1]=_img;
	}
}
function equip_legware_player_anim_walk_harvest(_img){
	switch(obj_you.leg_equipment){
		case obj_straw_pants:
			obj_you.ware_armor[2][0]=spr_player_harvest_legware_straw;
			break;
		case obj_bark_pants:
			obj_you.ware_armor[2][0]=spr_player_harvest_legware_bark;
			break;
		default:
			break;
	}
	obj_you.ware_armor[2][1]=_img;
}
	
// footware[3]/[4]
function equip_footware_player_anim_idle(_left_foot, _right_foot){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				obj_you.ware_armor[3][0]=spr_player_down_left_straw_foot;
				break;
			case obj_bark_footwear:
				obj_you.ware_armor[3][0]=spr_player_down_left_bark_foot;
				break;
			default:
				break;
		}
		obj_you.ware_armor[3][1]=0;
	}
	
	if (_right_foot){
		switch(obj_you.right_foot_equipment){
			case obj_straw_footwear:
				obj_you.ware_armor[4][0]=spr_player_down_right_straw_foot;
				break;
			case obj_bark_footwear:
				obj_you.ware_armor[4][0]=spr_player_down_right_bark_foot;
				break;
			default:
				break;
		}
		obj_you.ware_armor[4][1]=0;
	}
}
function equip_footware_player_anim_walk_down(_left_foot, _right_foot, _img){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				obj_you.ware_armor[3][0]=spr_player_down_left_straw_foot;
				break;
			case obj_bark_footwear:
				obj_you.ware_armor[3][0]=spr_player_down_left_bark_foot;
				break;
			default:
				break;
		}
		if (_img==5 || _img==7){
			obj_you.ware_armor[3][1]=1;
		} else if (_img==6){
			obj_you.ware_armor[3][1]=2;
		} else {
			obj_you.ware_armor[3][1]=0;
		}
	}
	
	if (_right_foot){
		switch(obj_you.right_foot_equipment){
			case obj_straw_footwear:
				obj_you.ware_armor[4][0]=spr_player_down_right_straw_foot;
				break;
			case obj_bark_footwear:
				obj_you.ware_armor[4][0]=spr_player_down_right_bark_foot;
				break;
			default:
				break;
		}
		if (_img==1 || _img==3 ){
			obj_you.ware_armor[4][1]=1;
		} else if (_img==2){
			obj_you.ware_armor[4][1]=2;
		} else {
			obj_you.ware_armor[4][1]=0;
		}
	}
}
function equip_footware_player_anim_walk_up(_left_foot, _right_foot, _img){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				obj_you.ware_armor[3][0]=spr_player_up_left_foot_straw;
				break;
			case obj_bark_footwear:
				obj_you.ware_armor[3][0]=spr_player_up_left_foot_bark;
				break;
			default:
				break;
		}
		if (_img==5 || _img==7){
			obj_you.ware_armor[3][1]=1;
		} else if (_img==6){
			obj_you.ware_armor[3][1]=2;
		} else {
			obj_you.ware_armor[3][1]=0;
		}
	}
	
	if (_right_foot){
		switch(obj_you.right_foot_equipment){
			case obj_straw_footwear:
				obj_you.ware_armor[4][0]=spr_player_up_right_foot_straw;
				break;
			case obj_bark_footwear:
				obj_you.ware_armor[4][0]=spr_player_up_right_foot_bark;
				break;
			default:
				break;
		}
		if (_img==1 || _img==3 ){
			obj_you.ware_armor[4][1]=1;
		} else if (_img==2){
			obj_you.ware_armor[4][1]=2;
		} else {
			obj_you.ware_armor[4][1]=0;
		}
	}
}
function equip_footware_player_anim_walk_side(_left_foot, _right_foot, _img){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				obj_you.ware_armor[3][0]=spr_player_side_left_foot_straw;
				break;
			case obj_bark_footwear:
				obj_you.ware_armor[3][0]=spr_player_side_left_foot_bark;
				break;
			default:
				break;
		}
		if (_img==0 || _img==4){
			obj_you.ware_armor[3][1]=0;
		} else if (_img==1 || _img==3){
			obj_you.ware_armor[3][1]=1;
		} else if (_img==2){
			obj_you.ware_armor[3][1]=2;
		} else if (_img==5 || _img==7){
			obj_you.ware_armor[3][1]=3;
		} else if (_img==6){
			obj_you.ware_armor[3][1]=4;
		}
	}
	
	if (_right_foot){
		switch(obj_you.right_foot_equipment){
			case obj_straw_footwear:
				obj_you.ware_armor[4][0]=spr_player_side_right_foot_straw;
				break;
			case obj_bark_footwear:
				obj_you.ware_armor[4][0]=spr_player_side_right_foot_bark;
				break;
			default:
				break;
		}
		if (_img==1 || _img==3){
			obj_you.ware_armor[4][1]=0;
		} else if (_img==2){
			obj_you.ware_armor[4][1]=1;
		} else if (_img==5 || _img==7){
			obj_you.ware_armor[4][1]=2;
		} else if (_img==6){
			obj_you.ware_armor[4][1]=3;
		}
	}
}
function equip_footware_player_anim_walk_harvest(_left_foot, _right_foot){
	if (_left_foot){
		switch(obj_you.left_foot_equipment){
			case obj_straw_footwear:
				obj_you.ware_armor[3][0]=spr_player_side_left_foot_straw
				break;
			case obj_bark_footwear:
				obj_you.ware_armor[3][0]=spr_player_side_left_foot_bark;
				break;
			default:
				break;
		}
		obj_you.ware_armor[3][1]=0;
	}
}