// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_inventory(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	
	if (mouse_check_button_pressed(mb_left)){
		if (_ui.inv_selected==noone){
			for (var _i=0; _i<_ui._inv_nr_columns; _i++){
				mx_min=_ui.x_size_ui/2+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_i-_ui._middle_box_inv))
				mx_max=_ui.x_size_ui/2+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*((_i+1)-_ui._middle_box_inv))
				if ( _mx>=mx_min && _mx<=mx_max){
					for (var _j=0; _j<_ui._inv_nr_columns; _j++){
						my_min=_ui.y_size_ui-(_ui._heigh_diff_inventory+(_ui.inventory_sprite_size/2))+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_j));
						my_max=_ui.y_size_ui-(_ui._heigh_diff_inventory+(_ui.inventory_sprite_size/2))+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_j+1));
						if (_my>=my_min && _my<=my_max){
							b = _j*_ui._inv_nr_columns+_i;
							_ui.inv_selected=_ui.inventory_list[b];
							break;
						}
					}
				}
			}
		}else{
			for (var _i=0; _i<_ui._inv_nr_columns; _i++){
				mx_min=_ui.x_size_ui/2+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_i-_ui._middle_box_inv))
				mx_max=_ui.x_size_ui/2+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*((_i+1)-_ui._middle_box_inv))
				if ( _mx>=mx_min && _mx<=mx_max){
					for (var _j=0; _j<_ui._inv_nr_columns; _j++){
						my_min=_ui.y_size_ui-(_ui._heigh_diff_inventory+(_ui.inventory_sprite_size/2))+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_j));
						my_max=_ui.y_size_ui-(_ui._heigh_diff_inventory+(_ui.inventory_sprite_size/2))+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_j+1));
						if (_my>=my_min && _my<=my_max){
							for (a=0;a<array_length(_ui.inventory_list);a++){
								if (_ui.inv_selected==_ui.inventory_list[a]){
									_ui.inventory_list[a]=_ui.inventory_list[_j*_ui._inv_nr_columns+_i];
									var _num=_ui.inventory_num[a];
									_ui.inventory_num[a]=_ui.inventory_num[_j*_ui._inv_nr_columns+_i];
									_ui.inventory_num[_j*_ui._inv_nr_columns+_i]=_num;
									break;
								}
							}
							_ui.inventory_list[_j*_ui._inv_nr_columns+_i]=_ui.inv_selected;
							_ui.inv_selected=noone;
						}
					}
				}
			}
			
			//Drop item
			if (_my <= _ui.y_size_ui-_ui.sprite_size+2 && _ui.inv_selected!=noone){
				mx_min=_ui.x_size_ui/2+(_ui.inventory_sprite_size/_ui._inv_nr_columns);
				mx_max=_ui.x_size_ui/2+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_ui._inv_nr_columns-_ui._middle_box_inv));
				if (_mx>=mx_min || _mx <=mx_max){
					var _item=instance_create_layer(mouse_x, mouse_y, "Instances", _ui.inv_selected);
					_item.on_floor=true;
					for (i=0; i<array_length(_ui.inventory_list);i++){
						if (_ui.inv_selected==_ui.inventory_list[i]){
							_ui.inventory_list[i]=noone;
							_item.my_stack=_ui.inventory_num[i];
							_ui.inventory_num[i]=0;
							break;
						}
					}
					_ui.inv_selected=noone;
				}
			}
		}
	}else{
		if (mouse_check_button_pressed(mb_right)){
			if (_ui.inv_selected==noone){
				for (var _i=0; _i<_ui._inv_nr_columns; _i++){
					mx_min=_ui.x_size_ui/2+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_i-_ui._middle_box_inv))
					mx_max=_ui.x_size_ui/2+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*((_i+1)-_ui._middle_box_inv))
					if ( _mx>=mx_min && _mx<=mx_max){
						for (var _j=0; _j<_ui._inv_nr_columns; _j++){
							my_min=_ui.y_size_ui-(_ui._heigh_diff_inventory+(_ui.inventory_sprite_size/2))+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_j));
							my_max=_ui.y_size_ui-(_ui._heigh_diff_inventory+(_ui.inventory_sprite_size/2))+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_j+1));
							if (_my>=my_min && _my<=my_max){
								b = _j*_ui._inv_nr_columns+_i;
								// eat food and drink
								if (_ui.inventory_list[b]!=noone){
									if (object_get_parent(_ui.inventory_list[b])=obj_par_food){
										eat_and_drink(_ui.inventory_list[b]);
										_ui.inventory_num[b]-=1;
										if (_ui.inventory_num[b]<1){
											_ui.inventory_list[b]=noone;
										}
										break;
									}
									if (object_get_parent(_ui.inventory_list[b])=obj_par_armors){
										if (_ui.inventory_equiped[b] == false){
											remove_old_armor_item_selection(b);
											equip(_ui.inventory_list[b]);
											_ui.inventory_equiped[b]=true;
										}else{
											unequip(_ui.inventory_list[b]);
											_ui.inventory_equiped[b]=false;
											remove_old_armor_item_selection(b);
										}
										break;
									}
									if (object_get_parent(_ui.inventory_list[b])=obj_par_wepons || object_get_parent(_ui.inventory_list[b])=obj_par_items){
										if (_ui.inventory_equiped[b] == false){
											remove_old_weapon_item_selection(b);
											with (obj_par_wepons) {instance_destroy();}
											with (obj_par_items){instance_destroy();}
											equip(_ui.inventory_list[b]);
											_ui.inventory_equiped[b] = true;
											//instance_create_layer(obj_you.x, obj_you.y, "Player", _ui.inventory_list[b]);
										}else{
											unequip(_ui.inventory_list[b]);
											_ui.inventory_equiped[b] = false;
											remove_old_weapon_item_selection(b);
											with (obj_par_wepons) {instance_destroy();}
											with (obj_par_items){instance_destroy();}
										}
										break;
									}
								}else{
									break;
								}
							}
						}
						break;
					}
				}
			}
		}
	}
}

