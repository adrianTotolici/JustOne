/// @description Draw Quick Invetory
draw_sprite(spr_health,0,20,55);
draw_sprite(spr_hunger,0,20,85);
draw_sprite(spr_thirst_ui,0,20,115);
draw_healthbar(40,30,250,50,obj_you.hp,c_black,c_red,c_red,0,true,true);
draw_healthbar(40,60,250,80,obj_you.hunger, c_black, c_green, c_green,0,true,true);
draw_healthbar(40,90,250,110,obj_you.thirst, c_black, c_blue, c_blue,0,true,true);
var _total_armor= obj_you.head_armor+obj_you.body_armor+obj_you.leg_armor+obj_you.hand_armor+obj_you.feet_armor;
if (_total_armor > 0){
	draw_sprite(spr_armor_ui,0,20,145);
	draw_healthbar(40,120,250,140,_total_armor, c_black, c_grey, c_grey,0,true,true);
}

var _mx=device_mouse_x_to_gui(0);
var _my=device_mouse_y_to_gui(0);

draw_set_font(fnt_info_text);
draw_set_color(c_black);
draw_text(40, 0,_text_to_display);
draw_text(40, 10, "FPS = " + string(fps));

draw_sprite(spr_help,0,x_size_ui-button_width,0);
draw_sprite(spr_craft_ui,0,x_size_ui-button_width*2,0);
draw_sprite(spr_equipment_ui, 0, x_size_ui-button_width*3,0);
draw_sprite(spr_build_ui, 0, x_size_ui-button_width*4,0);

if (show_crafting){
	draw_sprite_stretched(spr_craft_ui_menu,0,x_size_ui-craft_menu_width,button_height,craft_menu_width,craft_menu_height);
	draw_sprite(spr_equipment_ui,0,x_size_ui-craft_menu_width+6,button_height+9);
	draw_sprite(spr_tools_ui,0,x_size_ui-craft_menu_width+6,button_height*2+12);
}

if (show_equipment){
	draw_set_font(fnt_info_crafting);
		
	draw_sprite(spr_straw_armor, 0, x_size_ui-craft_menu_width+button_width+32,button_height*2+10);
	draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*2-10, text_straw_armor_rec);
	draw_sprite(spr_grass_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*2+5);
		
	draw_sprite(spr_straw_hat, 0, x_size_ui-craft_menu_width+button_width+32,button_height*3+10);
	draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*3-10, text_straw_hat_rec);
	draw_sprite(spr_grass_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*3+5);
		
	draw_sprite(spr_straw_pants, 0, x_size_ui-craft_menu_width+button_width+32,button_height*4+10);
	draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*4-10, text_straw_pants_rec);
	draw_sprite(spr_grass_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*4+5);
		
	draw_sprite(spr_straw_sock, 0, x_size_ui-craft_menu_width+button_width+32,button_height*5+10);
	draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*5-10, text_straw_footware_rec);
	draw_sprite(spr_grass_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*5+5);
}

if (show_tools){
	draw_set_font(fnt_info_crafting);
	draw_sprite(spr_stick,0, x_size_ui-craft_menu_width+button_width+32,button_height*2+10);
	draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*2-10, text_stick);
	draw_sprite(spr_branch_loot, 0, x_size_ui-craft_menu_width+button_width*4,button_height*2+5)
		
	draw_sprite(spr_rock,0,x_size_ui-craft_menu_width+button_width+32,button_height*3+10);
	draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*3-10, text_rock);
	draw_sprite(spr_rock_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*3+5);
		
	draw_sprite(spr_straw_mug,0,x_size_ui-craft_menu_width+button_width+32,button_height*4+10);
	draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*4-10, text_straw_mug);
	draw_sprite(spr_grass_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*4+5);
}

if (show_build){
	draw_sprite_stretched(spr_craft_ui_menu,0,x_size_ui-craft_menu_width,button_height,craft_menu_width,craft_menu_height);
	
	draw_set_font(fnt_info_crafting);
	draw_sprite_ext(spr_grass_house, 0, x_size_ui-craft_menu_width+button_width+32, button_height*2+10, 0.5, 0.5,0,c_white,1);
	draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*2-10, text_straw_house);
	draw_sprite(spr_grass_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*2+5);
		
	if (inv_selected!=noone){
		draw_sprite_ext(object_get_sprite(inv_selected),0,_mx,_my,1,1,0,c_white,0.5);
	}
}

if (show_inv){
	draw_sprite_ext(spr_inventory,0,x_size_ui/2,y_size_ui-_heigh_diff_inventory,1.5,1.5,0,c_white,1);
	if (inv_selected!=noone){
		draw_sprite_ext(object_get_sprite(inv_selected),0,_mx,_my,1,1,0,c_white,0.5);
	}
	var _j=0;
	var _a=0;
	var _b=0;
	for (var _i=0; _i<array_length(inventory_list);_i++){
		if (_a >=_inv_nr_columns){
			_a=0;
			_j+=1;
		}
		if (inventory_list[_i] != noone){
			var _xpos=x_size_ui/2+((inventory_sprite_size/_inv_nr_columns)*(_a-_middle_box_inv))+((inventory_sprite_size/_inv_nr_columns)/2);
			var _ypos=y_size_ui-(_heigh_diff_inventory+(inventory_sprite_size/2)-((inventory_sprite_size/_inv_nr_columns)/2)-8)+((inventory_sprite_size/_inv_nr_columns)*_j);
			
			draw_sprite_ext(object_get_sprite(inventory_list[_i]),0,_xpos, _ypos, 1,1,0,c_white,1);
			draw_set_halign(fa_center);
			draw_text(_xpos,_ypos,inventory_num[_i]);
			
			if (inventory_equiped[_i] == true){
				draw_sprite_ext(spr_selected_equipment,0,_xpos,_ypos-10, 1.2, 1.2,0,c_white,1);
				var _par=object_get_parent(inventory_list[_i]);
				if (_par==obj_par_items || _par==obj_par_wepons){
					obj_you.equipped=inventory_list[_i];
					// equip weappon or item in hand
					if (_par==obj_par_items){with (obj_par_items) {instance_destroy();}}
					else{ if (_par==obj_par_wepons){with (obj_par_wepons) {instance_destroy();}}}
					instance_create_layer(obj_you.x, obj_you.y, "Player", inventory_list[_i]);
				}
				if (_par==obj_par_armors){
					// obj_you.equipped=inventory_list[_i];
					// equip weappon or item in hand
					instance_create_layer(obj_you.x, obj_you.y, "Player", inventory_list[_i]);
				}
			}
		}
		_a+=1;
	}
}

