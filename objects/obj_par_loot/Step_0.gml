/// @description Main
depth=-y;
if (path_index==-1){
	initialize=true;
}
if (initialize==true){
	if (instance_place(x,y,obj_par_loot)){
		move_outside_all(irandom(360),2);
	}else{
		if (mouse_check_button_pressed(mb_left)){
			var _inst = instance_position(mouse_x, mouse_y, all);
			if (_inst != noone){
				if (_inst.loot && _inst.on_floor) {
					with (_inst) {
						x = mouse_x;
						y = mouse_y;
						scr_inventory_add();
					}
				}
			}
		}
	}
}