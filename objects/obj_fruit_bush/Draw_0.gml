/// @description shandows and shake
event_inherited();
if(hp<1 && no_resources == false){
	for (var _i=0;_i<max_coacaze_drop;_i++){
		var inst = instance_create_layer(x,y,"Instances",obj_coacaze_loot);
		inst.on_floor=true;
	}
	sprite_index = spr_fruit_bush_empty;
	no_resources = true;
}