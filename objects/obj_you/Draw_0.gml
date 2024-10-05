/// @description shadow
draw_set_alpha(0.3);
draw_ellipse_color(x-10,y-5,x+10,y+3,c_black,c_black,false);
draw_set_alpha(1);
draw_self();

if (show_end_game){
	sprite_index=spr_player_die;
	if (image_index >= image_number - 1) {
    // Freeze the animation
    image_speed = 0;
    // Ensure it stays on the last frame
    image_index = image_number - 1;
}
	draw_set_font(fnt_lost_game);
	draw_set_color(c_black);
	draw_text(x, y,"Game LOST")
}