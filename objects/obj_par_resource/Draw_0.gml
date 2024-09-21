/// @description shandows and shake
if (shadow==true){
	draw_set_alpha(0.3);
	draw_ellipse_color(x-sprite_width/2,y-5,x+sprite_width/2,y+3,c_black,c_black,false);
	draw_set_alpha(1);
}
draw_self();

if (shake==true) {
	var _ran_x = irandom_range(-3,3);
	var _ran_y = irandom_range(-3,3);
	draw_sprite_ext(sprite_index, image_index, x+_ran_x, y+_ran_y,image_xscale, image_yscale,0,c_white,1);
}else{
	draw_self();
}

if (show_healthbar && hp > 1) {
	var _health_percentage = hp / max_hp;
	var _bar_width = 25;
	var _bar_height = 5;
	var _bar_x = x - _bar_width / 2;
	var _bar_y = y - 50;

	draw_set_color(c_black);
	draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_width, _bar_y + _bar_height, false);

	draw_set_color(c_red);
	draw_rectangle(_bar_x, _bar_y, _bar_x + (_bar_width * _health_percentage), _bar_y + _bar_height, false);
}