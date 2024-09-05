/// @description Draw Quick Invetory
draw_sprite(spr_health,0,20,60);
draw_sprite(spr_hunger,0,20,90);
draw_sprite(spr_thirst_ui,0,20,120);
draw_healthbar(40,30,250,50,obj_you.hp,c_black,c_red,c_red,0,true,true);
draw_healthbar(40,60,250,80,obj_you.hunger, c_black, c_green, c_green,0,true,true);
draw_healthbar(40,90,250,110,obj_you.thirst, c_black, c_blue, c_blue,0,true,true);
total_armor= obj_you.head_armor+obj_you.body_armor+obj_you.leg_armor+obj_you.hand_armor+obj_you.feet_armor;
if (total_armor > 0){
	draw_healthbar(40,120,250,140,total_armor, c_black, c_grey, c_grey,0,true,true);
}


var _mx=device_mouse_x_to_gui(0);
var _my=device_mouse_y_to_gui(0);

draw_set_font(fnt_info_text);
draw_set_color(c_black);
draw_text(40, 0,_text_to_display);

draw_sprite(spr_help,0,x_size_ui-button_width,0);
draw_sprite(spr_craft_ui,0,x_size_ui-button_width*2,0);
draw_sprite(spr_equipment_ui, 0, x_size_ui-button_width*3,0);

switch (show_crafting){
	case true:
		draw_sprite_stretched(spr_craft_ui_menu,0,x_size_ui-craft_menu_width,button_height,craft_menu_width,craft_menu_height);
		draw_sprite(spr_equipment_ui,0,x_size_ui-craft_menu_width+6,button_height+9);
		draw_sprite(spr_tools_ui,0,x_size_ui-craft_menu_width+6,button_height*2+12);
}

switch (show_equipment){
	case true:
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

switch (show_tools){
	case true:
		draw_set_font(fnt_info_crafting);
		draw_sprite(spr_stick,0, x_size_ui-craft_menu_width+button_width+32,button_height*2+10);
		draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*2-10, "N/A");
		//draw_sprite(spr_grass_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*2+5);
		
		draw_sprite(spr_rock,0,x_size_ui-craft_menu_width+button_width+32,button_height*3+10);
		draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*3-10, "N/A");
		//draw_sprite(spr_grass_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*3+5);
		
		draw_sprite(spr_straw_mug,0,x_size_ui-craft_menu_width+button_width+32,button_height*4+10);
		draw_text(x_size_ui-craft_menu_width+button_width*3,button_height*4-10, text_straw_mug);
		draw_sprite(spr_grass_loot,0,x_size_ui-craft_menu_width+button_width*4,button_height*4+5);
}

if (show_inv){
	//draw_sprite(spr_inventory,0,x_size_ui/2,y_size_ui-_heigh_diff_inventory);
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
				var _par=object_get_parent(object_get_parent(inventory_list[_i]));
				if (_par==obj_par_equipment){
					obj_you.equipped=inventory_list[_i];
					with (obj_par_equipment) {
						instance_destroy();
					}
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
	draw_text(x_size_ui/2-(x_size_ui/2/2), 0, help_move_text);
	draw_text(x_size_ui/2-(x_size_ui/2/2), 36, help_inventory);
	draw_text(x_size_ui/2-(x_size_ui/2/2), 36*2, help_quick_inventory);
	draw_text(x_size_ui/2-(x_size_ui/2/2), 36*3, help_crafting);
	draw_text(x_size_ui/2-(x_size_ui/2/2), 36*4, help_ui_close);
	draw_text(x_size_ui/2-(x_size_ui/2/2), 36*5, help_exit_main_menu);
}

if (show_player_equipment){
	draw_sprite(spr_player_equipment_ui,0,20,y_size_ui/2);
	
	// check if headware is equiped
	if (obj_you.head_equipment!=noone){
		x_pos=40;
		y_pos=y_size_ui/2-70;
		draw_sprite_ext(spr_backgorud_equiped,0,x_pos+2,y_pos+4,0.7,0.7,0,c_white,1);
		switch (obj_you.head_equipment){
			case obj_straw_hat:
				draw_sprite_ext(spr_straw_hat,0,x_pos,y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_hat,0,20,y_size_ui/2);
				break;
			default:
				break;
		}	
	}
	
	//check if bodyeware is equiped
	if (obj_you.body_equipment!=noone){
		x_pos=128;
		y_pos=y_size_ui/2-10;
		draw_sprite_ext(spr_backgorud_equiped,0,x_pos+2,y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.body_equipment){
			case obj_straw_armor:
				draw_sprite_ext(spr_straw_armor,0,x_pos,y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_armor,0,20,y_size_ui/2);
				break;
			default:
				break;
		}
	}
	
	// check if legware is equiped
	if (obj_you.leg_equipment!=noone){
		x_pos=120;
		y_pos=y_size_ui/2+53;
		draw_sprite_ext(spr_backgorud_equiped,0,x_pos+2,y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.leg_equipment){
			case obj_straw_pants:
				draw_sprite_ext(spr_straw_pants,0,x_pos,y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_legware,0,20,y_size_ui/2);
				break;
			default:
				break;
		}
	}
	
	// check if footware left is equiped
	if (obj_you.left_foot_equipment!=noone){
		y_pos=y_size_ui/2+90;
		x_pos=63;
		
		draw_sprite_ext(spr_backgorud_equiped,0,x_pos+2,y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.left_foot_equipment){
			case obj_straw_footwear:
				draw_sprite_ext(spr_straw_sock,0,x_pos,y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_left_foot,0,20,y_size_ui/2);
				break;
			default:
				break;
		}
	}
	
	// check if footware right is equiped
	if (obj_you.right_foot_equipment!=noone){
		y_pos=y_size_ui/2+90;
		x_pos=92;
		draw_sprite_ext(spr_backgorud_equiped,0,x_pos+2,y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.right_foot_equipment){
			case obj_straw_footwear:
				draw_sprite_ext(spr_straw_sock,0,x_pos,y_pos,0.85,0.85,0,c_white,1);
				draw_sprite(spr_player_equipment_straw_right_foot,0,20,y_size_ui/2);
				break;
			default:
				break;
		}
	}
	
	//check if weapon is equiped
	if (obj_you.equipped != noone){
		y_pos=y_size_ui/2-20;
		x_pos=34;
		draw_sprite_ext(spr_backgorud_equiped,0,x_pos+2,y_pos,0.7,0.7,0,c_white,1);
		switch (obj_you.equipped){
			case obj_rock:
				draw_sprite_ext(spr_rock,0,x_pos+2,y_pos-5,0.85,0.85,0,c_white,1);
				//draw_sprite(spr_player_equipment_straw_legware,0,20,y_size_ui/2);
				break;
			case obj_stick:
				draw_sprite_ext(spr_stick,0,x_pos,y_pos,0.85,0.85,0,c_white,1);
				//draw_sprite(spr_player_equipment_straw_legware,0,20,y_size_ui/2);
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

