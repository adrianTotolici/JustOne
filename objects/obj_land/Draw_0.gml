/// @description Insert description here
// You can write your code in this editor
if (gen_mob_lvl1){
	xpos=irandom_range(0,room_width);
	ypos=irandom_range(0,room_height);
	instance_create_layer(xpos,ypos,"Instances", obj_enemy_lvl0);
	gen_mob_lvl1=false;
	alarm[0]=5000;
}