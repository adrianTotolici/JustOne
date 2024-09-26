// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_crafting(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	var _straw_own=0;
	var _branch_own=0;
	var _rock_own=0;
	var _tree_bark_own=0;
	obj_resorces = array_create(10, noone);
	obj_own = array_create(10, 0);
	obj_need = array_create(10, 0);
	
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
				if (_ui.inventory_list[i]=obj_tree_bark_loot){
					_tree_bark_own+=_ui.inventory_num[i];
				}
			}
		
			if (_ui.show_equipment==true){
				// craft straw armor
				if (_my>=_ui.button_height+10 && _my<=(_ui.button_height*2)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_grass_loot;
					obj_need[0]=4;
					obj_own[0]=_straw_own;
					create_object(obj_straw_armor, obj_resorces, obj_need, obj_own);
				}
			
				// craft straw hat
				if (_my>=_ui.button_height+10+_ui.button_height && _my<=(_ui.button_height*3)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_grass_loot;
					obj_need[0]=2;
					obj_own[0]=_straw_own;
					create_object(obj_straw_hat, obj_resorces, obj_need, obj_own);
				}
			
				// craft straw pants
				if (_my>=_ui.button_height+10+(_ui.button_height*2) && _my<=(_ui.button_height*4)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_grass_loot;
					obj_need[0]=3;
					obj_own[0]=_straw_own;
					create_object(obj_straw_pants, obj_resorces, obj_need, obj_own);
				}
			
				// craft straw footware
				if (_my>=_ui.button_height+10+(_ui.button_height*3) && _my<=(_ui.button_height*5)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_grass_loot;
					obj_need[0]=2;
					obj_own[0]=_straw_own;
					create_object(obj_straw_footwear, obj_resorces, obj_need, obj_own);
				}
				
				// craft bark armor
				if (_my>=_ui.button_height+10+(_ui.button_height*4) && _my<=(_ui.button_height*6)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_tree_bark_loot;
					obj_need[0]=4;
					obj_own[0]=_tree_bark_own;
					create_object(obj_bark_armor, obj_resorces, obj_need, obj_own);
				}
			
				// craft bark hat
				if (_my>=_ui.button_height+10+(_ui.button_height*5) && _my<=(_ui.button_height*7)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_tree_bark_loot;
					obj_need[0]=2;
					obj_own[0]=_tree_bark_own;
					create_object(obj_bark_hat, obj_resorces, obj_need, obj_own);
				}
			
				// craft bark pants
				if (_my>=_ui.button_height+10+(_ui.button_height*6) && _my<=(_ui.button_height*8)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_tree_bark_loot;
					obj_need[0]=3;
					obj_own[0]=_tree_bark_own;
					create_object(obj_bark_pants, obj_resorces, obj_need, obj_own);
				}
			
				// craft bark footware
				if (_my>=_ui.button_height+10+(_ui.button_height*7) && _my<=(_ui.button_height*9)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_tree_bark_loot;
					obj_need[0]=2;
					obj_own[0]=_tree_bark_own;
					create_object(obj_bark_footwear, obj_resorces, obj_need, obj_own);
				}
			}
		
			if (_ui.show_tools==true){
				// craft stick
				if (_my>=_ui.button_height+10 && _my<=(_ui.button_height*2)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_branch_loot;
					obj_need[0]=4;
					obj_own[0]=_branch_own;
					create_object(obj_stick, obj_resorces, obj_need, obj_own);
				}
				
				// craft stone
				if (_my>=_ui.button_height+10+_ui.button_height && _my<=(_ui.button_height*3)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_stone_pebles_loot;
					obj_need[0]=5;
					obj_own[0]=_rock_own;
					create_object(obj_rock, obj_resorces, obj_need, obj_own);
				}
				
				// craft straw mug
				if (_my>=_ui.button_height+10+(_ui.button_height*2) && _my<=(_ui.button_height*4)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_grass_loot;
					obj_need[0]=1;
					obj_own[0]=_straw_own;
					create_object(obj_straw_mug, obj_resorces, obj_need, obj_own);
				}
				
				// craft stone axe
				if (_my>=_ui.button_height+10+(_ui.button_height*3) && _my<=(_ui.button_height*5)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_branch_loot;
					obj_resorces[1]=obj_stone_pebles_loot;
					obj_need[0]=1;
					obj_need[1]=1;
					obj_own[0]=_branch_own;
					obj_own[1]=_rock_own;
					create_object(obj_axe, obj_resorces, obj_need, obj_own);
				}
				
				// craft wood weapon lvl 0
				if (_my>=_ui.button_height+10+(_ui.button_height*4) && _my<=(_ui.button_height*6)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_branch_loot;
					obj_need[0]=10;
					obj_own[0]=_branch_own;
					create_object(obj_wood_weapon_lvl0, obj_resorces, obj_need, obj_own);
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
	var _craft=false;
	for (i=0;i<array_length(_obj_resources); i++){
		if (_obj_resources[i]!=noone){
			if (_resource_need[i] <= _resource_own[i]){
				_craft=true;
			}else{
				_craft=false;
				show_ui_text(_ui, _resource_need[i], _resource_own[i]);
				break;
			}
		}
	}
	
	if (_craft){
		for (j=0;j<array_length(_ui.inventory_list); j++){
			if (_ui.inventory_list[j]==noone){
				_ui.inventory_list[j]=_obj_created;
				_ui.inventory_num[j]+=1;
				for (k=0; k<array_length(_obj_resources); k++){
					if (_obj_resources[k]!=noone){
						for (i=0; i<array_length(_ui.inventory_list); i++){
							if (_ui.inventory_list[i]=_obj_resources[k]){
								if (_ui.inventory_num[i]>_resource_need[k]){
									_ui.inventory_num[i]-=_resource_need[k];
								}else{
									_resource_need[k]-=_ui.inventory_num[i];
									_ui.inventory_list[i]=noone;
									_ui.inventory_num[i]=0;
									if (_resource_need[k]==0){
										break;
									}
								}
							}
						}
					}else{
						break;
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
	}else{
		show_ui_text(_ui, _resource_need, _resource_own);
	}
}

function show_ui_text(_ui,_resource_need, _resource_own){
	_ui.show_text_no_resources=true;
	missing_resources=_resource_need-_resource_own;
	_ui.text_no_resources="Need "+string(missing_resources)+" more resources";
}