/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (on_floor==false){
	scr_draw_armor();
}else{
	draw_set_alpha(0.3);
	draw_ellipse_color(x-sprite_width/2, y-5, x+sprite_width/2, y+3, c_black, c_black, false);
	draw_set_alpha(1);
	draw_self();
}

