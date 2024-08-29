// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_crafting(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	var _straw_own=0;
	
	if (mouse_check_button_pressed(mb_left)){
		for (i=0;i<array_length(_ui.inventory_list); i++){
			if (_ui.inventory_list[i]=obj_grass_loot){
				_straw_own+=_ui.inventory_num[i];
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
				create_object(obj_straw_pants, obj_grass_loot, 4, _straw_own);
			}
			
			// craft straw footware
			if (_my>=_ui.button_height+10+(_ui.button_height*3) && _my<=(_ui.button_height*5)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
				create_object(obj_straw_footwear, obj_grass_loot, 2, _straw_own);
			}
		}
		
		if (_ui.show_tools==true){
			// craft straw mug
			if (_my>=_ui.button_height+10+(_ui.button_height*2) && _my<=(_ui.button_height*4)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
				create_object(obj_straw_mug, obj_grass_loot, 1, _straw_own);
			}
		}
	}
}

function create_object(obj_created, obj_resources, resource_need, resource_own){
	var _ui=obj_ui;
	if (resource_need<=resource_own){
		for (j=0;j<array_length(_ui.inventory_list); j++){
			if (_ui.inventory_list[j]==noone){
				_ui.inventory_list[j]=obj_created;
				_ui.inventory_num[j]+=1;
				for (i=0; i<array_length(_ui.inventory_list); i++){
					if (_ui.inventory_list[i]=obj_resources){
						if (_ui.inventory_num[i]>resource_need){
							_ui.inventory_num[i]-=resource_need;
						}else{
							resource_need-=_ui.inventory_num[i];
							_ui.inventory_list[i]=noone;
							_ui.inventory_num[i]=0;
							if (resource_need==0){
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
