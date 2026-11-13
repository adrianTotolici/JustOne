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
	var _wood_own=0;
	obj_resorces = array_create(10, noone);
	obj_own = array_create(10, 0);
	obj_need = array_create(10, 0);
	
	if (mouse_check_button_pressed(mb_left)){
		if (_ui.inv_selected==noone){
			_straw_own=inventory_count_item(_ui.inventory_list,_ui.inventory_num,obj_grass_loot);
			_branch_own=inventory_count_item(_ui.inventory_list,_ui.inventory_num,obj_branch_loot);
			_rock_own=inventory_count_item(_ui.inventory_list,_ui.inventory_num,obj_stone_pebles_loot);
			_tree_bark_own=inventory_count_item(_ui.inventory_list,_ui.inventory_num,obj_tree_bark_loot);
			_wood_own=inventory_count_item(_ui.inventory_list,_ui.inventory_num,obj_wood_loot);
		
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
			
				// craft bark pants
				if (_my>=_ui.button_height+10+(_ui.button_height*5) && _my<=(_ui.button_height*7)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_tree_bark_loot;
					obj_need[0]=3;
					obj_own[0]=_tree_bark_own;
					create_object(obj_bark_pants, obj_resorces, obj_need, obj_own);
				}
			
				// craft bark headware
				if (_my>=_ui.button_height+10+(_ui.button_height*6) && _my<=(_ui.button_height*8)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_tree_bark_loot;
					obj_need[0]=2;
					obj_own[0]=_tree_bark_own;
					create_object(obj_bark_hat, obj_resorces, obj_need, obj_own);
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
				
				// craft stone pickaxe
				if (_my>=_ui.button_height+10+(_ui.button_height*5) && _my<=(_ui.button_height*7)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					obj_resorces[0]=obj_branch_loot;
					obj_resorces[1]=obj_stone_pebles_loot;
					obj_need[0]=1;
					obj_need[1]=2;
					obj_own[0]=_branch_own;
					obj_own[1]=_rock_own;
					create_object(obj_stone_pickaxe, obj_resorces, obj_need, obj_own);
				}
				

			}
		
			if (_ui.show_build==true){
				// build straw house
				if (_my>=_ui.button_height+10 && _my<=(_ui.button_height*2)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					build_object(obj_grass_house, obj_grass_loot, 10, _straw_own);
				}
				
				// build camp fire
				if (_my>=_ui.button_height*2+10 && _my<=(_ui.button_height*3)+10 && _mx>=_ui.x_size_ui-_ui.craft_menu_width+_ui.button_width+16 && _mx<=_ui.x_size_ui-_ui.button_width*2-10){
					build_object(obj_camp_fire, obj_wood_loot, 3, _wood_own);
				}
			}
		}else{
			// Build placement
			if (_ui.show_build && object_get_parent(_ui.inv_selected) == obj_par_buildings) {
			    var _grid_x = mouse_x div 64;
			    var _grid_y = mouse_y div 64;
			    var _matrix_width = array_length(global.resource_matrix);
				var _inside_map = false;

				// Validate X before accessing the matrix
				if (_grid_x >= 2 && _grid_x < _matrix_width - 2) {
				    var _matrix_height = array_length(global.resource_matrix[_grid_x]);
				    // Now validate Y
				    _inside_map = _grid_y >= 2 && _grid_y < _matrix_height - 2;
				}
			    if (_inside_map) {

			        // Only allow placement on an unoccupied cell
			        var _cell_free = !global.resource_matrix[_grid_x][_grid_y];
			        var _build_x = _grid_x * 64 + 32;
			        var _build_y = _grid_y * 64 + 32;

			        // Do not place a building directly on the player
			        if (_cell_free && !position_meeting(_build_x, _build_y, obj_you)) {

			            // Create building at the center of the selected grid cell
						var _new_building = instance_create_layer(_build_x, _build_y, "Instances", _ui.inv_selected);
						scr_track_building_change(_new_building);
						global.resource_matrix[_grid_x][_grid_y] = true;

			            // Consume the required resources only after successful placement
			            var _remaining = _ui.build_resource_cost;

			            for (var _i = 0; _i < array_length(_ui.inventory_list); _i++) {
			                if (_ui.inventory_list[_i] == _ui.build_resource && _remaining > 0) {
			                    var _take = min(_ui.inventory_num[_i], _remaining);
			                    _ui.inventory_num[_i] -= _take;
			                    _remaining -= _take;
			                    if (_ui.inventory_num[_i] <= 0) {
			                        _ui.inventory_num[_i] = 0;
			                        _ui.inventory_list[_i] = noone;
			                        _ui.inventory_equiped[_i] = false;
			                    }
			                }
			            }

			            // Clear pending placement
			            _ui.inv_selected = noone;
			            _ui.inv_selected_slot = -1;
			            _ui.build_resource = noone;
			            _ui.build_resource_cost = 0;
			        } else {
			            _ui.show_text_no_resources = true;
			            _ui.text_no_resources = "Cannot build here";
			        }
			    } else {
			        _ui.show_text_no_resources = true;
			        _ui.text_no_resources = "Cannot build outside the map";
			    }
			}
		}
	}
}

function create_object(_obj_created, _obj_resources, _resource_need, _resource_own){
	var _ui=obj_ui;
	var _craft=inventory_has_resources(_obj_resources,_resource_need,_resource_own);
	if (!_craft){
		for (var _missing=0; _missing<array_length(_obj_resources); _missing++){
			if (_obj_resources[_missing]!=noone && _resource_need[_missing]>_resource_own[_missing]){
				show_ui_text(_ui,_resource_need[_missing],_resource_own[_missing]);
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
							if (_ui.inventory_list[i]==_obj_resources[k]){
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

function build_object(_obj_created, _obj_resources, _resource_need, _resource_own) {
    var _ui = obj_ui;

    if (_resource_need <= _resource_own) {
        // Select the building, but do NOT consume resources yet
        _ui.inv_selected = _obj_created;
        _ui.inv_selected_slot = -1;

        _ui.build_resource = _obj_resources;
        _ui.build_resource_cost = _resource_need;
    } else {
        show_ui_text(_ui, _resource_need, _resource_own);
    }
}

function show_ui_text(_ui,_resource_need, _resource_own){
	_ui.show_text_no_resources=true;
	missing_resources=_resource_need-_resource_own;
	_ui.text_no_resources="Need "+string(missing_resources)+" more resources";
}
