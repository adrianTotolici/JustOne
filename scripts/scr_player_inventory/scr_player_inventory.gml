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
								}
							}
							_ui.inventory_list[_j*_ui._inv_nr_columns+_i]=_ui.inv_selected;
							_ui.inv_selected=noone;
							break;
						}
					}
				}
			}
		}
	}
}