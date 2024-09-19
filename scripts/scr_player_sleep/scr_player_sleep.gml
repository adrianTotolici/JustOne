// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_sleep(){
	if (obj_you.hp<100){
		obj_you.hp += 0.5;
	}
	
	if (mouse_check_button(mb_left)){
		player_instance=instance_find(obj_you,0);
		image_xscale=-1;
		state=PLAYER_STATE.CONTROLS;	
		player_instance.visible=true;
		_building=obj_you.building_instance_used;
		_building.sprite_index=spr_grass_house;
	}
}