function eat_and_drink(_object){
	var _obj = noone;
	switch (_object){
		case obj_coacaze_loot:
			_obj = instance_find(obj_coacaze_loot, 0);
			break;
		case obj_water_loot:
			_obj = instance_find(obj_water_loot, 0);
			break;
		default:
			break;
	}
	if (_object != noone){
		if (hunger+_object.food >= 100){
			hunger = 100;
		}else{ 
			hunger+=_object.food;
		}
		if (thirst+_object.water >= 100) {
			thirst = 100;
		} else {
			thirst+=_object.water;
		}
	}
}

function equip(_object){
	switch(_object){
		// armor
		//straw
		case obj_straw_hat:
			obj_you.head_equipment = obj_straw_hat;
			obj_you.head_armor = 1;
			break;
		case obj_straw_armor:
			obj_you.body_equipment = obj_straw_armor;
			obj_you.body_armor = 3;
			break;
		case obj_straw_pants:
			obj_you.leg_equipment = obj_straw_pants;
			obj_you.leg_armor = 2;
			break;
		case obj_straw_footwear:
			if (obj_you.feet_armor > 0 && obj_you.left_foot_equipment != noone && obj_you.right_foot_equipment != noone){
				obj_you.feet_armor = 0;
			}
			obj_you.feet_armor += 1;
			if (obj_you.left_foot_equipment == noone){
				obj_you.left_foot_equipment = obj_straw_footwear;
				break;
			}
			if (obj_you.right_foot_equipment == noone){
				obj_you.right_foot_equipment = obj_straw_footwear;
				break;
			}
			break;
		// bark
		case obj_bark_hat:
			obj_you.head_equipment = obj_bark_hat;
			obj_you.head_armor = 2;
			break;
		case obj_bark_armor:
			obj_you.body_equipment = obj_bark_armor;
			obj_you.body_armor = 4;
			break;
		case obj_bark_pants:
			obj_you.leg_equipment = obj_bark_pants;
			obj_you.leg_armor = 3;
			break;
		case obj_bark_footwear:
			if (obj_you.feet_armor > 0 && obj_you.left_foot_equipment != noone && obj_you.right_foot_equipment != noone){
				obj_you.feet_armor = 0;
			}
			obj_you.feet_armor += 2;
			if (obj_you.left_foot_equipment == noone){
				obj_you.left_foot_equipment = obj_bark_footwear;
				break;
			}
			if (obj_you.right_foot_equipment == noone){
				obj_you.right_foot_equipment = obj_bark_footwear;
				break;
			}
			break;
		// tools
		case obj_rock:
			obj_you.equipped = obj_rock;
			obj_you.attack += 5.0;
			break;
		case obj_stick:
			obj_you.equipped = obj_stick;
			obj_you.attack += 3.0;
			break;
		case obj_straw_mug:
			obj_you.equipped = obj_straw_mug;
			obj_you.attack += 0.1;
			break;
		case obj_axe:
			obj_you.equipped = obj_axe;
			obj_you.attack += 10.0;
			break;
		default:
			break;
	}
	scr_select_draw_armor();
}

