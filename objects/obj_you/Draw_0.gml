/// @description shadow
draw_set_alpha(0.3);
draw_ellipse_color(x-10,y-5,x+10,y+3,c_black,c_black,false);
draw_set_alpha(1);
draw_self();

if (show_end_game){
	draw_set_font(fnt_lost_game);
	draw_set_color(c_black);
	draw_text(x, y,"Game LOST")
}