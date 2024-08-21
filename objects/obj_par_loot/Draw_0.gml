/// @description shadow
draw_set_alpha(0.3);
if (initialize==false){
	draw_ellipse_color(x-sprite_width/2,shadow_y-5,x+sprite_width/2, shadow_y+3, c_black,c_black,false);
}else{
	draw_ellipse_color(x-sprite_width/2,y-5,x+sprite_width/2, y+3, c_black,c_black,false);
}
draw_set_alpha(1);
draw_self();