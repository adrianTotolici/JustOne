/// @description shandows and shake
event_inherited();
if(hp<1 && no_resources == false){
	for (var _i=0;_i<max_brench_drop;_i++){
		var _inst = instance_create_layer(x,y,"Instances",obj_branch_loot);
		_inst.on_floor = true;
	}
	sprite_index = spr_branch_pile_empty;
	no_resources = true;
	shadow=false;
}