/// @description shandows and shake
event_inherited();
if(hp<1){
	for (var _i=0;_i<max_mud_drop;_i++){
		instance_create_layer(x,y,"Instances",obj_mud_loot);
	}
	instance_destroy();
}