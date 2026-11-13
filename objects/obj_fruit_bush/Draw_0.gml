/// @description shandows and shake
event_inherited();
if(hp<1 && no_resources == false){
	for (var _i=0;_i<max_coacaze_drop;_i++){
		var _inst = instance_create_layer(x,y,"Instances",obj_coacaze_loot);
		_inst.on_floor=true;
	}
	instance_create_layer(x,y,"Instances", obj_insect_buterffly);
	sprite_index = spr_fruit_bush_empty;
	alarm[0]=600*speed;
	scr_track_resource_change(id);
	no_resources = true;
	hit=true;
}

if (hp>1 && no_resources == false){
	sprite_index = spr_fruit_bush;
}