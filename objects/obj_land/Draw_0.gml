/// @description Insert description here
// You can write your code in this editor
if (gen_mob_lvl1){
	//xpos=irandom_range(0,room_width);
	//ypos=irandom_range(0,room_height);
	xpos=obj_you.x;
	ypos=obj_you.y-128;
	instance_create_layer(xpos,ypos,"Instances", obj_enemy_lvl0);
	gen_mob_lvl1=false;
	alarm[0]=1000;
}