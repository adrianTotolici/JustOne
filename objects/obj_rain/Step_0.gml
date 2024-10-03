/// @description Insert description here
// You can write your code in this editor
if (raining==true){
	part_emitter_region(rain_system, rain_emitter, 0, obj_you.x+(window_get_width()/2), obj_you.y-(window_get_height()/2), obj_you.y-(window_get_height()/2), ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(rain_system, rain_emitter, rain_particle, 30);
	obj_you.hp-=0.001;
}