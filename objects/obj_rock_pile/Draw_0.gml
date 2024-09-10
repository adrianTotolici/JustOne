/// @description shandows and shake
event_inherited();
if(hp<1 && no_resources == false){
	for (var _i=0;_i<max_pebels_drop;_i++){
		var _inst = instance_create_layer(x,y,"Instances",obj_stone_pebles_loot);
		_inst.on_floor = true;
	}
	sprite_index = spr_stone_harvested;
	no_resources = true;
	shadow=false;
}