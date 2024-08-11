/// @description Draw Quick Invetory
var mx=device_mouse_x_to_gui(0);
var my=device_mouse_y_to_gui(0);
var middle_box = (array_length(slotList)-1) div 2;

for(i=0;i<array_length(slotList);i++){
	draw_sprite(spr_ui,0,x_size_ui/2+(sprite_size*(i-middle_box)),y_size_ui);
}

for (i=0;i<array_length(slotList);i++){
	if (slotList[i]!=noone){
		if (slotSelectedList[i] == false){
			draw_sprite(slotList[i],0,x_size_ui/2+(sprite_size*(i-middle_box)),y_size_ui);
		}else{
			draw_sprite(slotList[i],0,mx,my);
		}
	}
}