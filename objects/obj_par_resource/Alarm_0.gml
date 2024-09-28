/// @description Draw object in camera view
var _buffer=150

if not (x >= obj_you.x-(window_get_width()/2)-_buffer && x <= obj_you.x+(window_get_width()/2)+_buffer && y >= obj_you.y-(window_get_height()/2)-_buffer && y<= obj_you.y+(window_get_height()/2)+_buffer){
	instance_deactivate_object(self);
}
instance_activate_region(obj_you.x-(window_get_width()/2)-_buffer, obj_you.y-(window_get_height()/2)-_buffer, window_get_width()+_buffer, window_get_height()+_buffer, true);

alarm[0] = 10*speed;