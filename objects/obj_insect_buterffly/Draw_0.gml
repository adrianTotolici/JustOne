/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (hp<1){
	var _inst_butterfy_wing = instance_create_layer(x,y,"Instances",obj_butterfly_wings);
	_inst_butterfy_wing.on_floor=true;
}
