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
				
			//Quickslot selection
			if (_my >=_ui.y_size_ui-_ui.sprite_size+2){
				for (i=0;i<array_length(_ui.slot_list);i++){
					if (_mx>=_ui.x_size_ui/2+(_ui.sprite_size*(i-_ui._middle_box))-16 && _mx<=_ui.x_size_ui/2+(_ui.sprite_size*(i-_ui._middle_box))+16){
						_ui.slot_list[i]=_ui.inv_selected;
					}
				}
			}
			
			//Drop item
			if (_my <= _ui.y_size_ui-_ui.sprite_size+2 && _ui.inv_selected!=noone){
				mx_min=_ui.x_size_ui/2+(_ui.inventory_sprite_size/_ui._inv_nr_columns);
				mx_max=_ui.x_size_ui/2+((_ui.inventory_sprite_size/_ui._inv_nr_columns)*(_ui._inv_nr_columns-_ui._middle_box_inv));
				if (_mx>=mx_min || _mx <=mx_max){
					var item=instance_create_layer(mouse_x, mouse_y, "Instances", _ui.inv_selected);
					item.on_floor=true;
					for (i=0; i<array_length(_ui.inventory_list);i++){
						if (_ui.inv_selected==_ui.inventory_list[i]){
							_ui.inventory_list[i]=noone;
							item.my_stack=_ui.inventory_num[i];
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
								if (_ui.inventory_list[b]!=noone && (object_get_parent(_ui.inventory_list[b])==obj_par_food) || object_get_parent(_ui.inventory_list[b])==obj_par_drink){
									eat_and_drink(_ui.inventory_list[b]);
									_ui.inventory_num[b]-=1;
									if (_ui.inventory_num[b]<1){
										_ui.inventory_list[b]=noone;
									}
								}
								// equip armmor
								//if (_ui.inventory_list[b]!=noone && object_get_parent(_ui.inventory_list[b])==obj_par_equipment){
									
								//}
							}
						}
					}
				}
			}
		}
	}
}

function eat_and_drink(object){
	var obj_fw=object;
	var obj = noone;
	switch (obj_fw){
		case obj_coacaze_loot:
			obj = obj_coacaze_loot;
			break;
		case obj_water_loot:
			obj = obj_water_loot;
			break;
		default:
			break;
	}
	if (obj != noone){
		hunger+=obj.food;
		thirst+=obj.water;
	}
}
