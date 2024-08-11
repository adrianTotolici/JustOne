/// @description Vars
gpu_set_tex_filter(false);
game_set_speed(60, gamespeed_fps);
view_x=camera_get_view_x(view_camera[0]);
view_y=camera_get_view_y(view_camera[0]);

size_w=640;
size_h=360;

window_size_w=1280;
window_size_h=720;
window_set_size(window_size_w,window_size_h);

var _monitor_size_w=display_get_width();
var _monitor_size_h=display_get_height();
window_set_position(_monitor_size_w/2-window_size_w/2,_monitor_size_h/2-window_size_h/2)