if (show_help){
	draw_set_font(fnt_help_text);
	draw_set_color(c_black);
	help_pos_x=(x_size_ui/2)-((x_size_ui/2)/2);
	draw_text(help_pos_x, 0, help_move_text);
	draw_text(help_pos_x, 36, help_inventory);
	draw_text(help_pos_x, 36*2, help_quick_inventory);
	draw_text(help_pos_x, 36*3, help_crafting);
	draw_text(help_pos_x, 36*4, help_ui_close);
	draw_text(help_pos_x, 36*5, help_exit_main_menu);
}

if (show_player_equipment){
	draw_sprite(spr_player_equipment_ui,0,20,y_size_ui/2);
	
	// check if headware is equiped
	if (obj_you.head_equipment!=noone){
		var _x_pos=40;
		var _y_pos=y_size_ui/2-70;
		draw_sprite_ext(spr_backgorud_equiped,0,_x_pos+2,_y_pos+4,0.7,0.7,0,c_white,1);
		switch (obj_you.head_equipment){
			case obj_straw_hat:
				draw_sprite_ext(spr_straw_hat,0,_x_pos,_y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_hat,0,20,y_size_ui/2);
				break;
			default:
				break;
		}	
	}
	
	//check if bodyware is equiped
	if (obj_you.body_equipment!=noone){
		var _x_pos=128;
		var _y_pos=y_size_ui/2-10;
		draw_sprite_ext(spr_backgorud_equiped,0,_x_pos+2,_y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.body_equipment){
			case obj_straw_armor:
				draw_sprite_ext(spr_straw_armor,0,_x_pos,_y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_armor,0,20,y_size_ui/2);
				break;
			default:
				break;
		}
	}
	
	// check if legware is equiped
	if (obj_you.leg_equipment!=noone){
		var _x_pos=120;
		var _y_pos=y_size_ui/2+53;
		draw_sprite_ext(spr_backgorud_equiped,0,_x_pos+2,_y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.leg_equipment){
			case obj_straw_pants:
				draw_sprite_ext(spr_straw_pants,0,_x_pos,_y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_legware,0,20,y_size_ui/2);
				break;
			default:
				break;
		}
	}
	
	// check if footware left is equiped
	if (obj_you.left_foot_equipment!=noone){
		var _y_pos=y_size_ui/2+90;
		var _x_pos=63;
		draw_sprite_ext(spr_backgorud_equiped,0,_x_pos+2,_y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.left_foot_equipment){
			case obj_straw_footwear:
				draw_sprite_ext(spr_straw_sock,0,_x_pos,_y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_left_foot,0,20,y_size_ui/2);
				break;
			default:
				break;
		}
	}
	
	// check if footware right is equiped
	if (obj_you.right_foot_equipment!=noone){
		var _y_pos=y_size_ui/2+90;
		var _x_pos=92;
		draw_sprite_ext(spr_backgorud_equiped,0,_x_pos+2,_y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.right_foot_equipment){
			case obj_straw_footwear:
				draw_sprite_ext(spr_straw_sock,0,_x_pos,_y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_right_foot,0,20,y_size_ui/2);
				break;
			default:
				break;
		}
	}
	
	//check if weapon is equiped
	if (obj_you.equipped != noone){
		var _y_pos=y_size_ui/2-20;
		var _x_pos=34;
		draw_sprite_ext(spr_backgorud_equiped,0,_x_pos+2,_y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.equipped){
			case obj_rock:
				draw_sprite_ext(spr_rock,0,_x_pos+2,_y_pos-5,0.85,0.85,0,c_white,1);
				break;
			case obj_stick:
				draw_sprite_ext(spr_stick,0,_x_pos,_y_pos,0.85,0.85,0,c_white,1);
				break;
			case obj_straw_mug:
				draw_sprite_ext(spr_straw_mug,0,_x_pos,_y_pos,0.85,0.85,0,c_white,1);
			default:
				break;
		}
	}
}

for(var _i=0;_i<array_length(slot_list);_i++){
	draw_sprite(spr_quickinventory,0,x_size_ui/2+(sprite_size*(_i-_middle_box)),y_size_ui);
}

for (var _i=0;_i<array_length(slot_list);_i++){
	if (slot_list[_i] !=noone){
		if (slot_selected_list[_i] == false){
			draw_sprite(object_get_sprite(slot_list[_i]),0,x_size_ui/2+(sprite_size*(_i-_middle_box)),y_size_ui);
		}else{
			draw_sprite(object_get_sprite(slot_list[_i]),0,_mx,_my);
		}
	}
}

