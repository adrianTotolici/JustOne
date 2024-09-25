/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (on_floor){
	depth = obj_you.depth+1;
	draw_set_alpha(0.3);
	draw_ellipse_color(x-sprite_width/2, y-5, x+sprite_width/2, y+3, c_black, c_black, false);
	draw_set_alpha(1);
	draw_self();
}else{
	scr_draw_armor();
}

