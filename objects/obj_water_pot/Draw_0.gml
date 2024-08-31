/// @description shandows and shake
draw_self();
if(hp<1 && no_resources == false){
	for (var _i=0;_i<max_coacaze_drop;_i++){
		var _inst = instance_create_layer(x,y,"Instances",obj_water_loot);
		_inst.on_floor = true;
	}
	sprite_index = spr_water_pot_empty;
	no_resources = true;
}