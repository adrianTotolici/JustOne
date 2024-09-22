// Enable borderless fullscreen
window_enable_borderless_fullscreen(true);

// Set the window to fullscreen
window_set_fullscreen(true);

view_wport[0] = window_get_width();
view_hport[0] = window_get_height();
camera_set_view_size(view_camera[0], view_wport[0], view_hport[0]);