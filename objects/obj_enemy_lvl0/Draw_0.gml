/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(hp<1){
	var _inst_rot_meet = instance_create_layer(x,y,"Instances",obj_rotten_meet);
	_inst_rot_meet.on_floor=true;
	shadow=false;
}
