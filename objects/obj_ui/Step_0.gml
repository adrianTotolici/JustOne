/// @description Follow Player
x=obj_you.x;
y=obj_you.y;

var mx=device_mouse_x_to_gui(0);
var my=device_mouse_y_to_gui(0);

if (my>=y_size_ui-sprite_size){
	if (mx>=x_size_ui/2-sprite_size*2 && mx<=x_size_ui/2+sprite_size*20){
		obj_you.state=player_state.quick_inventory;
	}
}