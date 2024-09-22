function scr_camera_control(){
	view_x=camera_get_view_x(view_camera[0]);
	view_y=camera_get_view_y(view_camera[0]);
	
	if (mouse_wheel_down()){
		if (size_w<view_get_wport(0)){
			size_w+=32;
			size_h+=18;
			camera_set_view_size(view_camera[0],size_w,size_h);
			camera_set_view_border(view_camera[0],size_w,size_h);
		}
	}else if (mouse_wheel_up()){
		if (size_w>320){
			size_w-=32;
			size_h-=18;
			camera_set_view_size(view_camera[0],size_w,size_h);
			camera_set_view_border(view_camera[0],size_w,size_h);
		}
	}
	
	var _monitor_size_w=display_get_width();
	var _monitor_size_h=display_get_height();
	width_step=128;
	height_step=72;
	
	if (keyboard_check_pressed(vk_add)){
		for (i=0;i<10;i++){
			if (window_size_w==(window_get_width()+(i*width_step))){
				window_size_w=(window_get_width()+((i+1)*width_step));
				window_size_h=(window_get_height()+((i+1)*height_step));
				window_set_size(window_size_w,window_size_h);
				break;
			}
		}
	}else if (keyboard_check_pressed(vk_subtract)){
		for (i=0;i<10;i++){
			if (window_size_w==(window_get_width()+(i+1)*width_step)){
				window_size_w=(window_get_width()+(i*width_step));
				window_size_h=(window_get_height()+(i*height_step));
				window_set_size(window_size_w,window_size_h);
				break;
			}
		}
		
	}
	window_set_position(_monitor_size_w/2-window_size_w/2,_monitor_size_h/2-window_size_h/2);
}