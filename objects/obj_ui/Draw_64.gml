/// @description Draw Quick Invetory
draw_sprite(spr_health,0,20,60);
draw_sprite(spr_hunger,0,20,90);
draw_healthbar(40,30,250,50,obj_you.hp,c_black,c_red,c_red,0,true,true);
draw_healthbar(40,60,250,80,obj_you.hunger, c_black, c_green, c_green,0,true,true);

var _mx=device_mouse_x_to_gui(0);
var _my=device_mouse_y_to_gui(0);

draw_set_font(fnt_info_text);
draw_set_color(c_black);
draw_text(40, 0,_text_to_display);

draw_sprite(spr_help,0,x_size_ui-button_width,0);
draw_sprite(spr_craft_ui,0,x_size_ui-button_width*2,0);

switch (show_crafting){
	case true:
		draw_sprite_stretched(spr_craft_ui_menu,0,x_size_ui-craft_menu_width,button_height,craft_menu_width,craft_menu_height);
		draw_sprite(spr_equipment_ui,0,x_size_ui-craft_menu_width+6,button_height+9);
		draw_sprite(spr_tools_ui,0,x_size_ui-craft_menu_width+6,button_height*2+12);
}

switch (show_equipment){
	case true:
		draw_sprite(spr_straw_armor, 0, x_size_ui-craft_menu_width+button_width+32,button_height*2+10)
		draw_sprite(spr_straw_hat, 0, x_size_ui-craft_menu_width+button_width+32,button_height*3+10)
		draw_sprite(spr_straw_pants, 0, x_size_ui-craft_menu_width+button_width+32,button_height*4+10)
		draw_sprite(spr_straw_sock, 0, x_size_ui-craft_menu_width+button_width+32,button_height*5+10)
}

switch (show_tools){
	case true:
		draw_sprite(spr_stick,0, x_size_ui-craft_menu_width+61,button_height*2+5);
		draw_sprite(spr_rock,0,x_size_ui-craft_menu_width+61,button_height*3);
}

if (show_inv){
	draw_sprite(spr_inventory,0,x_size_ui/2,y_size_ui-_heigh_diff_inventory);
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
			var _ypos=y_size_ui-(_heigh_diff_inventory+(inventory_sprite_size/2)-((inventory_sprite_size/_inv_nr_columns)/2)-5)+((inventory_sprite_size/_inv_nr_columns)*_j);
			
			draw_sprite(object_get_sprite(inventory_list[_i]),0,_xpos,_ypos);
			draw_set_halign(fa_center);
			draw_text(_xpos,_ypos-2,inventory_num[_i]);
		}
		_a+=1;
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

