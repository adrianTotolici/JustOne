// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_crafting(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	
	if (mouse_check_button_pressed(mb_left)){
		if (_ui.show_equipment==true){
			// craft straw armor
			if (_my>=(_ui.button_height*2)+5 && _my>=0 && _my<=(_ui.button_height*2)+10){
				var ingredient = false;
				var count_ing = 0;
				var ing_need = 4;
				for (i=0;i<array_length(_ui.inventory_list); i++){
					if (_ui.inventory_list[i]=obj_grass_loot){
						count_ing+=_ui.inventory_num[i];
						if (count_ing>=ing_need){
							ingredient= true;
							break;
						}
					}
				}
				if (ingredient==false){
					for (j=0;j<array_length(_ui.inventory_list); j++){
						if (_ui.inventory_list[j]==noone){
							_ui.inventory_list[j]=obj_straw_armor;
							_ui.inventory_num[j]+=1;
							for (i=0; i<array_length(_ui.inventory_list); i++){
								if (_ui.inventory_list[i]=obj_grass_loot){
									if (_ui.inventory_num[i]>ing_need){
										_ui.inventory_num[i]-=ing_need;
									}else{
										ing_need-=_ui.inventory_num[i];
										_ui.inventory_list[i]=noone;
										_ui.inventory_num[i]=0;
										if (ing_need==0){
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
		}
	}

}