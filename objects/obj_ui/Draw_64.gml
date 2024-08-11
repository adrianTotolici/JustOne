/// @description Draw Quick Invetory
var _mx=device_mouse_x_to_gui(0);
var _my=device_mouse_y_to_gui(0);
var _middle_box = (array_length(slot_list)-1) div 2;

for(var _i=0;_i<array_length(slot_list);_i++){
	draw_sprite(spr_ui,0,x_size_ui/2+(sprite_size*(_i-_middle_box)),y_size_ui);
}

for (var _i=0;_i<array_length(slot_list);_i++){
	if (slot_list[_i]!=noone){
		if (slot_selected_list[_i] == false){
			draw_sprite(slot_list[_i],0,x_size_ui/2+(sprite_size*(_i-_middle_box)),y_size_ui);
		}else{
			draw_sprite(slot_list[_i],0,_mx,_my);
		}
	}
}