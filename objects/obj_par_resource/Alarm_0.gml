/// @description Draw object in camera view

if not (x >= obj_you.x-window_get_width()/2 && x <= obj_you.x+window_get_width()/2 && y >= obj_you.y-window_get_height()/2 && y<= obj_you.y+window_get_height()/2){
	instance_deactivate_object(self);
}
instance_activate_region(obj_you.x-window_get_width()/2, obj_you.y-window_get_height()/2,window_get_width(), window_get_height(), true);

alarm[0] = 30;