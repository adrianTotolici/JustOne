/// @description Insert description here
draw_set_alpha(0.3);
draw_ellipse_color(x-10,y-5,x+10,y+3,c_black,c_black,false);
draw_set_alpha(1);
draw_self();

if (hp>1 && show_healthbar){
	var _health_percentage = hp / max_health;
	var _bar_width = 25;
	var _bar_height = 5;
	var _bar_x = x - _bar_width / 2;
	var _bar_y = y - 50;

	draw_set_color(c_black);
	draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_width, _bar_y + _bar_height, false);

	draw_set_color(c_red);
	draw_rectangle(_bar_x, _bar_y, _bar_x + (_bar_width * _health_percentage), _bar_y + _bar_height, false);
	
	obj_ui.show_enemy_health=true;
	obj_ui.enemy_health=hp;
	obj_ui.enemy_max_health=max_health;
}

if (hp<1){
	hit=true;
}