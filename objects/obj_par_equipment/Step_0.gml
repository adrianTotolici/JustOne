/// @description Insert description here
depth=obj_you.depth-1;
if (on_floor==true){
	if (mouse_check_button_pressed(mb_left)){
		var _inst = instance_position(mouse_x, mouse_y, all);
		if (_inst != noone) {
			with (_inst) {
				x = mouse_x;
				y = mouse_y;
				scr_inventory_add();
			}
		}
	}
}
