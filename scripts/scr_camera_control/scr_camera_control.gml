// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_camera_control(){
	view_x=camera_get_view_x(view_camera[0]);
	view_y=camera_get_view_y(view_camera[0]);
	
	if (mouse_wheel_down()){
		if (size_w<960){
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
		for (i=0;i<5;i++){
			if (window_size_w==(640+(i*width_step))){
				window_size_w=(640+((i+1)*width_step));
				window_size_h=(360+((i+1)*height_step));
				window_set_size(window_size_w,window_size_h);
				break;
			}
		}
	}else if (keyboard_check_pressed(vk_subtract)){
		for (i=0;i<5;i++){
			if (window_size_w==(640+(i+1)*width_step)){
				window_size_w=(640+(i*width_step));
				window_size_h=(360+(i*height_step));
				window_set_size(window_size_w,window_size_h);
				break;
			}
		}
		
	}
	window_set_position(_monitor_size_w/2-window_size_w/2,_monitor_size_h/2-window_size_h/2);
}