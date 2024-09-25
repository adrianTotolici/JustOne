// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_armor(){
	var _owner = obj_you;
	var _img=ceil(_owner.image_index)-1;
	var _scale_equipment=0.8;
	x=_owner.x;
	y=_owner.y;
	player_instance=instance_find(obj_you,0);
	if (player_instance.visible) {
		for (i=0; i<array_length(obj_you.ware_armor); i++){
			if (obj_you.ware_armor[i]!=noone){
				draw_sprite_ext(obj_you.ware_armor[i][0], obj_you.ware_armor[i][1], obj_you.x, obj_you.y, obj_you.image_xscale, obj_you.image_yscale, 0,c_white,1);
			}
		}
	}
}