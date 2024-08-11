/// @description Follow Player
x=obj_you.x;
y=obj_you.y;

var _mx=device_mouse_x_to_gui(0);
var _my=device_mouse_y_to_gui(0);

if (_my>=y_size_ui-sprite_size){
	if (_mx>=x_size_ui/2-sprite_size*2 && _mx<=x_size_ui/2+sprite_size*20){
		obj_you.state=PLAYER_STATE.QUICK_INVENTORY;
	}
}