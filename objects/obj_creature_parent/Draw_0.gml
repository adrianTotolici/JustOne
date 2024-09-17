/// @description Insert description here
draw_set_alpha(0.3);
draw_ellipse_color(x-10,y-5,x+10,y+3,c_black,c_black,false);
draw_set_alpha(1);
draw_self();

if (hp>1 && show_healthbar){
	var health_percentage = hp / max_health;
	var bar_width = 25;
	var bar_height = 5;
	var bar_x = x - bar_width / 2;
	var bar_y = y - 50;

	draw_set_color(c_black);
	draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

	draw_set_color(c_red);
	draw_rectangle(bar_x, bar_y, bar_x + (bar_width * health_percentage), bar_y + bar_height, false);
}