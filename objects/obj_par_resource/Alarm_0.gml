/// @description Draw object in camera view
var buffer=150

if not (x >= obj_you.x-(window_get_width()/2)-buffer && x <= obj_you.x+(window_get_width()/2)+buffer && y >= obj_you.y-(window_get_height()/2)-buffer && y<= obj_you.y+(window_get_height()/2)+buffer){
	instance_deactivate_object(self);
}
instance_activate_region(obj_you.x-(window_get_width()/2)-buffer, obj_you.y-(window_get_height()/2)-buffer, window_get_width()+buffer, window_get_height()+buffer, true);

alarm[0] = 10*speed;