/// @description Player UI && show inventory
x=obj_you.x;
y=obj_you.y;

var _mx=device_mouse_x_to_gui(0);
var _my=device_mouse_y_to_gui(0);

//press help button
if ((mouse_check_button_pressed(mb_left) && _my>=0 && _my<=button_height && _mx>=x_size_ui-button_width && _mx<=x_size_ui) || keyboard_check_released(vk_f1)){
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
if (mouse_check_button_pressed(mb_left) && _my>=0 && _my<=button_height && _mx>=x_size_ui-(button_width*2) && _mx<=x_size_ui-button_width){
	switch (show_crafting){
		case false:{
			show_crafting=true;
			show_player_equipment=false;
			show_build=false;
		}
		break;
		case true:
		show_crafting=false;
		show_tools=false;
		show_equipment=false;
		show_build=false;
		break;
	}
}

//press player equipment button
if (mouse_check_button_pressed(mb_left) && _my>=0 && _my<=button_height && _mx>=x_size_ui-(button_width*3) && _mx<=x_size_ui-button_width*2){
	switch (show_player_equipment){
		case false:{
			show_player_equipment=true;
			show_crafting=false;
			show_build=false;
			show_equipment=false;
			show_tools=false;
		}
		break;
		case true:
		show_player_equipment=false;
		break;
	}
}

// press build button
if (mouse_check_button_pressed(mb_left) && (_my>=0 && _my<=button_height) && (_mx>=x_size_ui-(button_width*4) && _mx<=x_size_ui-button_width*3)){
	switch (show_build){
		case false:{
			show_build=true;
			show_crafting=false;
			show_player_equipment=false;			
			show_equipment=false;
			show_tools=false;
		}
		break;
		case true:
		show_build=false;
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
			obj_you.state=PLAYER_STATE.INVENTORY;
		}
	}
}

if (show_text_no_resources && start_alarm){
	alarm[0]=60;
	start_alarm=false;
}