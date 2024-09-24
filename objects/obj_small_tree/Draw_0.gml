/// @description Insert description here
// Inherit the parent event
event_inherited();



if(hp<1 && no_resources == false){
	for (var _i=0;_i<max_wood_drop;_i++){
		var _inst_wood = instance_create_layer(x,y,"Instances",obj_wood_loot);
		_inst_wood.on_floor=true;
	}
	for (var _i=0;_i<max_brench_drop;_i++){
		var _inst_branch = instance_create_layer(x,y,"Instances",obj_branch_loot);
		_inst_branch.on_floor=true;
	}
	for (var _i=0;_i<max_brench_drop;_i++){
		var _inst_branch = instance_create_layer(x,y,"Instances",obj_tree_bark_loot);
		_inst_branch.on_floor=true;
	}
	sprite_index = spr_small_tree_empty;
	no_resources = true;
	hit=true;
	shadow=false;
}