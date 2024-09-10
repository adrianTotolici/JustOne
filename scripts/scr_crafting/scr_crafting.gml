// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_crafting(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	var _straw_own=0;
	var _branch_own=0;
	var _rock_own=0;
	
	if (mouse_check_button_pressed(mb_left)){
		if (_ui.inv_selected==noone){
			for (i=0;i<array_length(_ui.inventory_list); i++){
				if (_ui.inventory_list[i]=obj_grass_loot){
					_straw_own+=_ui.inventory_num[i];
				}
				if (_ui.inventory_list[i]=obj_branch_loot){
					_branch_own+=_ui.inventory_num[i];
				}
				if (_ui.inventory_list[i]=obj_stone_pebles_loot){
					_rock_own+=_ui.inventory_num[i];
				}
			}
		
			if (_ui.show_equipment==true){
				// craft straw armor
				if (_my>=_ui.button_height+10 && _my<=(_ui.button_height*2)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					create_object(obj_straw_armor, obj_grass_loot, 4, _straw_own);
				}
			
				// craft straw hat
				if (_my>=_ui.button_height+10+_ui.button_height && _my<=(_ui.button_height*3)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					create_object(obj_straw_hat, obj_grass_loot, 2, _straw_own);
				}
			
				// craft straw pants
				if (_my>=_ui.button_height+10+(_ui.button_height*2) && _my<=(_ui.button_height*4)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					create_object(obj_straw_pants, obj_grass_loot, 3, _straw_own);
				}
			
				// craft straw footware
				if (_my>=_ui.button_height+10+(_ui.button_height*3) && _my<=(_ui.button_height*5)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					create_object(obj_straw_footwear, obj_grass_loot, 2, _straw_own);
				}
			}
		
			if (_ui.show_tools==true){
				// craft stick
				if (_my>=_ui.button_height+10 && _my<=(_ui.button_height*2)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					create_object(obj_stick, obj_branch_loot, 4, _branch_own);
				}
				
				// craft stone
				if (_my>=_ui.button_height+10+_ui.button_height && _my<=(_ui.button_height*3)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					create_object(obj_rock, obj_stone_pebles_loot, 5, _rock_own);
				}
				
				// craft straw mug
				if (_my>=_ui.button_height+10+(_ui.button_height*2) && _my<=(_ui.button_height*4)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					create_object(obj_straw_mug, obj_grass_loot, 1, _straw_own);
				}
				

			}
		
			if (_ui.show_build==true){
				if (_my>=_ui.button_height+10 && _my<=(_ui.button_height*2)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					build_object(obj_grass_house, obj_grass_loot, 10, _straw_own);
				}
			}
		}else{
			//Build 
			if (_ui.show_build && object_get_parent(_ui.inv_selected)=obj_par_buildings ){
				instance_create_layer(mouse_x, mouse_y, "Instances", _ui.inv_selected);
				_ui.inv_selected=noone;
			}
		}
	}
}


function create_object(_obj_created, _obj_resources, _resource_need, _resource_own){
	var _ui=obj_ui;
	if (_resource_need<=_resource_own){
		for (j=0;j<array_length(_ui.inventory_list); j++){
			if (_ui.inventory_list[j]==noone){
				_ui.inventory_list[j]=_obj_created;
				_ui.inventory_num[j]+=1;
				for (i=0; i<array_length(_ui.inventory_list); i++){
					if (_ui.inventory_list[i]=_obj_resources){
						if (_ui.inventory_num[i]>_resource_need){
							_ui.inventory_num[i]-=_resource_need;
						}else{
							_resource_need-=_ui.inventory_num[i];
							_ui.inventory_list[i]=noone;
							_ui.inventory_num[i]=0;
							if (_resource_need==0){
								break;
							}
						}
					}
				}
				break;
			}
		}
	}
}

function build_object(_obj_created, _obj_resources, _resource_need, _resource_own){
	var _ui=obj_ui;
	if (_resource_need<=_resource_own){
		_ui.inv_selected = _obj_created;
		for (i=0; i<array_length(_ui.inventory_list); i++){
			if (_ui.inventory_list[i]=_obj_resources){
				if (_ui.inventory_num[i]>_resource_need){
					_ui.inventory_num[i]-=_resource_need;
					break;
				}else{
					_resource_need-=_ui.inventory_num[i];
					_ui.inventory_list[i]=noone;
					_ui.inventory_num[i]=0;
					if (_resource_need==0){
						break;
					}
				}
			}
		}
	}
}
