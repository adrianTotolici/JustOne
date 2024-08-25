/// @description Insert description here
depth=obj_you.depth-1;
if (on_floor==true){
	if (mouse_check_button_pressed(mb_left)){
		if (instance_position(mouse_x,mouse_y,self)){
			scr_inventory_add();
		}
	}
}
