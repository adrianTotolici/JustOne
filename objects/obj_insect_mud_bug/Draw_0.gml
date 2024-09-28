/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (hp<1){
	var _inst_bug_shell = instance_create_layer(x,y,"Instances",obj_bug_shell);
	_inst_bug_shell.on_floor=true;
}
