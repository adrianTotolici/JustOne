/// @description Player UI && show inventory
x=obj_you.x;
y=obj_you.y;

var _mx=device_mouse_x_to_gui(0);
var _my=device_mouse_y_to_gui(0);

//press help button
if ((mouse_check_button_pressed(mb_left) && _my>=0 && _my<=y_size_ui+button_height && _mx>=x_size_ui-button_width && _mx<=x_size_ui) || keyboard_check_released(vk_f1)){
	switch (show_help){
		case false:{
			show_help=true;
		}
		break;
		case true:{
			show_help=false;	
		}
		break;
	}
}

// press crafting button
if (mouse_check_button_pressed(mb_left) && _my>=0 && _my<=y_size_ui+button_height && _mx>=x_size_ui-(button_width*2) && _mx<=x_size_ui-button_height){
	switch (show_crafting){
		case false:{
			show_crafting=true;
		}
		break;
		case true:
		show_crafting=false;
		show_tools=false;
		show_equipment=false;
		break;
	}
}

//press player equipment button
if (mouse_check_button_pressed(mb_left) && _my>=0 && _my<=y_size_ui+button_height && _mx>=x_size_ui-(button_width*3) && _mx<=x_size_ui-button_height*2){
	switch (show_player_equipment){
		case false:{
			show_player_equipment=true;
		}
		break;
		case true:
		show_player_equipment=false;
		break;
	}
}

//press equipment crafting button
if (mouse_check_button_pressed(mb_left) && _my>=button_height+9 && _my<=(button_height*2)+9 && _mx>=x_size_ui-craft_menu_width+6 && _mx<=x_size_ui-craft_menu_width+6+button_width && show_crafting){
	switch (show_equipment){
		case false:{
			show_equipment=true;
			show_tools=false;
		}
		break;
		case true:{
			show_equipment=false;
		}
		break;
	}
}

//press tool crafting button
if (mouse_check_button_pressed(mb_left) && _my>=(button_height*2)+12 && _my<=(button_height*3)+12 && _mx>=x_size_ui-craft_menu_width+6 && _mx<=x_size_ui-craft_menu_width+6+button_width && show_crafting){
	switch (show_tools){
		case false:{
			show_tools=true;
			show_equipment=false;
		}
		break;
		case true:{
			show_tools=false;
		}
		break;
	}
}

if (keyboard_check_released(ord("I"))){
	switch (show_inv){
		case false:
			show_inv=true;
			obj_you.state=PLAYER_STATE.INVENTORY;
			break;
		case true:
			show_inv=false;
			inv_selected=noone;
			obj_you.state=PLAYER_STATE.CONTROLS;
			break;
	}
}

if (show_inv == false){
	if (_my>=y_size_ui-sprite_size){
		if (_mx>=x_size_ui/2-sprite_size*2-16 && _mx<=x_size_ui/2+sprite_size*2+16){
			obj_you.state=PLAYER_STATE.QUICK_INVENTORY;
		}
	}
}

if (keyboard_check(vk_anykey)){
	var _key_pressed = keyboard_lastkey;
	switch(_key_pressed){
		case ord("1"):
			if (slot_list[0] != noone){
				var _par=object_get_parent(slot_list[0]);
				if (obj_you.equipped!=slot_list[0]){
					if (_par==obj_par_equipment){
						obj_you.equipped=slot_list[0];
						with (obj_par_equipment) {
							instance_destroy();
						}
						instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[0]);
					}
				}
			}
			break;

		case ord("2"):
			if (slot_list[1] != noone){
				var _par=object_get_parent(slot_list[1]);
				if (obj_you.equipped!=slot_list[1]){
					if (_par==obj_par_equipment){
						obj_you.equipped=slot_list[1];
						with (obj_par_equipment) {
							instance_destroy();
						}
						instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[1]);
					}
				}
			}
			break;
			
		case ord("3"):
			if (slot_list[2]!=noone){
				var _par=object_get_parent(slot_list[2]);
				if (obj_you.equipped!=slot_list[2]){
					if (_par==obj_par_equipment){
						obj_you.equipped=slot_list[2];
						with (obj_par_equipment) {
							instance_destroy();
						}
						instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[2]);
					}
				}
			}
			break;
			
		case ord("4"):
			if (slot_list[3]!=noone){
				var _par=object_get_parent(slot_list[3]);
				if (obj_you.equipped!=slot_list[3]){
					if (_par==obj_par_equipment){
						obj_you.equipped=slot_list[3];
						with (obj_par_equipment) {
							instance_destroy();
						}
						instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[3]);
					}
				}
			}
			break;
			
		case ord("5"):
			if (slot_list[4] != noone){
				var _par=object_get_parent(slot_list[4]);
				if (obj_you.equipped!=slot_list[4]){
					if (_par=obj_par_equipment){
						obj_you.equipped=slot_list[4];
						with (obj_par_equipment) {
							instance_destroy();
						}
						instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[4]);
					}
				}
			}
			break;
		default:
			break;
	}
}