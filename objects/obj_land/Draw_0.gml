/// @description Insert description here
// You can write your code in this editor
if (gen_mob_lvl1){
	instance_create_layer(irandom_range(0,room_width),irandom_range(0,room_height),"Instances", obj_enemy_lvl0);
	gen_mob_lvl1=false;
	alarm[0]=5000;
}