function unequip(_object){
	switch(_object){
		//armor
		//straw
		case obj_straw_hat:
			obj_you.head_armor = 0;
			obj_you.head_equipment = noone;
			obj_you.ware_armor[0]=noone;
			break;
		case obj_straw_armor:
			obj_you.body_armor = 0;
			obj_you.body_equipment = noone;
			obj_you.ware_armor[1]=noone;
			break;
		case obj_straw_pants:
			obj_you.leg_armor=0;
			obj_you.leg_equipment = noone;
			obj_you.ware_armor[2]=noone;
			break;
		case obj_straw_footwear:
			if (obj_you.left_foot_equipment != noone){
				obj_you.left_foot_equipment = noone;
				obj_you.feet_armor -=1;
				obj_you.ware_armor[3]=noone;
			}else if (obj_you.right_foot_equipment != noone){
				obj_you.right_foot_equipment = noone;
				obj_you.feet_armor -=1;
				obj_you.ware_armor[4]=noone;
			}
			break;
		// bark
		case obj_bark_hat:
			obj_you.head_armor = 0;
			obj_you.head_equipment = noone;
			obj_you.ware_armor[0]=noone;
			break;
		case obj_bark_armor:
			obj_you.body_armor = 0;
			obj_you.body_equipment = noone;
			obj_you.ware_armor[1]=noone;
			break;
		case obj_bark_pants:
			obj_you.leg_armor=0;
			obj_you.leg_equipment = noone;
			obj_you.ware_armor[2]=noone;
			break;
		case obj_bark_footwear:
			if (obj_you.left_foot_equipment != noone){
				obj_you.left_foot_equipment = noone;
				obj_you.feet_armor -=2;
				obj_you.ware_armor[3]=noone;
			}else if (obj_you.right_foot_equipment != noone){
				obj_you.right_foot_equipment = noone;
				obj_you.feet_armor -=2;
				obj_you.ware_armor[4]=noone;
			}
			break;
		// tools
		case obj_rock:
			obj_you.equipped=noone;
			obj_you.attack -= 5;
			break;
		case obj_stick:
			obj_you.equipped=noone;
			obj_you.attack -= 3;
			break;
		case obj_straw_mug:
			obj_you.equipped = obj_straw_mug;
			obj_you.attack -= 0.1;
			break;
		case obj_axe:
			obj_you.equipped = obj_axe;
			obj_you.attack -= 10.0;
			break;
		default:
			break;
	}
}
	
function remove_old_weapon_item_selection(_new_pos_obj){
	for (var _a=0; _a<array_length(obj_ui.inventory_list); ++_a){
		if (obj_ui.inventory_list[_a] != noone){
			if (object_get_parent(obj_ui.inventory_list[_a])=obj_par_wepons || object_get_parent(obj_ui.inventory_list[_a])=obj_par_items){
				obj_ui.inventory_equiped[_a] = false;
			}
		}
	}
}

function remove_old_armor_item_selection(_new_pos_obj){
	for (var _a=0; _a<array_length(obj_ui.inventory_list); ++_a){
		if (obj_ui.inventory_list[_a] != noone){
			//if (object_get_parent(obj_ui.inventory_list[_a])=obj_par_bodyware){
			if (object_get_parent(obj_ui.inventory_list[_a])=object_get_parent(obj_ui.inventory_list[_new_pos_obj])){
				obj_ui.inventory_equiped[_a] = false;
			}
		}
	}
}
