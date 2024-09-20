/// @description shandows and shake
draw_self();
if(hp<1 && no_resources == false){
	for (var _i=0;_i<max_coacaze_drop;_i++){
		var _inst = instance_create_layer(x,y,"Instances",obj_water_loot);
		_inst.on_floor = true;
	}
	instance_create_layer(x,y,"Instances", obj_insect_mud_bug);
	switch(spr_number){
		case 1:
			sprite_index = spr_water_pot_empty_1;
			break;
		case 2:
			sprite_index = spr_water_pot_empty_2;
			break;
		case 3:
			sprite_index = spr_water_pot_empty_3;
			break;
	}
	no_resources = true;
	hit=true;
}

if (hp>1 && no_resources == false){
	switch(spr_number){
		case 1:
			sprite_index = spr_water_pot_1;
			break;
		case 2:
			sprite_index = spr_water_pot_2;
			break;
		case 3:
			sprite_index = spr_water_pot_3;
			break;
	}
}