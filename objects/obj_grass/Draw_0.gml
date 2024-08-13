/// @description shandows and shake
draw_set_alpha(0.3);
draw_ellipse_color(x-sprite_width/2,y-5,x+sprite_width/2,y+3,c_black,c_black,false);
draw_set_alpha(1);
draw_self();

if (shake==true) {
	var ran_x = irandom_range(-3,3);
	var ran_y = irandom_range(-3,3);
	draw_sprite_ext(sprite_index, image_index, x+ran_x, y+ran_y,image_xscale, image_yscale,0,c_white,1);
}else{
	draw_self();
}
if(hp<1){
	instance_destroy();
	for (i=0;i<array_length(obj_ui.slot_list);i++){
		if (obj_ui.slot_list[i] == noone){
			obj_ui.slot_list[i]=obj_grass;
			break;
		}
	}
}