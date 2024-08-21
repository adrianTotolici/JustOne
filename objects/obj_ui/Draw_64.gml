/// @description Draw Quick Invetory
var _mx=device_mouse_x_to_gui(0);
var _my=device_mouse_y_to_gui(0);
var _middle_box = (array_length(slot_list)-1) div 2;
var _text_to_display = "Just One v0.0.2";

draw_set_font(fnt_info_text);
draw_set_color(c_black);
draw_text(0, 0,_text_to_display);

for(var _i=0;_i<array_length(slot_list);_i++){
	draw_sprite(spr_ui,0,x_size_ui/2+(sprite_size*(_i-_middle_box)),y_size_ui);
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

