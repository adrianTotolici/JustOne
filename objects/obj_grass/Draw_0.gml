/// @description shandows and shake
event_inherited();
if(hp<1){
	var ran_loot =irandom(2);
	for (i=0;i<ran_loot;i++){
		instance_create_layer(x,y,"Instances",obj_grass_loot);
	}
	instance_destroy();
	//for (i=0;i<array_length(obj_ui.slot_list);i++){
	//	if (obj_ui.slot_list[i] == noone){
	//		obj_ui.slot_list[i]=obj_grass;
	//		break;
	//	}
	//}
}