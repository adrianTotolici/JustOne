/// @description shandows and shake
event_inherited();
if(hp<1){
	for (var _i=0;_i<max_coacaze_drop;_i++){
		instance_create_layer(x,y,"Instances",obj_coacaze_loot);
	}
	instance_destroy();
}