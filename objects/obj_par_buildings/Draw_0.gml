/// @description Insert description here
// You can write your code in this editor
	depth=obj_you.depth+1;
	draw_set_alpha(0.3);
	draw_ellipse_color(x-10,y-5,x+10,y+3,c_black,c_black,false);
	draw_set_alpha(1);
	draw_self();

