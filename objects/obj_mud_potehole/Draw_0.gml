/// @description shandows and shake
event_inherited();
if(hp<1){
	for (var _i=0;_i<max_mud_drop;_i++){
		var _inst = instance_create_layer(x,y,"Instances",obj_mud_loot);
		_inst.on_floor = true;
	}
	instance_destroy();
}